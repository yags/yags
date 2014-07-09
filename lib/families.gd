
##
##  Some families of graphs:
##
############################################################################
##
#F  DiscreteGraph( <n> )
##
##  Returns the discrete graph of order <n>. A discrete graph is a graph
##  without edges.
##
## \beginexample
## gap> DiscreteGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 0, Adjacencies :=
## [ [  ], [  ], [  ], [  ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("DiscreteGraph");

############################################################################
##
#F  CompleteGraph( <n> )
##
##  Returns the complete graph of order <n>. A complete graph is a graph
##  where all vertices are connected to each other.
##
## \beginexample
## gap> CompleteGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
## [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("CompleteGraph");

############################################################################
##
#F  PathGraph( <n> )
##
##  Returns the path graph on <n> vertices.
##
## \beginexample
## gap> PathGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
## [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("PathGraph");

############################################################################
##
#F  CycleGraph( <n> )
##
##  Returns the cyclic graph on <n> vertices. 
##
## \beginexample
## gap> CycleGraph(5);
## Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
## [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("CycleGraph");

############################################################################
##
#F  CubeGraph( <n> )
##
##  Returns the hypercube of dimension <n>. This is the box product (cartesian product) 
##  of $n$ copies of $K_2$ (an edge).
##
## \beginexample
## gap> CubeGraph(3);
## Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies :=
## [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], [ 2, 3, 8 ], [ 1, 6, 7 ],
## [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
## \endexample
##
##  -map
DeclareGlobalFunction("CubeGraph");

############################################################################
##
#F  OctahedralGraph( <n> )
##
##  Return the <n>-dimensional octahedron. This is the complement of <n> copies
##  of $K_2$ (an edge). It is also the <(2n-2)>-regular graph on $2n$ vertices.
##
## \beginexample
## gap> OctahedralGraph(3);
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##  [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("OctahedralGraph");

############################################################################
##
#F  JohnsonGraph( <n>, <r> )
##
##  Returns the Johnson graph $J(n,r).$ A Johnson Graph is a 
##  graph constructed as follows. Each vertex represents a subset of
##  the set $\{1,\dots,n\}$ with cardinality $r.$ $$V(J(n,r)) = \{ X \subset
##  \{1,\dots,n\} | |X| = r \}$$ and there is an edge between two
##  vertices if and only if the cardinality of the intersection of the
##  sets they represent is $r-1$ $$X \sim X' \hbox{ iff } |X \cup X'| = r-1.$$
##
## \beginexample
## gap> JohnsonGraph(4,2);
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##   [ 1, 3, 4, 6 ], [ 2, 3, 4, 5 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("JohnsonGraph");

############################################################################
##
#F  CompleteBipartiteGraph( <n>, <m> )
##
##  Returns the complete bipartite whose parts have order <n> and <m> respectively. 
##  This is the joint (Zykov sum) of two discrete graphs of order <n> and <m>. 
##
## \beginexample
## gap> CompleteBipartiteGraph(2,3);
## Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies :=
## [ [ 3, 4, 5 ], [ 3, 4, 5 ], [ 1, 2 ], [ 1, 2 ], [ 1, 2 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("CompleteBipartiteGraph");

############################################################################
##
#F  CompleteMultipartiteGraph( <n1>, <n2> [, <n3> ...] )
##
##  Returns the complete multipartite graph where the orders of the parts are 
##  <n1>, <n2>, ... It is also the Zykov sum of discrete graphs of order <n1>, <n2>, ...
##
## \beginexample
## gap> CompleteMultipartiteGraph(2,2,2);
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##   [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("CompleteMultipartiteGraph");

############################################################################
##
#F  RandomGraph( <n>, <p> )
#F  RandomGraph( <n> )
##
##  Returns a random graph of order <n> taking the rational $p\in [0,1]$ as the edge probability. 
##  
##  \beginexample
##  gap> RandomGraph(5,1/3);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 2, Adjacencies := 
##  [ [ 5 ], [ 5 ], [  ], [  ], [ 1, 2 ] ] )
##  gap> RandomGraph(5,2/3);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies := 
##  [ [ 4, 5 ], [ 3, 4, 5 ], [ 2, 4 ], [ 1, 2, 3 ], [ 1, 2 ] ] )
##  gap> RandomGraph(5,1/2);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2, 5 ], [ 1, 3, 5 ], [ 2 ], [  ], [ 1, 2 ] ] )
##  \endexample
##  
##  If <p> is ommited, the edge probability is taken to be 1/2.
##
##  \beginexample
##  gap> RandomGraph(5);    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 2, 3 ], [ 1 ], [ 1, 4, 5 ], [ 3, 5 ], [ 3, 4 ] ] )
##  gap> RandomGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 3, Adjacencies := 
##  [ [ 2, 5 ], [ 1, 4 ], [  ], [ 2 ], [ 1 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("RandomGraph");

############################################################################
##
#F  CylinderGraph( <Base>, <Height> )
##
##  Returns a cylinder of base <Base> and height <Height>. 
##  The order of this graph is <Base*(Height+1)> and it is constructed by taking 
##  <Height+1> copies of the cyclic graph on <Base> vertices, ordering these cycles linearly and then 
##  joining consecutive cycles by a zigzagging <2*Base>-cycle. This graph is a triangulation of the cylinder where 
##  all internal vertices are of degree 6 and the border vertices are of degree 4.
##
##  \beginexample
##  gap> g:=CylinderGraph(4,1);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 16, Adjacencies := 
##  [ [ 2, 4, 5, 6 ], [ 1, 3, 6, 7 ], [ 2, 4, 7, 8 ], [ 1, 3, 5, 8 ], 
##    [ 1, 4, 6, 8 ], [ 1, 2, 5, 7 ], [ 2, 3, 6, 8 ], [ 3, 4, 5, 7 ] ] )
##  gap> g:=CylinderGraph(4,2);
##  Graph( Category := SimpleGraphs, Order := 12, Size := 28, Adjacencies := 
##  [ [ 2, 4, 5, 6 ], [ 1, 3, 6, 7 ], [ 2, 4, 7, 8 ], [ 1, 3, 5, 8 ], 
##    [ 1, 4, 6, 8, 9, 10 ], [ 1, 2, 5, 7, 10, 11 ], [ 2, 3, 6, 8, 11, 12 ], 
##    [ 3, 4, 5, 7, 9, 12 ], [ 5, 8, 10, 12 ], [ 5, 6, 9, 11 ], [ 6, 7, 10, 12 ], 
##    [ 7, 8, 9, 11 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalFunction("CylinderGraph");

############################################################################
##
#O  WheelGraph( <N> )
#O  WheelGraph( <N>, <Radius> )
##
##  In its first form `WheelGraph' returns the wheel graph on <N+1> vertices. This is the 
##  cone of a cycle: a central vertex adjacent to all the vertices of an <N>-cycle
##  
## \beginexample
## WheelGraph(5);
## gap> Graph( Category := SimpleGraphs, Order := 6, Size := 10, Adjacencies :=
## [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4, 6 ],
##   [ 1, 2, 5 ] ] )
## \endexample
##
##  In its second form, `WheelGraph' returns returns the wheel graph, but adding 
##  <Radius-1> layers, each layer is a new <N>-cycle joined to the previous layer 
##  by a zigzagging <2N>-cycle. This graph is a triangulation of the disk.
##
##  \beginexample
##  gap> WheelGraph(5,2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 25, Adjacencies := 
##  [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 7, 8 ], [ 1, 2, 4, 8, 9 ], [ 1, 3, 5, 9, 10 ],
##    [ 1, 4, 6, 10, 11 ], [ 1, 2, 5, 7, 11 ], [ 2, 6, 8, 11 ], [ 2, 3, 7, 9 ], 
##    [ 3, 4, 8, 10 ], [ 4, 5, 9, 11 ], [ 5, 6, 7, 10 ] ] )
##  gap> WheelGraph(5,3);
##  Graph( Category := SimpleGraphs, Order := 16, Size := 40, Adjacencies := 
##  [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 7, 8 ], [ 1, 2, 4, 8, 9 ], [ 1, 3, 5, 9, 10 ],
##    [ 1, 4, 6, 10, 11 ], [ 1, 2, 5, 7, 11 ], [ 2, 6, 8, 11, 12, 13 ], 
##    [ 2, 3, 7, 9, 13, 14 ], [ 3, 4, 8, 10, 14, 15 ], [ 4, 5, 9, 11, 15, 16 ], 
##    [ 5, 6, 7, 10, 12, 16 ], [ 7, 11, 13, 16 ], [ 7, 8, 12, 14 ], 
##    [ 8, 9, 13, 15 ], [ 9, 10, 14, 16 ], [ 10, 11, 12, 15 ] ] )
##  \endexample
##  
##  --map
DeclareOperation("WheelGraph",[IsInt]);

############################################################################
##
#F  FanGraph( <N> )
##  
##  Returns the <N>-Fan: The join of a vertex and a <(N+1)>-path.
##  
## \beginexample
## gap> FanGraph(4);
## Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
## [ [ 2, 3, 4, 5, 6 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4, 6 ],
##  [ 1, 5 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("FanGraph");

############################################################################
##
#F  SunGraph( <N> )
##
##  Returns the <N>-Sun: A complete graph on <N> vertices, $K_N$, with a corona 
##  made with a zigzagging <2N>-cycle glued to a <N>-cyle of the $K_N$.
##
##  \beginexample
##  gap> SunGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies := 
##  [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], [ 2, 3, 5, 6 ], [ 4, 6 ], 
##    [ 1, 2, 4, 5 ] ] )
##  gap> SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies := 
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ], 
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
## \endexample
##
##  --map
DeclareGlobalFunction("SunGraph");

############################################################################
##
#F  SpikyGraph( <N> )
##  
##  The spiky graph is constructed as follows: Take complete graph on <N> vertices, $K_N$, 
##  and then, for each the <N> subsets of $Vertices(K_n)$ of order <N-1>, add an additional vertex which
##  is adjacent precisely to this subset of $Vertices(K_n)$.
##  
##  \beginexample
##  gap> SpikyGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], [ 1, 2 ], [ 1, 3 ],
##    [ 2, 3 ] ] )
##  \endexample
##
##  --map
DeclareGlobalFunction("SpikyGraph");

############################################################################
##
#V  TrivialGraph
##
##  The one vertex graph.
##  
##  \beginexample
##  gap> TrivialGraph;
##  Graph( Category := SimpleGraphs, Order := 1, Size := 0, Adjacencies :=
##  [ [  ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("TrivialGraph");

############################################################################
##
#V  DiamondGraph
##
##  The graph on 4 vertices and 5 edges.
##
##  \beginexample
##  gap> DiamondGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("DiamondGraph");

############################################################################
##
#V  ClawGraph
##
##  The graph on 4 vertices, 3 edges, and maximum degree 3. 
##
##  \beginexample
##  gap> ClawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("ClawGraph");

############################################################################
##
#V  PawGraph
##
##  The graph on 4 vertices, 4 edges and maximum degree 3: A triangle with a pendant vertex.
##
##  \beginexample
##  gap> PawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies :=
##  [ [ 2 ], [ 1, 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("PawGraph");

############################################################################
##
#V  HouseGraph
##
##  A 4-Cycle and a triangle glued by an edge.
##
##  \beginexample
##  gap> HouseGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies := 
##  [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], [ 1, 4 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("HouseGraph");

##FIXME: Falta
############################################################################
##
#V  BullGraph
##
##  A triangle with two pendant vertices (horns).
##
##  \beginexample
##  gap> BullGraph;    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 4 ], [ 2, 4 ], [ 2, 3, 5 ], [ 4 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("BullGraph");

############################################################################
##
#V  AntennaGraph
##
##  A `HouseGraph' with a pendant vertex (antenna) on the roof.
##
##  \beginexample
##  gap> AntennaGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], [ 1, 4, 6 ], [ 5 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("AntennaGraph");

############################################################################
##
#V  KiteGraph
##  
##  A diamond with a pending vertex and maximum degree 3.
##  
##  \beginexample
##  gap> KiteGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 4 ], [ 2, 4, 5 ], [ 2, 3, 5 ], [ 3, 4 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("KiteGraph");

############################################################################
##
#V  DartGraph
##  
##  A diamond with a pending vertex and maximum degree 4.
##  
##  \beginexample
##  gap> DartGraph; 
##  Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 4, 5 ], [ 2, 4, 5 ], [ 2, 3 ], [ 2, 3 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("DartGraph");

############################################################################
##
#V  ChairGraph
##  
##  A tree with degree sequence 3,2,1,1,1.
##  
##  \beginexample
##  gap> ChairGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 4 ], [ 2 ], [ 2, 5 ], [ 4 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("ChairGraph");

############################################################################
##
#V  GemGraph
##  
##  The 3-Fan graph.
##  
##  \beginexample
##  gap> GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 7, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("GemGraph");

############################################################################
##
#V  AGraph
##  
##  A 4-cycle with two pendant vertices on consecutive vertices of the cycle.
##  
##  \beginexample
##  gap> AGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 5 ], [ 2, 4 ], [ 3, 5 ], [ 2, 4, 6 ], [ 5 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("AGraph");

############################################################################
##
#V  DominoGraph
##  
##  Two squares glued by an edge.
##  
##  \beginexample
##  gap> DominoGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], [ 4, 6 ], [ 1, 5 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("DominoGraph");

############################################################################
##
#V  ParapluieGraph
##  
##  A 3-Fan graph with a 3-path attached to the universal vertex.
##  
##  \beginexample
##  gap> ParapluieGraph;
##  Graph( Category := SimpleGraphs, Order := 7, Size := 9, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4, 5, 6, 7 ], [ 3, 5 ], [ 3, 4, 6 ], [ 3, 5, 7 ], 
##    [ 3, 6 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("ParapluieGraph");

############################################################################
##
#V  ParachuteGraph
##  
##  The complement of a `ParapluieGraph'; The suspension of a 4-path with a 
##  pendant vertex attached to the south pole.
##  
##  \beginexample
##  gap> ParachuteGraph;
##  Graph( Category := SimpleGraphs, Order := 7, Size := 12, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 4, 5, 6 ], [ 2, 4, 7 ], [ 2, 3, 5, 7 ], [ 2, 4, 6, 7 ], 
##    [ 2, 5, 7 ], [ 3, 4, 5, 6 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("ParachuteGraph");

############################################################################
##
#V  FishGraph
##  
##  A square and a triangle glued by a vertex.
##  
##  \beginexample
##  gap> FishGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 3, 4, 6 ], [ 1, 3 ], [ 1, 2 ], [ 1, 5 ], [ 4, 6 ], [ 1, 5 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("FishGraph");

############################################################################
##
#V  RGraph
##  
##  A square with two pendant vertices attached to the same vertex of the square.
##  
##  \beginexample
##  gap> RGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2 ], [ 1, 3, 5, 6 ], [ 2, 4 ], [ 3, 5 ], [ 2, 4 ], [ 2 ] ] )
##  \endexample
##  
##  --map
DeclareGlobalVariable("RGraph");


############################################################################
##
#V  Tetrahedron
##
##  The 1-skeleton of Plato's tetrahedron.
##
##  \beginexample
##  gap> Tetrahedron;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("Tetrahedron");

############################################################################
##
#V  Octahedron
##
##  The 1-skeleton of Plato's octahedron.
##
##  \beginexample
##  gap> Octahedron;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
##  [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##    [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("Octahedron");

############################################################################
##
#V  Cube
##
##  The 1-skeleton of Plato's cube.
##
##  \beginexample
##  gap> Cube;
##  Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies :=
##  [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], [ 2, 3, 8 ], [ 1, 6, 7 ],
##   [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("Cube");

############################################################################
##
#V  Icosahedron
##
##  The 1-skeleton of Plato's icosahedron.
##
##  \beginexample
##  gap> Icosahedron;
##  Graph( Category := SimpleGraphs, Order := 12, Size := 30, Adjacencies :=
##  [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 9, 10 ], [ 1, 2, 4, 10, 11 ],
##    [ 1, 3, 5, 7, 11 ], [ 1, 4, 6, 7, 8 ], [ 1, 2, 5, 8, 9 ],
##    [ 4, 5, 8, 11, 12 ], [ 5, 6, 7, 9, 12 ], [ 2, 6, 8, 10, 12 ],
##    [ 2, 3, 9, 11, 12 ], [ 3, 4, 7, 10, 12 ], [ 7, 8, 9, 10, 11 ] ] )
##  \endexample
##
##  --map
DeclareGlobalVariable("Icosahedron");

############################################################################
##
#V  Dodecahedron
##  
##  The 1-skeleton of Plato's Dodecahedron.
##
##  gap> Dodecahedron;
##  Graph( Category := SimpleGraphs, Order := 20, Size := 30, Adjacencies := 
##  [ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], [ 3, 5, 9 ], [ 1, 4, 10 ], 
##    [ 1, 11, 15 ], [ 2, 11, 12 ], [ 3, 12, 13 ], [ 4, 13, 14 ], [ 5, 14, 15 ], 
##    [ 6, 7, 16 ], [ 7, 8, 17 ], [ 8, 9, 18 ], [ 9, 10, 19 ], [ 6, 10, 20 ], 
##    [ 11, 17, 20 ], [ 12, 16, 18 ], [ 13, 17, 19 ], [ 14, 18, 20 ], 
##    [ 15, 16, 19 ] ] )
##  
##  --map
DeclareGlobalVariable("Dodecahedron");

############################################################################
##
#V  SnubDisphenoid
##
##  The 1-skeleton of the 84th Johnson solid. 
##
## \beginexample
## gap> SnubDisphenoid;
## Graph( Category := SimpleGraphs, Order := 8, Size := 18, Adjacencies := 
## [ [ 2, 3, 4, 5, 8 ], [ 1, 3, 6, 7, 8 ], [ 1, 2, 4, 6 ], [ 1, 3, 5, 6 ], 
##   [ 1, 4, 6, 7, 8 ], [ 2, 3, 4, 5, 7 ], [ 2, 5, 6, 8 ], [ 1, 2, 5, 7 ] ] )
## \endexample
##  
##  --map
DeclareGlobalVariable("SnubDisphenoid");

#E
