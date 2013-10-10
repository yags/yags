
############################################################################
##
#A  DistanceMatrix( <G> )
##
##  Returns the matrix of distances for all vertices in <G>. The
##  matrix is asymetric if the graphic is directed. An entry in the
##  matrix of $\infty$ means there is no path between the vertices. 
##  Floyd's algorithm is used to compute the matrix.
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> DistanceMatrix(G);
##  [ [ 0, 1, 2, 2, 1 ], [ 1, 0, 1, 2, 2 ], [ 2, 1, 0, 1, 2 ], [ 2, 2, 1, 0, 1 ],
##    [ 1, 2, 2, 1, 0 ] ]
##  \endexample
##
DeclareAttribute("DistanceMatrix",Graphs);

############################################################################
##
#A  Diameter( <G> )
##
##  The diameter of a graph <G> is the maximum distance for any two
##  vertices in <G>. $$ \max \{ d_G(x,y) | x,y \in V(G) \} $$
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Diameter(G);
##  2
##  \endexample
##
DeclareAttribute("Diameter",Graphs);

############################################################################
##
#A  Radius( <G> )
##
##  Returns the minimal excentricity among the vertices of graph
##  <G>. $$ \min \{ {Excentricity}(G,x) | x \in V(G) \} $$ 
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Radius(G);
##  2
##  \endexample
##
DeclareAttribute("Radius",Graphs);

############################################################################
##
#O  Distance( <G>, <x>, <y> )
##
##  Returns the minimal number of edges that connect vertices <x> and
##  <y>. $$ d_G(x,y) $$
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Distance(G,1,3);
##  2
##  \endexample
##
DeclareOperation("Distance",[Graphs,IsInt,IsInt]);

############################################################################
##
#O  Distances( <G>, <A>, <B> )
##
##  Given two subsets of vertices <A>, <B> of graph <G> returns the
##  list of distances for every pair in the cartesian product of <A>
##  and <B>. $$ [ d_G(x,y) | (x,y) \in A \times B ] $$ 
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Distances(G, [1,3], [2,4]);
##  [ 1, 2, 1, 1 ]
##  \endexample
##
DeclareOperation("Distances",[Graphs,IsList,IsList]);

############################################################################
##
#O  DistanceSet( <G>, <A>, <B> )
##
##  Given two subsets of vertices <A>, <B> of graph <G> returns the
##  set of distances for every pair in the cartesian product of <A>
##  and <B>. $$ \{ d_G(x,y) | (x,y) \in A \times B \} $$ 
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> DistanceSet(G, [1,3], [2,4]);
##  [ 1, 2 ]
##  \endexample
##
DeclareOperation("DistanceSet",[Graphs,IsList,IsList]);

############################################################################
##
#O  DistanceGraph( <G>, <D> )
##
##  Given a graph <G> and list of Distances <D> returns the graph
##  constructed using the vertices of <G> where two vertices are
##  adjacent iff the distance between them is in the list <D>.
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> DistanceGraph(G, [2]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 3, 4 ], [ 4, 5 ], [ 1, 5 ], [ 1, 2 ], [ 2, 3 ] ] )
##  \endexample
##
DeclareOperation("DistanceGraph",[Graphs,IsList]);

############################################################################
##
#O  PowerGraph( <G>, <e> )
##
##  Returns the Distance graph of <G> using as a list of distances
##  [0,1,...,<e>]. Note that the distance 0 is used only if <G> has
##  loops. $$ G^n = {DistanceGraph}(G,[0,1,\dots,e]) $$ 
##
##  \beginexample
##  gap> G:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> PowerGraph(G,3);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 28, Adjacencies :=
##  [ [ 2, 3, 4, 5, 6, 7, 8 ], [ 1, 3, 4, 5, 6, 7, 8 ], [ 1, 2, 4, 5, 6, 7, 8 ],
##    [ 1, 2, 3, 5, 6, 7, 8 ], [ 1, 2, 3, 4, 6, 7, 8 ], [ 1, 2, 3, 4, 5, 7, 8 ],
##    [ 1, 2, 3, 4, 5, 6, 8 ], [ 1, 2, 3, 4, 5, 6, 7 ] ] )
##  \endexample
##
DeclareOperation("PowerGraph",[Graphs,IsInt]);

############################################################################
##
#F  Excentricity( <G>, <x> )
##
##  Returns the distance from a vertex <x> in graph <G> to the
##  furthest away vertex in <G>. $$ \max \{ d_G(x,y) | y \in V(G) \} $$
##
##  \beginexample
##  gap> G:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Excentricity(G,3);
##  2
##  \endexample
##
DeclareGlobalFunction("Excentricity");

#E
