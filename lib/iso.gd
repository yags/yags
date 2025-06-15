
############################################################################
##  
#O  IsoMorphism( <G>, <H> )
##  
##  <#GAPDoc Label="IsoMorphism">
##  <ManSection>
##  <Oper Name="IsoMorphism" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns one isomorphism from <A>G</A> to <A>H</A> or
##  <C>fail</C> if none exists. If <A>G</A> has <C>n</C> vertices, an
##  isomorphisms <M>f : <A>G</A>\rightarrow <A>H</A></M> is represented as the list
##  <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=IsoMorphism(g,h);
##  [ 1, 3, 2, 4 ]
##  </Example>
##  
##  <P/>See <Ref Func="NextIsoMorphism"/>.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsoMorphism",[Graphs,Graphs]);


############################################################################
##  
#O  NextIsoMorphism( <G>, <H>, <F> )
##  
##  <#GAPDoc Label="NextIsoMorphism">
##  <ManSection>
##  <Oper Name="NextIsoMorphism" Arg="G, H, F"/>
##  <Description>
##  
##  <P/>Returns the next isomorphism (after <A>F</A>) from <A>G</A> to
##  <A>H</A> in the lexicographic order; returns <C>fail</C> if there
##  are no more isomorphisms. If <A>G</A> has <C>n</C> vertices, an
##  isomorphisms <M>f : <A>G</A>\rightarrow <A>H</A></M> is
##  represented as the list <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=IsoMorphism(g,h);
##  [ 1, 3, 2, 4 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 1, 4, 2, 3 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 2, 3, 1, 4 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 2, 4, 1, 3 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextIsoMorphism",[Graphs,Graphs,IsList]);

############################################################################
##  
#O  IsoMorphisms( <G>, <H> )
##  
##  <#GAPDoc Label="IsoMorphisms">
##  <ManSection>
##  <Oper Name="IsoMorphisms" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the list of all isomorphism from <A>G</A> to
##  <A>H</A>. If <A>G</A> has <C>n</C> vertices, an isomorphisms
##  <M>f:<A>G</A>\rightarrow <A>H</A></M> is represented as the list
##  <C><A>F</A>=[f(1), f(2), ..., f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> IsoMorphisms(g,h);
##  [ [ 1, 3, 2, 4 ], [ 1, 4, 2, 3 ], [ 2, 3, 1, 4 ], [ 2, 4, 1, 3 ], 
##    [ 3, 1, 4, 2 ], [ 3, 2, 4, 1 ], [ 4, 1, 3, 2 ], [ 4, 2, 3, 1 ] ]
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsoMorphisms",[Graphs,Graphs]);

############################################################################
##
#O  IsIsomorphicGraph( <G>, <H> )
##  
##  <#GAPDoc Label="IsIsomorphicGraph">
##  <ManSection>
##  <Oper Name="IsIsomorphicGraph" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> when <A>G</A> is isomorphic to <A>H</A>
##  and <C>false</C> otherwise.
##  <Index Subkey="isomorphic">graphs</Index>
##
##  <P/><Example>
##  gap> g:=PowerGraph(CycleGraph(6),2);;h:=Octahedron;;
##  gap> IsIsomorphicGraph(g,h);
##  true
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsIsomorphicGraph",[Graphs,Graphs]);

##AutomorphismGroup() is already declared by GAP 
############################################################################
##
#A  AutomorphismsGroup( <G> )
#O  AutGroupGraph( <G> )
##  
##  <#GAPDoc Label="AutomorphismGroup"><Index>AutGroupGraph</Index>
##  <ManSection>
##  <Attr Name="AutomorphismGroup" Arg="G"/>
##  <Oper Name="AutGroupGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the group of automorphisms<Index Subkey="group
##  of">automorphisms</Index> of the graph <A>G</A>.  Both forms are
##  synonyms.
##  <Index Subkey="automorphism group of a">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> AutomorphismGroup(Icosahedron);
##  Group([ (1,2,10,11,4)(5,6,9,12,7), (1,2,10,12,7,5)(3,9,11,8,4,6) ])
##  gap> AutGroupGraph(Icosahedron);
##  Group([ (1,2,10,11,4)(5,6,9,12,7), (1,2,10,12,7,5)(3,9,11,8,4,6) ])
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("AutGroupGraph",[Graphs]);

#E

