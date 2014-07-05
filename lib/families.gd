
##
##  Some families of graphs:
##
############################################################################
##
#F  DiscreteGraph( <n> )
##
##  Returns a Discrete Graph of order <n>. A discrete graph is a graph
##  where vertices are unconnected.
##
## \beginexample
## gap> DiscreteGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 0, Adjacencies :=
## [ [  ], [  ], [  ], [  ] ] )
## \endexample
##
DeclareGlobalFunction("DiscreteGraph");

############################################################################
##
#F  CompleteGraph( <n> )
##
##  Returns a Complete Graph of order <n>. A complete graph is a graph
##  where all vertices are connected to each other.
##
## \beginexample
## gap> CompleteGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
## [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
## \endexample
##
DeclareGlobalFunction("CompleteGraph");

############################################################################
##
#F  PathGraph( <n> )
##
##  Returns a Path Graph of order <n>. A path graph is a graph
##  connected forming a path.
##
## \beginexample
## gap> PathGraph(4);
## Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
## [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
## \endexample
##
DeclareGlobalFunction("PathGraph");

############################################################################
##
#F  CycleGraph( <n> )
##
##  Returns a Cycle Graph of order <n>. A cycle graph is a path graph
##  where the vertices at the ends are connected.
##
## \beginexample
## gap> CycleGraph(5);
## Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
## [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
## \endexample
##
DeclareGlobalFunction("CycleGraph");

############################################################################
##
#F  CubeGraph( <n> )
##
##  Returns a Cube Graph of order <n>. A cube graph is a graph where
##  each vertex has degree <n>.
##
## \beginexample
## gap> CubeGraph(3);
## Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies :=
## [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], [ 2, 3, 8 ], [ 1, 6, 7 ],
## [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
## \endexample
##
DeclareGlobalFunction("CubeGraph");

############################################################################
##
#F  OctahedralGraph( <n> )
##
## \beginexample
## gap> OctahedralGraph(3);
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##  [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
## \endexample
##
DeclareGlobalFunction("OctahedralGraph");

############################################################################
##
#F  JohnsonGraph( <n>, <r> )
##
##  Returns a Johnson Graph $J(n,r).$ A Johnson Graph is a 
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
DeclareGlobalFunction("JohnsonGraph");

############################################################################
##
#F  CompleteBipartiteGraph( <n>, <m> )
##
##  Returns a Complete Bipartite Graph of order <n> + <m>. A complete
##  bipartite graph is the result of joining two Discrete graphs and
##  adding edges to connect all vertices of each graph.
##
## \beginexample
## gap> CompleteBipartiteGraph(2,3);
## Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies :=
## [ [ 3, 4, 5 ], [ 3, 4, 5 ], [ 1, 2 ], [ 1, 2 ], [ 1, 2 ] ] )
## \endexample
##
DeclareGlobalFunction("CompleteBipartiteGraph");

############################################################################
##
#F  CompleteMultipartiteGraph( <n1>, <n2> [, <n3> ...] )
##
##  Returns a Complete Multipartite Graph of order <n1> + <n2> +
##  \dots. A complete multipartite graph is the result of joining
##  Discrete graphs and adding edges to connect all vertices of each
##  graph. 
##
## \beginexample
## gap> CompleteMultipartiteGraph(2,2,2);
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##   [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
## \endexample
##
DeclareGlobalFunction("CompleteMultipartiteGraph");

############################################################################
##
#F  RandomGraph( <n>, <p> )
#F  RandomGraph( <n> )
##
##  Returns a Random Graph of order <n>. The first form additionally
##  takes a parameter <p>, the probability of an edge to exist. A
##  probability 1 will return a Complete Graph and a probability 0 a
##  Discrete Graph.
##
## \beginexample
## gap> RandomGraph(5);
## Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
## [ [ 4, 5 ], [ 4, 5 ], [  ], [ 1, 2, 5 ], [ 1, 2, 4 ] ] )
## \endexample
##
DeclareGlobalFunction("RandomGraph");

############################################################################
##
#F  CylinderGraph( <Base>, <Height> )
##
##
DeclareGlobalFunction("CylinderGraph");

##FIXME: Poner un ejemplo con radio.
############################################################################
##
#O  WheelGraph( <N> )
#O  WheelGraph( <N>, <Radius> )
##
## \beginexample
## WheelGraph(5);
## gap> Graph( Category := SimpleGraphs, Order := 6, Size := 10, Adjacencies :=
## [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4, 6 ],
##   [ 1, 2, 5 ] ] )
## \endexample
##
##  
##
DeclareOperation("WheelGraph",[IsInt]);

############################################################################
##
#F  FanGraph( <N> )
##
## \beginexample
## gap> FanGraph(4);
## Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
## [ [ 2, 3, 4, 5, 6 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 4, 6 ],
##  [ 1, 5 ] ] )
## \endexample
##
DeclareGlobalFunction("FanGraph");

############################################################################
##
#F  SunGraph( <N> )
##
## \beginexample
## gap> SunGraph(4);
## Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
## [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##  [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
## \endexample
##
DeclareGlobalFunction("SunGraph");

############################################################################
##
#F  SpikyGraph( <N> )
##
## \beginexample
## gap> SpikyGraph(3);
## Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
## [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], [ 1, 2 ], [ 1, 3 ],
##  [ 2, 3 ] ] )
## \endexample
##
DeclareGlobalFunction("SpikyGraph");

############################################################################
##
#V  TrivialGraph
##
## \beginexample
## gap> TrivialGraph;
## Graph( Category := SimpleGraphs, Order := 1, Size := 0, Adjacencies :=
## [ [  ] ] )
## \endexample
##
DeclareGlobalVariable("TrivialGraph");

############################################################################
##
#V  DiamondGraph
##
## \beginexample
## gap> DiamondGraph;
## Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies :=
## [ [ 2, 3, 4 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3 ] ] )
## \endexample
##
DeclareGlobalVariable("DiamondGraph");

############################################################################
##
#V  ClawGraph
##
## \beginexample
## gap> ClawGraph;
## Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
## [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
## \endexample
##
DeclareGlobalVariable("ClawGraph");

############################################################################
##
#V  PawGraph
##
## \beginexample
## gap> PawGraph;
## Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies :=
## [ [ 2 ], [ 1, 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
## \endexample
##
DeclareGlobalVariable("PawGraph");

############################################################################
##
#V  HouseGraph
##
## \beginexample
## gap> HouseGraph;
## Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies :=
## [ [ 2, 3 ], [ 1, 3, 4 ], [ 1, 2, 5 ], [ 2, 5 ], [ 3, 4 ] ] )
## \endexample
##
DeclareGlobalVariable("HouseGraph");

##FIXME: Falta
############################################################################
##
#V  BullGraph
##
DeclareGlobalVariable("BullGraph");

############################################################################
##
#V  AntennaGraph
##
DeclareGlobalVariable("AntennaGraph");

############################################################################
##
#V  KiteGraph
##
DeclareGlobalVariable("KiteGraph");

############################################################################
##
#V  DartGraph
##
DeclareGlobalVariable("DartGraph");

############################################################################
##
#V  ChairGraph
##
DeclareGlobalVariable("ChairGraph");

############################################################################
##
#V  GemGraph
##
DeclareGlobalVariable("GemGraph");

############################################################################
##
#V  AGraph
##
DeclareGlobalVariable("AGraph");

############################################################################
##
#V  DominoGraph
##
DeclareGlobalVariable("DominoGraph");

############################################################################
##
#V  ParapluieGraph
##
DeclareGlobalVariable("ParapluieGraph");

############################################################################
##
#V  ParachuteGraph
##
DeclareGlobalVariable("ParachuteGraph");

############################################################################
##
#V  FishGraph
##
DeclareGlobalVariable("FishGraph");

############################################################################
##
#V  RGraph
##
DeclareGlobalVariable("RGraph");


############################################################################
##
#V  Tetrahedron
##
## \beginexample
## gap> Tetrahedron;
## Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
## [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
## \endexample
##
DeclareGlobalVariable("Tetrahedron");

############################################################################
##
#V  Octahedron
##
## \beginexample
## gap> Octahedron;
## Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
## [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##  [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
## \endexample
##
DeclareGlobalVariable("Octahedron");

############################################################################
##
#V  Cube
##
## \beginexample
## gap> Cube;
## Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies :=
## [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], [ 2, 3, 8 ], [ 1, 6, 7 ],
##  [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
## \endexample
##
DeclareGlobalVariable("Cube");

##FIXME: Falta
############################################################################
##
#V  Icosahedron
##
## \beginexample
## gap> Icosahedron;
## Graph( Category := SimpleGraphs, Order := 12, Size := 30, Adjacencies :=
## [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 9, 10 ], [ 1, 2, 4, 10, 11 ],
##   [ 1, 3, 5, 7, 11 ], [ 1, 4, 6, 7, 8 ], [ 1, 2, 5, 8, 9 ],
##   [ 4, 5, 8, 11, 12 ], [ 5, 6, 7, 9, 12 ], [ 2, 6, 8, 10, 12 ],
##   [ 2, 3, 9, 11, 12 ], [ 3, 4, 7, 10, 12 ], [ 7, 8, 9, 10, 11 ] ] )
## \endexample
##
DeclareGlobalVariable("Icosahedron");

############################################################################
##
#V  Dodecahedron
##
DeclareGlobalVariable("Dodecahedron");

############################################################################
##
#V  SnubDisphenoid
##
## \beginexample
## gap> SnubDisphenoid;
## Graph( Category := SimpleGraphs, Order := 8, Size := 18, Adjacencies := 
## [ [ 2, 3, 4, 5, 8 ], [ 1, 3, 6, 7, 8 ], [ 1, 2, 4, 6 ], [ 1, 3, 5, 6 ], 
##   [ 1, 4, 6, 7, 8 ], [ 2, 3, 4, 5, 7 ], [ 2, 5, 6, 8 ], [ 1, 2, 5, 7 ] ] )
## \endexample
DeclareGlobalVariable("SnubDisphenoid");

#E
