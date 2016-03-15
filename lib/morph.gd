##################################################################
##  
#O  NextPropertyMorphism( <G>, <H>, <F>, <PropList> )
##  
##  <#GAPDoc Label="NextPropertyMorphism">
##  <ManSection>
##  <Oper Name="NextPropertyMorphism" Arg="G, H, F, PropList"/>
##  <Description>
##  
##  <P/>Returns the next morphism (in lexicographic order) from
##  <A>G</A> to <A>H</A> satisfying the list of properties
##  <A>PropList</A> starting with (possibly incomplete) morphism
##  <A>F</A>. The morphism found will me returned *and* stored in
##  <A>F</A> in order to use it as the next starting point, in case
##  <C>NextPropertyMorphism</C> is called again. The operation returns
##  <C>fail</C> if there are no more morphisms of the specified type.
##  
##  <P/>A number of preprogrammed properties are provided by &YAGS;,
##  and the user may create additional ones. The properties provided
##  are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>,
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##  
##  <P/>If <A>G</A> has <A>n</A> vertices and <M>f:G\rightarrow H</M>
##  is a morphism, it is represented as <C><A>F</A>=[f(1), f(2), ...,
##  f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=[];; PropList:=[CHK_MORPH,CHK_MONO];;                   
##  gap> NextPropertyMorphism(g,h,f,PropList);                    
##  [ 1, 3, 2, 4 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 1, 4, 2, 3 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 2, 3, 1, 4 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 2, 4, 1, 3 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 3, 1, 4, 2 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 3, 2, 4, 1 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 4, 1, 3, 2 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  [ 4, 2, 3, 1 ]
##  gap> NextPropertyMorphism(g,h,f,PropList);
##  fail
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("NextPropertyMorphism",[Graphs,Graphs,IsList,IsList]);

##################################################################
##  
#O  PropertyMorphism( <G>, <H>, <PropList> )
##  
##  <#GAPDoc Label="PropertyMorphism">
##  <ManSection>
##  <Oper Name="PropertyMorphism" Arg="G, H, PropList"/>
##  <Description>
##  
##  <P/>Returns the first morphism (in lexicographic order) from
##  <A>G</A> to <A>H</A> satisfying the list of properties
##  <A>PropList</A>.
##  
##  <P/>A number of preprogrammed properties are provided by &YAGS;,
##  and the user may create additional ones. The properties provided
##  are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>,
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##  
##  <P/>If <A>G</A> has <A>n</A> vertices and <M>f:G\rightarrow H</M>
##  is a morphism, it is represented as <C><A>F</A>=[f(1), f(2), ...,
##  f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> PropList:=[CHK_MORPH];;                            
##  gap> PropertyMorphism(g,h,PropList);                          
##  [ 1, 3, 1, 3 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PropertyMorphism",[Graphs,Graphs,IsList]);

##################################################################
##  
#O  PropertyMorphisms( <G>, <H>, <PropList> )
##  
##  <#GAPDoc Label="PropertyMorphisms">
##  <ManSection>
##  <Oper Name="PropertyMorphisms" Arg="G, H, PropList"/>
##  <Description>
##  
##  <P/>Returns all morphisms from <A>G</A> to <A>H</A> satisfying the
##  list of properties <A>PropList</A>.
##  
##  <P/>A number of preprogrammed properties are provided by &YAGS;,
##  and the user may create additional ones. The properties provided
##  are: <C>CHK_WEAK</C>, <C>CHK_MORPH</C>, <C>CHK_METRIC</C>,
##  <C>CHK_CMPLT</C>, <C>CHK_MONO</C> and <C>CHK_EPI</C>.
##  
##  <P/>If <A>G</A> has <A>n</A> vertices and <M>f:G\rightarrow H</M>
##  is a morphism, it is represented as <C><A>F</A>=[f(1), f(2), ...,
##  f(n)]</C>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> PropList:=[CHK_WEAK,CHK_MONO];;                    
##  gap> PropertyMorphisms(g,h,PropList);
##  [ [ 1, 3, 2, 4 ], [ 1, 4, 2, 3 ], [ 2, 3, 1, 4 ], [ 2, 4, 1, 3 ], 
##    [ 3, 1, 4, 2 ], [ 3, 2, 4, 1 ], [ 4, 1, 3, 2 ], [ 4, 2, 3, 1 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PropertyMorphisms",[Graphs,Graphs,IsList]);

####The following code was automatically generated:

DeclareOperation("NextMetricMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextEpiMetricMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextMonoMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullMonoMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextBiMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullBiMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextCompleteEpiWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextCompleteEpiMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextCompleteWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextCompleteMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullEpiWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullEpiMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextFullMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextEpiWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextEpiMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextWeakMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("NextMorphism",[Graphs,Graphs,IsList]);

DeclareOperation("MetricMorphism",[Graphs,Graphs]);
DeclareOperation("EpiMetricMorphism",[Graphs,Graphs]);
DeclareOperation("MonoMorphism",[Graphs,Graphs]);
DeclareOperation("FullMonoMorphism",[Graphs,Graphs]);
DeclareOperation("BiMorphism",[Graphs,Graphs]);
DeclareOperation("FullBiMorphism",[Graphs,Graphs]);
DeclareOperation("CompleteEpiWeakMorphism",[Graphs,Graphs]);
DeclareOperation("CompleteEpiMorphism",[Graphs,Graphs]);
DeclareOperation("CompleteWeakMorphism",[Graphs,Graphs]);
DeclareOperation("CompleteMorphism",[Graphs,Graphs]);
DeclareOperation("FullEpiWeakMorphism",[Graphs,Graphs]);
DeclareOperation("FullEpiMorphism",[Graphs,Graphs]);
DeclareOperation("FullWeakMorphism",[Graphs,Graphs]);
DeclareOperation("FullMorphism",[Graphs,Graphs]);
DeclareOperation("EpiWeakMorphism",[Graphs,Graphs]);
DeclareOperation("EpiMorphism",[Graphs,Graphs]);
DeclareOperation("WeakMorphism",[Graphs,Graphs]);
DeclareOperation("Morphism",[Graphs,Graphs]);

DeclareOperation("MetricMorphisms",[Graphs,Graphs]);
DeclareOperation("EpiMetricMorphisms",[Graphs,Graphs]);
DeclareOperation("MonoMorphisms",[Graphs,Graphs]);
DeclareOperation("FullMonoMorphisms",[Graphs,Graphs]);
DeclareOperation("BiMorphisms",[Graphs,Graphs]);
DeclareOperation("FullBiMorphisms",[Graphs,Graphs]);
DeclareOperation("CompleteEpiWeakMorphisms",[Graphs,Graphs]);
DeclareOperation("CompleteEpiMorphisms",[Graphs,Graphs]);
DeclareOperation("CompleteWeakMorphisms",[Graphs,Graphs]);
DeclareOperation("CompleteMorphisms",[Graphs,Graphs]);
DeclareOperation("FullEpiWeakMorphisms",[Graphs,Graphs]);
DeclareOperation("FullEpiMorphisms",[Graphs,Graphs]);
DeclareOperation("FullWeakMorphisms",[Graphs,Graphs]);
DeclareOperation("FullMorphisms",[Graphs,Graphs]);
DeclareOperation("EpiWeakMorphisms",[Graphs,Graphs]);
DeclareOperation("EpiMorphisms",[Graphs,Graphs]);
DeclareOperation("WeakMorphisms",[Graphs,Graphs]);
DeclareOperation("Morphisms",[Graphs,Graphs]);



