############################################################################
##
#O  GroupGraph( <G>, <Grp>, <act> )
#O  GroupGraph( <G>, <Grp> )
##
##  Given a graph <G>, a group <Grp> and an action <act> of <Grp> in some 
##  set S which contains Vertices( <G> ), GroupGraph returns a new graph 
##  with vertex set $\{act(v,g) : g \in Grp, v \in Vertices( G )\}$ 
##  and edge set
##  $\{\{act(v,g),act(u,g)\}: g\ in Grp \{u,v\}\in Edges( G )\}$.
##  
##  If <act> is omited, the standard \GAP action 'OnPoints' is used.
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
DeclareOperation("CayleyGraph",[IsGroup,IsList]);
DeclareOperation("CayleyGraph",[IsGroup]);

############################################################################
##
#O  RingGraph( <Rng>, <elms> )
##
##  Returns the graph G whose vertices are the elements of the ring <Rng> 
##  such that x is adjacent to y iff x+r=y for some r in <elms>.
##
DeclareOperation("RingGraph",[IsRing,IsList]);

############################################################################
##
#O  Circulant( <n>, <jumps> )
##
##  Returns the graph G whose vertices are [1..n] such that x is adjacent 
##  to y iff x+z=y mod n for some z the list of <jumps>
##
DeclareOperation("Circulant",[IsInt,IsList]);

############################################################################
##
#O  CuadraticRingGraph( <Rng> )
##
##  Returns the graph G whose vertices are the elements of <Rng> 
##  such that x is adjacent to y iff x+z^2=y for some z in <Rng>
##
DeclareOperation("CuadraticRingGraph",[IsRing]);

############################################################################
##
#O  UnitsRingGraph( <Rng> )
##
##  Returns the graph G whose vertices are the elements of <Rng> 
##  such that x is adjacent to y iff x+z=y for some unit z of <Rng>
##
DeclareOperation("UnitsRingGraph",[IsRing]);
