
############################################################################
##
#A  DistanceMatrix( <G> )
##
##  Returns the distance matrix <D> of a graph <G>: D[x][y] is the distance in <G> 
##  from vertex <x> to vertex <y>. The matrix may be asymmetric if the graph is not simple. 
##  An infinite entry in the matrix means that there is no path between the vertices. 
##  Floyd's algorithm is used to compute the matrix.
##
##  \beginexample
##  gap> g:=PathGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
##  gap> Display(DistanceMatrix(g));
##  [ [  0,  1,  2,  3 ],
##    [  1,  0,  1,  2 ],
##    [  2,  1,  0,  1 ],
##    [  3,  2,  1,  0 ] ]
##  gap> g:=PathGraph(4:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 4, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 3 ], [ 4 ], [  ] ] )
##  gap> Display(DistanceMatrix(g));                   
##  [ [         0,         1,         2,         3 ],
##    [  infinity,         0,         1,         2 ],
##    [  infinity,  infinity,         0,         1 ],
##    [  infinity,  infinity,  infinity,         0 ] ]
##  \endexample
##
DeclareAttribute("DistanceMatrix",Graphs);

############################################################################
##
#A  Diameter( <G> )
##
##  Returns the maximum among the distances between pairs of
##  vertices of <G>.
##
##  \beginexample
##  gap> g:=CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies :=
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> Diameter(g);
##  2
##  \endexample
##
DeclareAttribute("Diameter",Graphs);

############################################################################
##
#A  Radius( <G> )
##
##  Returns the minimal eccentricity among the vertices of graph <G>.
##
##  \beginexample
##  gap> Radius(PathGraph(5)); 
##  2
##  \endexample
##
DeclareAttribute("Radius",Graphs);

############################################################################
##
#O  Distance( <G>, <x>, <y> )
##
##  Returns the length of a minimal path connecting <x> to <y> in <G>.
##
##  \beginexample
##  gap> Distance(CycleGraph(5),1,3);
##  2
##  gap> Distance(CycleGraph(5),1,5);
##  1
##  \endexample
##
DeclareOperation("Distance",[Graphs,IsInt,IsInt]);

############################################################################
##
#O  Distances( <G>, <A>, <B> )
##
##  Given two lists of vertices <A>, <B> of a graph <G>, `Distances' returns the
##  list of distances for every pair in the cartesian product of <A>
##  and <B>. The order of the vertices in lists <A> and <B> affects the order
##  of the list of distances returned.
##
##  \beginexample
##  gap> g:=CycleGraph(5);;
##  gap> Distances(g, [1,3], [2,4]);
##  [ 1, 2, 1, 1 ]
##  gap> Distances(g, [3,1], [2,4]);
##  [ 1, 1, 1, 2 ]
##  \endexample
##
DeclareOperation("Distances",[Graphs,IsList,IsList]);

############################################################################
##
#O  DistanceSet( <G>, <A>, <B> )
##
##  Given two subsets of vertices <A>, <B> of a graph <G>, `DistanceSet' returns the
##  set of distances for every pair in the cartesian product of <A> and <B>.  
##
##  \beginexample
##  gap> g:=CycleGraph(5);;         
##  gap> DistanceSet(g, [1,3], [2,4]);
##  [ 1, 2 ]
##  \endexample
##
DeclareOperation("DistanceSet",[Graphs,IsList,IsList]);

############################################################################
##
#O  DistanceGraph( <G>, <Dist> )
##
##  Given a graph <G> and list of distances <Dist>, `DistanceGraph' returns the new graph
##  constructed on the vertices of <G> where two vertices are
##  adjacent iff the distance (in <G>) between them belongs to the list <Dist>.
##
##  \beginexample
##  gap> g:=CycleGraph(5);            
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  gap> DistanceGraph(g,[2]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 3, 4 ], [ 4, 5 ], [ 1, 5 ], [ 1, 2 ], [ 2, 3 ] ] )
##  gap> DistanceGraph(g,[1,2]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 10, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 5 ], [ 1, 2, 4, 5 ], [ 1, 2, 3, 5 ], 
##    [ 1, 2, 3, 4 ] ] )
##  \endexample
##  
DeclareOperation("DistanceGraph",[Graphs,IsList]);

############################################################################
##
#O  PowerGraph( <G>, <exp> )
##
##  Returns the `DistanceGraph' of <G> using `[0, 1, ..., <exp>]' as the list of distances. 
##  Note that the distance `0' in the list produces loops in the new graph only when the 
## `TargetGraphCategory' admits loops.
##
##  \beginexample
##  gap> g:=PathGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> PowerGraph(g,1);                      
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> PowerGraph(g,1:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 5, Size := 13, Adjacencies := 
##  [ [ 1, 2 ], [ 1, 2, 3 ], [ 2, 3, 4 ], [ 3, 4, 5 ], [ 4, 5 ] ] )
##  \endexample
##
DeclareOperation("PowerGraph",[Graphs,IsInt]);

############################################################################
##
#F  Eccentricity( <G>, <x> )
##
##  Returns the distance from a vertex <x> in graph <G> to its
##  most distant vertex in <G>.
##
##  \beginexample
##  gap> g:=PathGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> Eccentricity(g,1);           
##  4
##  gap> Eccentricity(g,3);
##  2
##  \endexample
##  
DeclareGlobalFunction("Eccentricity");

############################################################################
##
#A  Girth( <G> )
##
##  Returns the length of the minimum induced cycle in <G>. At this time, 
##  this works only when <G> belongs to the graph categories `SimpleGraphs' or 
##  `UndirectedGraphs'. If <G> has loops, its girth is 1 by definition.
##
##  \beginexample
##  gap> Girth(Octahedron);
##  3
##  gap> Girth(PetersenGraph);         
##  5
##  gap> Girth(Cube);
##  4
##  gap> Girth(PathGraph(5));
##  infinity
##  gap> g:=AddEdges(CycleGraph(4),[[3,3]]:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 4, Size := 5, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 3, 4 ], [ 1, 3 ] ] )
##  gap> Girth(g);            
##  1
##  \endexample
##  
DeclareOperation("Girth",[Graphs]);


#E
