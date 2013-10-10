#1
##  Categories and data Types:

##  #FIXME: Next Version should allow to define new categories dynamically.
##  each category then should come with a name, a tester, a functor and lattice info. 
##

###############################################################################
##
#C  Graphs()
##
##  Graphs are the base category used by \YAGS. This category contains
##  all graphs that can be represented in \YAGS. 
##
DeclareCategory("Graphs",IsObject);

###############################################################################
##
#C  LooplessGraphs()
##
##  Loopless Graphs are graphs which have no loops.
##
DeclareCategory("LooplessGraphs",Graphs);

###############################################################################
##
#C  UndirectedGraphs()
##
##  Undirected Graphs are graphs which have no directed arrows.
##
DeclareCategory("UndirectedGraphs",Graphs);

###############################################################################
##
#C  OrientedGraphs()
##
##  Oriented Graphs are graphs which have arrows in only one direction
##  between any two vertices. 
##
DeclareCategory("OrientedGraphs",LooplessGraphs);

###############################################################################
##
#C  SimpleGraphs()
##
##  Simple Graphs are graphs with no loops and undirected.
#
DeclareCategory("SimpleGraphs",LooplessGraphs and UndirectedGraphs);
InstallTrueMethod(SimpleGraphs,LooplessGraphs and UndirectedGraphs);

BindGlobal("DefaultGraphCategory",SimpleGraphs);
###############################################################################
##
#F              SetDefaultGraphCategory( <C> )
##
##  Sets category C to be the default category for graphs. The default
##  category is used, for instance, when constructing new graphs. 
##
##  \beginexample
##  SetDefaultGraphCategory(Graphs);
##  G:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  \endexample
##
##  $$
##  \xymatrix{
##     {\bullet} \ar@(dr,dl)[d] \ar[dr] & {\bullet} \ar[d]\\
##     {\bullet} \ar@(ul,ur)[u] \ar[ur] & {\bullet} \ar[l] 
##  }
##  $$
##
##  RandomGraph creates a random graphs belonging to the category
##  graphs. The above graph has loops which are not permitted in
##  simple graphs.
##  
##  \beginexample
##  SetDefaultGraphCategory(SimpleGraphs);
##  G:=CopyGraph(G);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies :=
##  [ [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  \endexample
##
##  Now G is a simple graph.
##
##  $$
##  \xymatrix{
##     {\bullet} \ar[dr] & & {\bullet} \ar[ll]\\
##     & {\bullet} \ar[ur] & 
##  }
##  $$
##
##
DeclareGlobalFunction("SetDefaultGraphCategory");
BindGlobal("AvailableGraphCategories",
   [SimpleGraphs,OrientedGraphs,UndirectedGraphs,LooplessGraphs,Graphs]);

############################################################################
##
#F  GraphCategory( [<G>, ... ] );
##
##  Returns the minimal common category to a list of graphs. See
##  Section "Categories" for the relationship among categories.
##   
##  If the list is empty the default category is returned. 
##
DeclareGlobalFunction("GraphCategory"); #common graph ctgy or default.

############################################################################
##
#F  TargetGraphCategory( [<G>, ... ] );
##
##  Returns the category which will be used to process a list of
##  graphs. If an option category has been given it will return that
##  category. Otherwise it will behave as Function <GraphCategory>
##  ("GraphCategory"). See Section "Categories" for the relationship
##  among categories. 
##
DeclareGlobalFunction("TargetGraphCategory"); # option or graph or default ctgy.

###############################################################################
##
#O  in(<G>,<C>)
##
##  Returns `true' if graph <G> belongs to category <C> and `false' otherwise.
##
InstallMethod(\in,"for graph categories", true, [Graphs,IsOperation],0, 
function(x,f)
  if f in AvailableGraphCategories then
    return f(x); 
  else
    TryNextMethod();
  fi;
end);

DeclareRepresentation( "IsGraphStdRep",IsAttributeStoringRep , ["GraphCategory","AdjMatrix"] );
GraphFamily:=NewFamily("GraphFamily");
GraphType:=NewType(GraphFamily,Graphs and IsGraphStdRep);

AuxInfo:="/dev/null"; #FIXME replace with a better mechanism.

##
##  Attributes and Properties:
##
############################################################################
##
#A  AdjMatrix(<G>)
##
##  The adjacency matrix of graph <G>.
##
DeclareAttribute("AdjMatrix",Graphs);

############################################################################
##
#A  Order(<G>)
##
##  The order, <i.e.> number of vertices, of graph <G>.
##
DeclareAttribute("Order",Graphs);

############################################################################
##
#A  Size(<G>)
##
##  The size, <i.e.> number of arrows or edges of graph <G>.
##
DeclareAttribute("Size",Graphs);

############################################################################
##
#A  VertexNames(<G>)
##
##  A list of all vertices in graph <G>.
##
DeclareAttribute("VertexNames",Graphs);

############################################################################
##
#Q  IsCompleteGraph(<G>)
##
##  The attribute form is `true' if graph <G> is complete.
##  The property form measures how far graph <G> is from being complete.
##
DeclareQtfyProperty("IsCompleteGraph",Graphs);

############################################################################
##
#Q  IsLoopless(<G>)
##
##  The attribute form is `true' if graph <G> has no loops.
##  The property form measures how far graph <G> is from being
##  loopless, <i.e.> the number of loops in <G>.
##
DeclareQtfyProperty("IsLoopless",Graphs);

############################################################################
##
#Q  IsUndirected(<G>)
##
##  The attribute form is `true' if graph <G> has only edges and no arrows.
##  The property form measures how far graph <G> is from being
##  undirected, <i.e.> the number of arrows in <G>.
##
DeclareQtfyProperty("IsUndirected",Graphs);

############################################################################
##
#Q  IsOriented(<G>)
##
##  The attribute form is `true' if graph <G> has only arrows.
##  The property form measures how far graph <G> is from being
##  oriented, <i.e.> the number of edges in <G>.
##
DeclareQtfyProperty("IsOriented",Graphs);

##
##  Get Info about graphs:
##
############################################################################
##
#O  IsSimple(<G>)
##
##  Returns `true' if the graph <G> is simple regardless of its category.
##
DeclareOperation("IsSimple",[Graphs]);

############################################################################
##
#O  QtfyIsSimple( <G> )
##
##  Returns how far is graph <G> from being simple.
##
DeclareOperation("QtfyIsSimple",[Graphs]);

############################################################################
##
#O  IsComplete( <G>, <L> )
##
##  Returns true if <L> induces a complete subgraph of <G>
##
DeclareOperation("IsComplete",[Graphs,IsList]);

############################################################################
##
#O  Vertices( <G> )
##
##  Returns the list [1..Order( <G> )]
##
DeclareOperation("Vertices",[Graphs]);

############################################################################
##
#O  IsEdge( <G> , <List>)
##
##  Returns true if <List> is an edge of <G> 
##
DeclareOperation("IsEdge",[Graphs,IsList]);

############################################################################
##
#O  Adjacency( <G>, <V> )
##
##  Returns the adjacency list of vertex <V> in <G>.
##
DeclareOperation("Adjacency",[Graphs,IsInt]);

############################################################################
##
#O  Adjacencies( <G> )
##
##  Returns the adjacencies list of graph <G>
##
DeclareOperation("Adjacencies",[Graphs]);

############################################################################
##
#O  VertexDegree( <G>, <V> )
##
##  Returns the degree (number of adjacencies) of vertex <V> in Graph <G>. 
##
DeclareOperation("VertexDegree",[Graphs,IsInt]);

############################################################################
##
#O  VertexDegrees( <G> )
##
##  Returns a list with the degrees of all vertices in graph <G>.
##
DeclareAttribute("VertexDegrees",Graphs);

############################################################################
##
#O  MaxDegree( <G> )
##
##  Returns the maximum degree in graph <G>.
##
DeclareOperation("MaxDegree",[Graphs]);

############################################################################
##
#O  MinDegree( <G> )
##
##  Returns the minimum degree in graph <G>.
##
DeclareOperation("MinDegree",[Graphs]);

############################################################################
##
#O  Edges( <G> )
##
##  Returns a list of all edges in graph <G>. Each edge is represented
##  as $[i,j]$ indicating there is an edge from vertex <i> to vertex <j>. 
##
DeclareOperation("Edges",[Graphs]);

##  
##  Functions to create graphs:
##
############################################################################
##
#O  Graph( <R> )
##
##  Creates a graph from the record <R>. There are two representations
##  from which a graph can be created:
##  \beginlist
##  \item{1.}
##  From an adjacency list.
##  \item{2.}
##  From an adjacencies matrix.
##  \endlist
##  The record must, therefore, provide a field <Adjacencies> containing
##  the list of adjacencies for each vertex or alternatively a field
##  <AdjMatrix> with the adjacency matrix. Additionaly we must provide
##  the category, or categories, to which the new graph belongs. 
##  
DeclareOperation("Graph",[IsRecord]);

############################################################################
##
#F  GraphByAdjMatrix( <M> )
##
##  Creates a graph from an adjacency matrix <M>. The matrix <M> must
##  be a square boolean matrix. The category to which the graph
##  created belongs is the default category. For more information on
##  categories see Section Categories("Categories").
##
DeclareGlobalFunction("GraphByAdjMatrix");

############################################################################
##
#F  GraphByAdjacencies( <A> )
##
##  Creates a graph from a list of adjacencies <A>. The category to
##  which the graph created belongs is the default category. For more
##  information on Section Categories("Categories").
##  
DeclareGlobalFunction("GraphByAdjacencies");

############################################################################
##
#F  GraphByCompleteCover( <C> )
##
##  Creates a complete cover graph os size <C>.
##
DeclareGlobalFunction("GraphByCompleteCover");

############################################################################
##
#F  GraphByRelation( <V>, <R> )
#F  GraphByRelation( <N>, <R> )
##
##  Creates a graph from a relation.
##
DeclareGlobalFunction("GraphByRelation");

############################################################################
##
#F  IntersectionGraph( <L> )
##
##  Creates a graph from list <L> where <L> is an intersection list.
##
DeclareGlobalFunction("IntersectionGraph");
## #FIXME: Include GraphByEdges?

##
##  New graphs from old graphs:
##
############################################################################
##
#O  CopyGraph( <G> ) 
##
##  Creates a fresh copy of graph <G>.
##
DeclareOperation("CopyGraph",[Graphs]); 

############################################################################
##
#O  InducedSubgraph( <G>, <V> )
##
##  Creates an induced graph from graph <G> using only vertices <V>.
##
DeclareOperation("InducedSubgraph",[Graphs,IsList]);

############################################################################
##
#O  RemoveVertices( <G>, <V> )
##
##  Creates a graph from graph <G> removing vertices <V>.
##
DeclareOperation("RemoveVertices",[Graphs,IsList]);

############################################################################
##
#O  AddEdges( <G>, <E> )
##
##  Creates a graph from graph <G> adding the set of edges <E>.
##
DeclareOperation("AddEdges",[Graphs,IsList]);

############################################################################
##
#O  RemoveEdges( <G>, <E> )
##
##  Creates a graph from graph <G> removing edges <E>.
##
DeclareOperation("RemoveEdges",[Graphs,IsList]);
## #FIXME: Include AddComplete, AddAdjacencies?

#E





