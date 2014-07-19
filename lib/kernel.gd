#1
##  Categories and data Types:

##  #FIXME: Next Version should allow to define new categories dynamically.
##  each category then should come with a name, a tester, a functor and lattice info. 
##

###############################################################################
##
#C  Graphs()
##
##  `Graphs' is the most general graph category in \YAGS. This category contains
##  all graphs that can be represented in \YAGS. A graph in this category may 
##  contain loops, arrows and edges (which in \YAGS\ are exactly the same as two opposite 
##  arrows between some pair of vertices). This graph category has no parent category.
##
##  \beginexample
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareCategory("Graphs",IsObject);

###############################################################################
##
#C  LooplessGraphs()
##
##  `LooplessGraphs' is a graph category in \YAGS. A graph in this category may 
##  contain arrows and edges but no loops. The parent of this category is `Graphs'
##
##  \beginexample
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=LooplessGraphs);  
##  Graph( Category := LooplessGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareCategory("LooplessGraphs",Graphs);

###############################################################################
##
#C  UndirectedGraphs()
##
##  `UndirectedGraphs' is a graph category in \YAGS. A graph in this category may 
##  contain edges and loops, but no arrows. The parent of this category is `Graphs'
##
##  \beginexample
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 1, 2 ], [ 1, 3 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareCategory("UndirectedGraphs",Graphs);

###############################################################################
##
#C  OrientedGraphs()
##
##  `OrientedGraphs' is a graph category in \YAGS. A graph in this category may 
##  contain arrows, but no loops or edges. The parent of this category is `LooplessGraphs'.
##
##  \beginexample
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [  ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareCategory("OrientedGraphs",LooplessGraphs);

###############################################################################
##
#C  SimpleGraphs()
##
##  `SimpleGraphs' is a graph category in \YAGS. A graph in this category may 
##  contain edges, but no loops or arrows. The category has two parents: `LooplessGraphs' 
##  and `UndirectedGraphs'.
##
##  \beginexample
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareCategory("SimpleGraphs",LooplessGraphs and UndirectedGraphs);
InstallTrueMethod(SimpleGraphs,LooplessGraphs and UndirectedGraphs);

BindGlobal("DefaultGraphCategory",SimpleGraphs);
###############################################################################
##
#F  SetDefaultGraphCategory( <C> )
##  
##  Sets the default graphs category to <C>. The default graph
##  category is used when constructing new graphs when no other graph category 
##  is indicated. New graphs are always forced to comply with the `TargetGraphCategory', 
##  so loops may be removed, and arrows may replaced by edges or viceversa, depending on 
##  the category that the new graph belongs to.
##  
##  The available graph categories are:  `SimpleGraphs', `OrientedGraphs', 
##  `UndirectedGraphs', `LooplessGraphs', and `Graphs'.
##  
##  \beginexample
##  gap> SetDefaultGraphCategory(Graphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(LooplessGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);  
##  Graph( Category := LooplessGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(UndirectedGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);    
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 1, 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(SimpleGraphs);    
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(OrientedGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);  
##  Graph( Category := OrientedGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [  ], [ 2 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("SetDefaultGraphCategory");
BindGlobal("AvailableGraphCategories",
   [SimpleGraphs,OrientedGraphs,UndirectedGraphs,LooplessGraphs,Graphs]);

############################################################################
##
#F  GraphCategory( [<G>, ... ] );
##
##  For internal use. Returns the minimal common category to a list of graphs.
##  If the list of graphs is empty, the default category is returned.
## 
##  The partial order (by inclussion) among graph categories is as follows: 
##  $$`SimpleGraphs' \<  `UndirectedGraphs' \< `Graphs',$$
##  $$`OrientedGraphs' \< `LooplessGraphs' \< `Graphs'$$  
##  $$`SimpleGraphs' \< `LooplessGraphs' \< `Graphs'$$
##   
##  \beginexample
##  gap> g1:=CompleteGraph(2:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [ 1 ] ] )
##  gap> g2:=CompleteGraph(2:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [  ] ] )
##  gap> g3:=CompleteGraph(2:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 2, Size := 3, Adjacencies := 
##  [ [ 1, 2 ], [ 1, 2 ] ] )
##  gap> GraphCategory([g1,g2,g3]);
##  <Operation "Graphs">
##  gap> GraphCategory([g1,g2]);   
##  <Operation "LooplessGraphs">
##  gap> GraphCategory([g1,g3]);
##  <Operation "UndirectedGraphs">
##  \endexample
##
##  --map
DeclareGlobalFunction("GraphCategory"); #common graph ctgy or default.

############################################################################
##
#F  TargetGraphCategory( [<G>, ... ] );
##
##  For internal use. Returns the graph category indicated in the <options stack> if any, 
##  otherwise if the list of graphs provided is not empty, returns the minimal common graph 
##  category for the graphs in the list, else returns the default graph category.
##
##  The partial order (by inclussion) among graph categories is as follows: 
##  $$`SimpleGraphs' \<  `UndirectedGraphs' \< `Graphs',$$
##  $$`OrientedGraphs' \< `LooplessGraphs' \< `Graphs'$$  
##  $$`SimpleGraphs' \< `LooplessGraphs' \< `Graphs'$$
##   
##  This function is internally called by all graph constructing operations in \YAGS\ to decide the 
##  graph category that the newly constructed graph is going to belong. New graphs are always 
##  forced to comply with the `TargetGraphCategory', so loops may be removed, and arrows may 
##  replaced by edges or viceversa, depending on the category that the new graph belongs to.
##  
##  The <options stack> is a mechanism provided by \GAP\ to pass implicit parameters 
##  and is used by `TargetGraphCategory' so that the user may indicate the graph 
##  category she/he wants for the new graph.
##
##  \beginexample
##  gap> SetDefaultGraphCategory(SimpleGraphs);             
##  gap> g1:=CompleteGraph(2);                              
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [ 1 ] ] )
##  gap> g2:=CompleteGraph(2:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [  ] ] )
##  gap> DisjointUnion(g1,g2);
##  Graph( Category := LooplessGraphs, Order := 4, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1 ], [ 4 ], [  ] ] )
##  gap> DisjointUnion(g1,g2:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 4, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1 ], [ 4 ], [ 3 ] ] )
##  \endexample
##  
##  In the previous examples, `TargetGraphCategory' was called internally exactly once for 
##  each new graph constructed with the following parameters:
##  
##  \beginexample
##  gap> TargetGraphCategory();
##  <Operation "SimpleGraphs">
##  gap> TargetGraphCategory(:GraphCategory:=OrientedGraphs);
##  <Operation "OrientedGraphs">
##  gap> TargetGraphCategory([g1,g2]);                       
##  <Operation "LooplessGraphs">
##  gap> TargetGraphCategory([g1,g2]:GraphCategory:=UndirectedGraphs);
##  <Operation "UndirectedGraphs">
##  \endexample
##
##  --map
DeclareGlobalFunction("TargetGraphCategory"); # option or graph or default ctgy.

###############################################################################
##
#O  in(<G>,<C>)
##
##  Returns `true' if graph <G> belongs to category <C> and `false' otherwise.
##
##  --map
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
#P  IsCompleteGraph(<G>)
##
##  Returns `true' if graph <G> is a complete graph, `false' otherwise.
##  In a complete graph every pair of vertices is an edge.
##
##  --map
DeclareQtfyProperty("IsCompleteGraph",Graphs);

############################################################################
##
#P  IsLoopless(<G>)
##
##  Returns `true' if graph <G> have no loops, `false' otherwise. Loops are edges 
##  from a vertex to itself.
##
##  --map
DeclareQtfyProperty("IsLoopless",Graphs);

############################################################################
##
#P  IsUndirected(<G>)
##
##  Returns `true' if graph <G> is an undirected graph, `false' otherwise.
##  Regardless of the categories that <G> belongs to, <G> is undirected if 
##  whenever `[x,y]' is an edge of <G>, `[y,x]' is also an egde of <G>.
##
##  --map
DeclareQtfyProperty("IsUndirected",Graphs);

## FIXME: changing #Q by #P breaks the manual, why???
############################################################################
##
#Q  IsOriented(<G>)
##
##  Returns `true' if graph <G> is an oriented graph, `false' otherwise.
##  Regardless of the categories that <G> belongs to, <G> is oriented if 
##  whenever `[x,y]' is an edge of <G>, `[y,x]' is not.
##
##  --map
DeclareQtfyProperty("IsOriented",Graphs);

##  Gap already declares "IsSImple" as an operation. 
##  Hence it may not be redefined as a property
############################################################################
##
#P  IsSimple(<G>)
##
##  Returns `true' if graph <G> is a simple graph, `false' otherwise.
##  Regardless of the categories that <G> belongs to, <G> is simple if and only if 
##  <G> is undirected and loopless.
##
##  Returns `true' if the graph <G> is simple regardless of its category.
##
##  --map
DeclareOperation("IsSimple",[Graphs]);

############################################################################
##
#A  QtfyIsSimple( <G> )
##
##  For internal use. Returns how far is graph <G> from being simple.
##
##  --map
DeclareAttribute("QtfyIsSimple",Graphs);

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
##  Returns the list of edges of graph <G> in the case of `SimpleGraphs'.
##
##  \beginexample
##  gap> g1:=CompleteGraph(3);     
##  Graph( Category := SimpleGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] )
##  gap> Edges(g1);
##  [ [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
##  \endexample
##  
##  In the case of `UndirectedGraphs', it also returns the loops. While in the 
##  other categories, `Edges' actually does not return the edges, but the loops 
##  and arrows of <G>.
##
##  \beginexample
##  gap> g2:=CompleteGraph(3:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 6, Adjacencies := 
##  [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 1, 2, 3 ] ] )
##  gap> Edges(g2);
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 2 ], [ 2, 3 ], [ 3, 3 ] ]
##  gap> g3:=CompleteGraph(3:GraphCategory:=Graphs);          
##  Graph( Category := Graphs, Order := 3, Size := 9, Adjacencies := 
##  [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 1, 2, 3 ] ] )
##  gap> Edges(g3);                                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 3, 1 ], 
##    [ 3, 2 ], [ 3, 3 ] ]
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
##  The vertices in the constructed graph range from 1 to the maximum of the numbers
##  appearing in <walk1>, <walk2>, ... etc.
##
##  \beginexample
##  gap> GraphByWalks([4,2],[3,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 2, Adjacencies := 
##  [ [  ], [ 4 ], [ 6 ], [ 2 ], [  ], [ 3 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("GraphByWalks");

############################################################################
##
#F  GraphByEdges( <L> )
##
##  Returns the minimal graph such that the pairs in <L> are edges.
##
##  \beginexample
##  gap> GraphByEdges([[1,2],[1,3],[1,4],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1, 5 ], [ 4 ] ] )
##  \endexample
##  
##  The vertices of the constructed graph range from 1 to the maximum of the
##  numbers appearing in <L>.
##  
##  \beginexample
##  gap> GraphByEdges([[4,3],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 2, Adjacencies := 
##  [ [  ], [  ], [ 4 ], [ 3, 5 ], [ 4 ] ] )
##  \endexample
##
##  Note that `GraphByWalks' has an even greater functionality.
##
##  --map
DeclareGlobalFunction("GraphByEdges");

############################################################################
##
#F  IntersectionGraph( <L> )
##
##  Returns the intersection graph of the family of sets <L>. This graph has a 
##  vertex for every set in <L>, and two such vertices are adjacent iff the 
##  corresponding sets have non-empty intersection.
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

## FIXME: Be more explicit.
############################################################################
##
#A  ConnectedComponents( <G> )
##
##  Returns the connected components of <G>.
##
##  --map
DeclareAttribute("ConnectedComponents",Graphs);

## FIXME: Be more explicit.
############################################################################
##
#A  NumberOfConnectedComponents( <G> )
##
##  Returns the number of connected components of <G>.
##
##  --map
DeclareAttribute("NumberOfConnectedComponents",Graphs);

## FIXME: Be more explicit.
############################################################################
##
#O  SpanningForestEdges( <G> )
##
##  Returns the edges of a spanning forest of <G>.
##
##  --map
DeclareOperation("SpanningForestEdges",[Graphs]);

## FIXME: Be more explicit.
############################################################################
##
#O  SpanningForest( <G> )
##
##  Returns a spanning forest of <G>.
##
##  --map
DeclareOperation("SpanningForest",[Graphs]);

#E





