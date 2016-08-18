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
##  <P/>Given a graph <A>G</A>, a group <A>Grp</A> and an action
##  <A>Act</A> of <A>Grp</A> on some set S which contains <M>Vertices(
##  <A>G</A> )</M>, <C>GroupGraph</C> returns a new graph with vertex
##  set <M>\{<A>Act</A>(v,g) : g \in <A>Grp</A>, v \in Vertices(
##  <A>G</A> )\}</M> and edge set
##  <M>\{\{<A>Act</A>(v,g),<A>Act</A>(u,g)\}: g\in <A>Grp</A>,
##  \{u,v\}\in Edges( <A>G</A> )\}</M>.
##  
##  <P/>If <A>Act</A> is omitted, the standard &GAP; action
##  <C>OnPoints</C> is used.
##  
##  <P/><Example>
##  gap> GroupGraph(GraphByWalks([1,2]),Group([(1,2,3,4,5),(2,5)(3,4)]));
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] 
##   ] )
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
##  <P/>Returns the graph <M>G</M> whose vertices are the elements of
##  the group <A>Grp</A> such that <M>x</M> is adjacent to <M>y</M>
##  iff <M>x*g=y</M> for some <M>g</M> in the list <A>Elms</A>.  If
##  <A>Elms</A> is not provided, then the generators of <A>G</A> are
##  used instead.
##
##  <P/><Example>
##  gap> grp:=Group((1,2,3),(1,2));    
##  Group([ (1,2,3), (1,2) ])
##  gap> CayleyGraph(grp);             
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 3, 4, 5 ], [ 3, 5, 6 ], [ 1, 2, 6 ], 
##    [ 1, 5, 6 ], [ 1, 2, 4 ], [ 2, 3, 4 ] ] )
##  gap> CayleyGraph(grp,[(1,2),(2,3)]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  6, Adjacencies := [ [ 2, 3 ], [ 1, 5 ], [ 1, 4 ], [ 3, 6 ], [ 2, 6 ], 
##    [ 4, 5 ] ] )
##  gap> VertexNames(last);
##  [ (), (2,3), (1,2), (1,2,3), (1,3,2), (1,3) ]
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
##  <P/>Returns the graph G whose vertices are the elements of the
##  ring <A>Rng</A> such that x is adjacent to y iff x+r=y for some r
##  in <A>Elms</A>.
##  
##  <P/><Example>
##  gap> r:=FiniteField(8);Elements(r); 
##  GF(2^3)
##  [ 0*Z(2), Z(2)^0, Z(2^3), Z(2^3)^2, Z(2^3)^3, Z(2^3)^4, Z(2^3)^5, 
##    Z(2^3)^6 ]
##  gap> RingGraph(r,[Z(2^3),Z(2^3)^4]);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  8, Adjacencies := [ [ 3, 6 ], [ 5, 7 ], [ 1, 4 ], [ 3, 6 ], [ 2, 8 ], 
##    [ 1, 4 ], [ 2, 8 ], [ 5, 7 ] ] )
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
##  <P/>Returns the graph <C>G</C> whose vertices are <C>[1..n]</C>
##  such that <C>x</C> is adjacent to <C>y</C> iff <C>x+z=y</C> mod
##  <C>n</C> for some <C>z</C> the ist of <A>Jumps</A>.
##  
##  <P/><Example>
##  gap> Circulant(6,[1,2]);   
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 2, 3, 5, 6 ], [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ], 
##    [ 2, 3, 5, 6 ], [ 1, 3, 4, 6 ], [ 1, 2, 4, 5 ] ] )
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
##  <P/>Returns the graph G whose vertices are the elements of
##  <A>Rng</A> such that x is adjacent to y iff <M>x+z^2=y</M> for
##  some z in <A>Rng</A>.
##  
##  <P/><Example>
##  gap> QuadraticRingGraph(ZmodnZ(8));
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  12, Adjacencies := [ [ 2, 5, 8 ], [ 1, 3, 6 ], [ 2, 4, 7 ], 
##    [ 3, 5, 8 ], [ 1, 4, 6 ], [ 2, 5, 7 ], [ 3, 6, 8 ], [ 1, 4, 7 ] ] )
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
##  <P/>Returns the graph G whose vertices are the elements of
##  <A>Rng</A> such that x is adjacent to y iff x+z=y for some unit z
##  of <A>Rng</A>.
##  
##  <P/><Example>
##  gap> UnitsRingGraph(ZmodnZ(8));    
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  16, Adjacencies := [ [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], 
##    [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], [ 1, 3, 5, 7 ], [ 2, 4, 6, 8 ], 
##    [ 1, 3, 5, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("UnitsRingGraph",[IsRing]);
