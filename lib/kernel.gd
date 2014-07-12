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
##
DeclareCategory("SimpleGraphs",LooplessGraphs and UndirectedGraphs);
InstallTrueMethod(SimpleGraphs,LooplessGraphs and UndirectedGraphs);

BindGlobal("DefaultGraphCategory",SimpleGraphs);
###############################################################################
##
#F  SetDefaultGraphCategory( <C> )
##
##  Sets category C to be the default category for graphs. The default
##  category is used, for instance, when constructing new graphs. 
##
##  \beginexample
##  gap> SetDefaultGraphCategory(Graphs);
##  gap> g:=RandomGraph(4);
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
##  gap> SetDefaultGraphCategory(SimpleGraphs);
##  gap> g:=CopyGraph(g);
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
##  Returns the adjacency matrix of graph <G>.
##
##  \beginexample
##  gap> AdjMatrix(CycleGraph(4));
##  [ [ false, true, false, true ], [ true, false, true, false ], 
##    [ false, true, false, true ], [ true, false, true, false ] ]
##  \endexample
##  
##  --map
DeclareAttribute("AdjMatrix",Graphs);

############################################################################
##
#A  Order(<G>)
##
##  Returns the number of vertices, of graph <G>.
##
##  \beginexample
##  gap> Order(Icosahedron);
##  12
##  \endexample
##  
##  --map
DeclareAttribute("Order",Graphs);

############################################################################
##
#A  Size(<G>)
##
##  Returns the number of edges of graph <G>.
##
##  \beginexample
##  gap> Size(Icosahedron);
##  30
##  \endexample
##  
##  --map
DeclareAttribute("Size",Graphs);

############################################################################
##
#A  VertexNames(<G>)
##
##  Return the list of names of the vertices of <G>. The vertices of a graph in \YAGS\ are always 
##  $\{1,2, \ldots, Order(G)\}$, but depending on how the graph was constructed, its vertices may 
##  have also some <names>, that help us identify the origin of the vertices. \YAGS\ will always try 
##  to store meaninful names for the vertices. For example, in the case of the LineGraph, the vertex 
##  names of the new graph are the edges of the old graph.
##
##  \beginexample
##  gap> g:=LineGraph(DiamondGraph);          
##  Graph( Category := SimpleGraphs, Order := 5, Size := 8, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4, 5 ], [ 1, 2, 5 ], [ 1, 2, 5 ], [ 2, 3, 4 ] ] )
##  gap> VertexNames(g);
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 3, 4 ] ]
##  gap> Edges(DiamondGraph);
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 3, 4 ] ]
##  \endexample
##  
##  --map
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
##  Returns true if <L> induces a complete subgraph of <G>.
##
##  \beginexample
##  gap> IsComplete(DiamondGraph,[1,2,3]);
##  true
##  gap> IsComplete(DiamondGraph,[1,2,4]);
##  false
##  \endexample
##  
##  --map
DeclareOperation("IsComplete",[Graphs,IsList]);

############################################################################
##
#O  Vertices( <G> )
##
##  Returns the list [1..Order( <G> )].
##
##  \beginexample
##  gap> Vertices(Icosahedron);
##  [ 1 .. 12 ]
##  \endexample
##  
##  --map
DeclareOperation("Vertices",[Graphs]);

############################################################################
##
#O  IsEdge( <G> , [x,y])
##
##  Returns true if [x,y] is an edge of <G>.
##
##  \beginexample
##  gap> IsEdge(PathGraph(3),[1,2]);
##  true
##  gap> IsEdge(PathGraph(3),[1,3]);
##  false
##  \endexample
##  
##  --map
DeclareOperation("IsEdge",[Graphs,IsList]);

############################################################################
##
#O  Adjacency( <G>, <v> )
##
##  Returns the adjacency list of vertex <v> in <G>.
##
##  \beginexample
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> Adjacency(g,1);           
##  [ 2 ]
##  gap> Adjacency(g,2);
##  [ 1, 3 ]
##  \endexample
##  
##  --map
DeclareOperation("Adjacency",[Graphs,IsInt]);

############################################################################
##
#O  Adjacencies( <G> )
##
##  Returns the adjacency lists of graph <G>.
##
##  \beginexample
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> Adjacencies(g);  
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ]
##  \endexample
##  
##  --map
DeclareOperation("Adjacencies",[Graphs]);

############################################################################
##
#O  VertexDegree( <G>, <v> )
##
##  Returns the degree of vertex <v> in Graph <G>. 
##
##  \beginexample
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> VertexDegree(g,1);
##  1
##  gap> VertexDegree(g,2);
##  2
##  \endexample
##  
##  --map
DeclareOperation("VertexDegree",[Graphs,IsInt]);

############################################################################
##
#O  VertexDegrees( <G> )
##
##  Returns the list of degrees of the vertices in graph <G>.
##
##  \beginexample
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 7, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> VertexDegrees(g);
##  [ 4, 2, 3, 3, 2 ]
##  \endexample
##  
##  --map
DeclareAttribute("VertexDegrees",Graphs);

############################################################################
##
#O  MaxDegree( <G> )
##
##  Returns the maximum degree in graph <G>.
##
##  \beginexample
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 7, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> MaxDegree(g);
##  4
##  \endexample
##  
##  --map
DeclareOperation("MaxDegree",[Graphs]);

############################################################################
##
#O  MinDegree( <G> )
##
##  Returns the minimum degree in graph <G>.
##
##  \beginexample
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 7, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> MinDegree(g);
##  2
##  \endexample
##  
##  --map
DeclareOperation("MinDegree",[Graphs]);

############################################################################
##
#O  Edges( <G> )
##
##  Returns the list of edges of graph <G>.  
##
##  \beginexample
##  gap> Edges(CompleteGraph(4));
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 2, 4 ], [ 3, 4 ] ]
##  \endexample
##
##  --map
DeclareOperation("Edges",[Graphs]);

##  
##  Functions to create graphs:
##
############################################################################
##
#O  Graph( <R> )
##
##  Returns a new graph created from the record <R>. The record must provide the field <Category> 
##  and either the field <Adjacencies> or the field <AdjMatrix>
##  
##  \beginexample
##  gap> Graph(rec(Category:=SimpleGraphs,Adjacencies:=[[2],[1]]));
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> Graph(rec(Category:=SimpleGraphs,AdjMatrix:=[[false, true],[true, false]]));
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  \endexample
##  
##  Its main purpose is to import graphs from files, which could have been 
##  previously exported using `PrintTo'.
##  
##  \beginexample
##  gap> g:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> PrintTo("aux.g","h1:=",g,";");
##  gap> Read("aux.g");
##  gap> h1;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  \endexample
##  
##  --map
DeclareOperation("Graph",[IsRecord]);

############################################################################
##
#F  GraphByAdjMatrix( <M> )
##  
##  Returns a new graph created from an adjacency matrix <M>. The matrix <M> must
##  be a square boolean matrix.
##  
##  \beginexample
##  gap> m:=[ [ false, true, false ], [ true, false, true ], [ false, true, false ] ];;
##  gap> g:=GraphByAdjMatrix(m);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> AdjMatrix(g);
##  [ [ false, true, false ], [ true, false, true ], [ false, true, false ] ]
##  \endexample
##  
##  Note, however, that the graph is forced to comply with the `TargetGraphCategory'.
##  
##  \beginexample
##  gap> m:=[ [ true, true], [ false, false ] ];;
##  gap> g:=GraphByAdjMatrix(m);                
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> AdjMatrix(g);                          
##  [ [ false, true ], [ true, false ] ]
##  \endexample
##  
##  --map
DeclareGlobalFunction("GraphByAdjMatrix");

############################################################################
##
#F  GraphByAdjacencies( <A> )
##
##  Returns a new graph having <A> as its list of adjacencies. The order of the created graph is 
##  `Length(A)', and the set of neighbors of vertex $x$ is $A[x]$. 
##  
##  \beginexample
##  gap> GraphByAdjacencies([[2],[1,3],[2]]);      
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  \endexample
##  
##  Note, however, that the graph is forced to comply with the `TargetGraphCategory'.
##  
##  \beginexample
##  gap> GraphByAdjacencies([[1,2,3],[],[]]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2, 3 ], [ 1 ], [ 1 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalFunction("GraphByAdjacencies");

############################################################################
##
#F  GraphByCompleteCover( <C> )
##
##  Returns the minimal graph where the elements of <C> are 
##  (the vertex sets of) complete subgraphs.
##
##  \beginexample
##  gap> GraphByCompleteCover([[1,2,3,4],[4,6,7]]); 
##  Graph( Category := SimpleGraphs, Order := 7, Size := 9, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3, 6, 7 ], [  ], [ 4, 7 ], 
##    [ 4, 6 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalFunction("GraphByCompleteCover");

############################################################################
##
#F  GraphByRelation( <V>, <R> )
#F  GraphByRelation( <N>, <R> )
##
##  Returns a new graph created from a set of vertices $V$ and a binary relation $R$, 
##  where $x\sim y$ iff $R(x,y)=true$. In the second form, $N$ is an integer
##  and $V$ is assumed to be $\{1, 2, \ldots, N\}$.
##
##  \beginexample
##  gap> R:=function(x,y) return Intersection(x,y)<>[]; end;;          
##  gap> GraphByRelation([[1,2,3],[3,4,5],[5,6,7]],R);               
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> GraphByRelation(8,function(x,y) return AbsInt(x-y)<=2; end); 
##  Graph( Category := SimpleGraphs, Order := 8, Size := 13, Adjacencies := 
##  [ [ 2, 3 ], [ 1, 3, 4 ], [ 1, 2, 4, 5 ], [ 2, 3, 5, 6 ], [ 3, 4, 6, 7 ], 
##    [ 4, 5, 7, 8 ], [ 5, 6, 8 ], [ 6, 7 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("GraphByRelation");

############################################################################
##
#F  GraphByWalks( <walk1>, <walk2>,...)
##
##  Returns the minimal graph such that <walk1>, <walk2>, etc are walks.
##
##  \beginexample
##  gap> GraphByWalks([1,2,3,4,1],[1,5,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], [ 1, 6 ], [ 5 ] ] )
##  \endexample
## 
##  Walks can be <nested>, which greatly improves the versatility of this function.
##   
##  \beginexample
##  gap> GraphByWalks([1,[2,3,4],5],[5,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 5 ], [ 1, 2, 4, 5 ], [ 1, 3, 5 ], [ 2, 3, 4, 6 ], [ 5 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalFunction("GraphByWalks");

############################################################################
##
#F  IntersectionGraph( <L> )
##
##  Returns the intersection graph of the family of sets <L>. This graph has a vertex for 
##  every set in <L>, and two such vertices are adjacent iff the corresponding sets have non-empty intersection.
##  
##  \beginexample
##  gap> IntersectionGraph([[1,2,3],[3,4,5],[5,6,7]]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("IntersectionGraph");
## #FIXME: Include GraphByEdges?

##
##  New graphs from old graphs:
##
############################################################################
##
#O  CopyGraph( <G> ) 
##
##  Returns a fresh copy of graph <G>. Only the order and adjacency information is copied, 
##  all other known attributes of <G> are not. Mainly used to transform a graph from one category 
##  to another. The new graph will be forced to comply with the `TargetGraphCategory'.
##
##  \beginexample
##  gap> g:=CompleteGraph(4);                         
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> g1:=CopyGraph(g:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 4, Size := 6, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 3, 4 ], [ 4 ], [  ] ] )
##  gap> CopyGraph(g1:GraphCategory:=SimpleGraphs);     
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  \endexample
##  
##  --map
DeclareOperation("CopyGraph",[Graphs]); 

############################################################################
##
#O  InducedSubgraph( <G>, <V> )
##
##  Returns the subgraph of graph <G> induced by the vertex set <V>.
##  
##  \beginexample
##  gap> g:=CycleGraph(6);          
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2, 6 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4, 6 ], [ 1, 5 ] ] )
##  gap> InducedSubgraph(g,[3,4,6]);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 1, Adjacencies := 
##  [ [ 2 ], [ 1 ], [  ] ] )
##  \endexample
##
##  The order of the elements in <V> does matter.
##
##  \beginexample
##  gap> InducedSubgraph(g,[6,3,4]);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 1, Adjacencies := 
##  [ [  ], [ 3 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareOperation("InducedSubgraph",[Graphs,IsList]);

############################################################################
##
#O  RemoveVertices( <G>, <V> )
##
##  Returns a new graph created from graph <G> by removing the vertices in list <V>.
##
##  \beginexample
##  gap> g:=PathGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> RemoveVertices(g,[3]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1 ], [ 4 ], [ 3 ] ] )
##  gap> RemoveVertices(g,[1,3]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 1, Adjacencies := 
##  [ [  ], [ 3 ], [ 2 ] ] )
##  \endexample
##  
## --map
DeclareOperation("RemoveVertices",[Graphs,IsList]);

############################################################################
##
#O  AddEdges( <G>, <E> )
##
##  Returns a new graph created from graph <G> by adding the edges in list <E>.
##
##  \beginexample
##  gap> g:=CycleGraph(4);   
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> AddEdges(g,[[1,3]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3 ] ] )
##  gap> AddEdges(g,[[1,3],[2,4]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  \endexample
##  
## --map
DeclareOperation("AddEdges",[Graphs,IsList]);

############################################################################
##
#O  RemoveEdges( <G>, <E> )
##
##  Returns a new graph created from graph <G> by removing the edges in list <E>.
##
##  \beginexample
##  gap> g:=CompleteGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> RemoveEdges(g,[[1,2]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies := 
##  [ [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> RemoveEdges(g,[[1,2],[3,4]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 3, 4 ], [ 3, 4 ], [ 1, 2 ], [ 1, 2 ] ] )
##  \endexample
##  
## --map
DeclareOperation("RemoveEdges",[Graphs,IsList]);
## #FIXME: Include AddComplete, AddAdjacencies?

#E





