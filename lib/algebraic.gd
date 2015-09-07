############################################################################
##
#O  GroupGraph( <G>, <Grp>, <act> )
#O  GroupGraph( <G>, <Grp> )
##
##  Given a graph <G>, a group <Grp> and an action <act> of <Grp> in some 
##  set S which contains Vertices( <G> ), GroupGraph returns a new graph 
##  with vertex set $\{act(v,g) : g \in Grp, v \in Vertices( G )\}$ 
##  and edge set $\{\{act(v,g),act(u,g)\}: g\ in Grp \{u,v\}\in Edges( G )\}$.
##  
##  If <act> is omited, the standard {\GAP} action `OnPoints' is used.
##
##  \beginexample
##  gap> GroupGraph(GraphByWalks([1,2]),Group([(1,2,3,4,5),(2,5)(3,4)]));
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  \endexample
##  
DeclareOperation("GroupGraph",[Graphs,IsGroup,IsFunction]);
DeclareOperation("GroupGraph",[Graphs,IsGroup,]);

############################################################################
##
#O  CayleyGraph( <Grp>, <elms> )
#O  CayleyGraph( <Grp> )
##
##  Returns the graph $G$ whose vertices are the elements of the group <Grp> 
##  such that $x$ is adjacent to $y$ iff $x*g=y$ for some $g$ in the list <elms>.
##  if <elms> is not provided, then the generators of <G> are used instead.
##
##  \beginexample
##  gap> grp:=Group((1,2,3),(1,2));    
##  Group([ (1,2,3), (1,2) ])
##  gap> CayleyGraph(grp);             
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies := 
##  [ [ 3, 4, 5 ], [ 3, 5, 6 ], [ 1, 2, 6 ], [ 1, 5, 6 ], [ 1, 2, 4 ], 
##    [ 2, 3, 4 ] ] )
##  gap> CayleyGraph(grp,[(1,2),(2,3)]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2, 3 ], [ 1, 5 ], [ 1, 4 ], [ 3, 6 ], [ 2, 6 ], [ 4, 5 ] ] )
##  \endexample
##  
DeclareOperation("CayleyGraph",[IsGroup,IsList]);
DeclareOperation("CayleyGraph",[IsGroup]);

############################################################################
##
#O  RingGraph( <Rng>, <elms> )
##
##  Returns the graph G whose vertices are the elements of the ring <Rng> 
##  such that x is adjacent to y iff x+r=y for some r in <elms>.
##
##  \beginexample
##  gap> r:=FiniteField(8);Elements(r); 
##  GF(2^3)
##  [ 0*Z(2), Z(2)^0, Z(2^3), Z(2^3)^2, Z(2^3)^3, Z(2^3)^4, Z(2^3)^5, Z(2^3)^6 ]
##  gap> RingGraph(r,[Z(2^3),Z(2^3)^4]);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 8, Adjacencies := 
##  [ [ 3, 6 ], [ 5, 7 ], [ 1, 4 ], [ 3, 6 ], [ 2, 8 ], [ 1, 4 ], [ 2, 8 ], 
##    [ 5, 7 ] ] )
##  \endexample
##  
DeclareOperation("RingGraph",[IsRing,IsList]);

############################################################################
##
#O  Circulant( <n>, <jumps> )
##
##  Returns the graph G whose vertices are [1..n] such that x is adjacent 
##  to y iff x+z=y mod n for some z the list of <jumps>
##
##  \beginexample
##  gap> Circulant(6,[1,2]);   
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 2, 3, 5, 6 ], [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ], [ 2, 3, 5, 6 ], 
##    [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ] ] )
##  \endexample
##  
DeclareOperation("Circulant",[IsInt,IsList]);

############################################################################
##
#O  CuadraticRingGraph( <Rng> )
##
##  Returns the graph G whose vertices are the elements of <Rng> 
##  such that x is adjacent to y iff x+z^2=y for some z in <Rng>
##
##  \beginexample
##  gap> CuadraticRingGraph(ZmodnZ(8));
##  Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies := 
##  [ [ 2, 5, 8 ], [ 1, 3, 6 ], [ 2, 4, 7 ], [ 3, 5, 8 ], [ 1, 4, 6 ], 
##    [ 2, 5, 7 ], [ 3, 6, 8 ], [ 1, 4, 7 ] ] )
##  \endexample
##  
DeclareOperation("CuadraticRingGraph",[IsRing]);

############################################################################
##
#O  UnitsRingGraph( <Rng> )
##
##  Returns the graph G whose vertices are the elements of <Rng> 
##  such that x is adjacent to y iff x+z=y for some unit z of <Rng>
##
##  \beginexample
##  gap> UnitsRingGraph(ZmodnZ(8));    
##  Graph( Category := SimpleGraphs, Order := 8, Size := 16, Adjacencies := 
##  [ [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], 
##    [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ] ] )
##  \endexample
##  
DeclareOperation("UnitsRingGraph",[IsRing]);
