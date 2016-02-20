############################################################################
##
#O  GroupGraph( <G>, <Grp>, <Act> )
#O  GroupGraph( <G>, <Grp> )
##  
##  <#GAPDoc Label="GroupGraph">
##  <ManSection>
##  <Oper Name="GroupGraph" Arg="G, Grp, Act"/>
##  <Oper Name="GroupGraph" Arg="G, Grp"/>
##  <Description>
##
##  <P/>Given a graph <A>G</A>, a group <A>Grp</A> and an action <A>Act</A> of <A>Grp</A> in some 
##  set S which contains Vertices( <A>G</A> ), GroupGraph returns a new graph 
##  with vertex set <M>\{act(v,g) : g \in Grp, v \in Vertices( G )\}</M> 
##  and edge set <M>\{\{act(v,g),act(u,g)\}: g\ in Grp \{u,v\}\in Edges( G )\}</M>.
##  
##  <P/>If <A>Act</A> is omited, the standard &GAP; action <C>OnPoints</C> is used.
##
##  <Example>
##  gap> GroupGraph(GraphByWalks([1,2]),Group([(1,2,3,4,5),(2,5)(3,4)]));
##  Graph( Category := SimpleGraphs, Order := 5, Size := 5, Adjacencies := 
##  [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GroupGraph",[Graphs,IsGroup,IsFunction]);
DeclareOperation("GroupGraph",[Graphs,IsGroup,]);

############################################################################
##
#O  CayleyGraph( <Grp>, <Elms> )
#O  CayleyGraph( <Grp> )
##  
##  <#GAPDoc Label="CayleyGraph">
##  <ManSection>
##  <Oper Name="CayleyGraph" Arg="Grp, Elms"/>
##  <Oper Name="CayleyGraph" Arg="Grp"/>
##  <Description>
##
##  <P/>Returns the graph <M>G</M> whose vertices are the elements of the group <A>Grp</A> 
##  such that <M>x</M> is adjacent to <M>y</M> iff <M>x*g=y</M> for some <M>g</M> in the list <A>Elms</A>.
##  if <A>Elms</A> is not provided, then the generators of <A>G</A> are used instead.
##
##  <Example>
##  gap> grp:=Group((1,2,3),(1,2));    
##  Group([ (1,2,3), (1,2) ])
##  gap> CayleyGraph(grp);             
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies := 
##  [ [ 3, 4, 5 ], [ 3, 5, 6 ], [ 1, 2, 6 ], [ 1, 5, 6 ], [ 1, 2, 4 ], 
##    [ 2, 3, 4 ] ] )
##  gap> CayleyGraph(grp,[(1,2),(2,3)]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 6, Adjacencies := 
##  [ [ 2, 3 ], [ 1, 5 ], [ 1, 4 ], [ 3, 6 ], [ 2, 6 ], [ 4, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CayleyGraph",[IsGroup,IsList]);
DeclareOperation("CayleyGraph",[IsGroup]);

############################################################################
##
#O  RingGraph( <Rng>, <Elms> )
##  
##  <#GAPDoc Label="RingGraph">
##  <ManSection>
##  <Oper Name="RingGraph" Arg="Rng, Elms"/>
##  <Description>
##
##  <P/>Returns the graph G whose vertices are the elements of the ring <A>Rng</A> 
##  such that x is adjacent to y iff x+r=y for some r in <A>Elms</A>.
##
##  <Example>
##  gap> r:=FiniteField(8);Elements(r); 
##  GF(2^3)
##  [ 0*Z(2), Z(2)^0, Z(2^3), Z(2^3)^2, Z(2^3)^3, Z(2^3)^4, Z(2^3)^5, Z(2^3)^6 ]
##  gap> RingGraph(r,[Z(2^3),Z(2^3)^4]);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 8, Adjacencies := 
##  [ [ 3, 6 ], [ 5, 7 ], [ 1, 4 ], [ 3, 6 ], [ 2, 8 ], [ 1, 4 ], [ 2, 8 ], 
##    [ 5, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RingGraph",[IsRing,IsList]);

############################################################################
##
#O  Circulant( <n>, <Jumps> )
##  
##  <#GAPDoc Label="Circulant">
##  <ManSection>
##  <Oper Name="Circulant" Arg="n, Jumps"/>
##  <Description>
##
##  <P/>Returns the graph G whose vertices are [1..n] such that x is adjacent 
##  to y iff x+z=y mod n for some z the list of <A>Jumps</A>.
##
##  <Example>
##  gap> Circulant(6,[1,2]);   
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 2, 3, 5, 6 ], [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ], [ 2, 3, 5, 6 ], 
##    [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Circulant",[IsInt,IsList]);

############################################################################
##
#O  QuadraticRingGraph( <Rng> )
##  
##  <#GAPDoc Label="QuadraticRingGraph">
##  <ManSection>
##  <Oper Name="QuadraticRingGraph" Arg="Rng"/>
##  <Description>
##
##  <P/>Returns the graph G whose vertices are the elements of <A>Rng</A> 
##  such that x is adjacent to y iff <M>x+z^2=y</M> for some z in <A>Rng</A>.
##
##  <Example>
##  gap> QuadraticRingGraph(ZmodnZ(8));
##  Graph( Category := SimpleGraphs, Order := 8, Size := 12, Adjacencies := 
##  [ [ 2, 5, 8 ], [ 1, 3, 6 ], [ 2, 4, 7 ], [ 3, 5, 8 ], [ 1, 4, 6 ], 
##    [ 2, 5, 7 ], [ 3, 6, 8 ], [ 1, 4, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("QuadraticRingGraph",[IsRing]);

############################################################################
##
#O  UnitsRingGraph( <Rng> )
##  
##  <#GAPDoc Label="UnitsRingGraph">
##  <ManSection>
##  <Oper Name="UnitsRingGraph" Arg="Rng"/>
##  <Description>
##
##  <P/>Returns the graph G whose vertices are the elements of <A>Rng</A> 
##  such that x is adjacent to y iff x+z=y for some unit z of <A>Rng</A>.
##
##  <Example>
##  gap> UnitsRingGraph(ZmodnZ(8));    
##  Graph( Category := SimpleGraphs, Order := 8, Size := 16, Adjacencies := 
##  [ [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], 
##    [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("UnitsRingGraph",[IsRing]);
