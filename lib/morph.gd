##################################################################
##
#O  NextPropertyMorphism( <G1>, <G2>, <m>, <c> )
##
##  Returns the next morphisms (in lexicographic order) from <G1> to <G2> 
##  satisfying the list of properties <c> starting with (possibly incomplete) 
##  morphism <m>. The morphism found will me returned *and* stored in <m>
##  in order to use it as the next starting point, in case `NextPropertyMorphism'
##  is called again. The operation returns `fail' if there are no more morphisms of 
##  the specified type.
##
##  A number of preprogrammed properties are provided by {\YAGS}, and the user may create 
##  additional ones. The properties provided are: `CHK_WEAK', `CHK_MORPH', `CHK_METRIC', 
##  `CHK_CMPLT', `CHK_MONO' and `CHK_EPI'.
##
##  If <G1> has <n> vertices and $f:G1\rightarrow G2$ is a morphism, it is 
##  represented as `[f(1), f(2), ..., f(n)]'. 
##
##  \beginexample
##  gap> g1:=CycleGraph(4);;g2:=CompleteBipartiteGraph(2,2);;
##  gap> m:=[];; c:=[CHK_MORPH,CHK_MONO];;                   
##  gap> NextPropertyMorphism(g1,g2,m,c);                    
##  [ 1, 3, 2, 4 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 1, 4, 2, 3 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 2, 3, 1, 4 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 2, 4, 1, 3 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 3, 1, 4, 2 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 3, 2, 4, 1 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 4, 1, 3, 2 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  [ 4, 2, 3, 1 ]
##  gap> NextPropertyMorphism(g1,g2,m,c);
##  fail
##  \endexample
##  
DeclareOperation("NextPropertyMorphism",[Graphs,Graphs,IsList,IsList]);

##################################################################
##
#O  PropertyMorphism( <G1>, <G2>, <c> )
##
##  Returns the first morphisms (in lexicographic order) from <G1> to <G2> 
##  satisfying the list of properties <c>
##
##  A number of preprogrammed properties are provided by {\YAGS}, and the user may create 
##  additional ones. The properties provided are: `CHK_WEAK', `CHK_MORPH', `CHK_METRIC', 
##  `CHK_CMPLT', `CHK_MONO' and `CHK_EPI'.
##
##  If <G1> has <n> vertices and $f:G1\rightarrow G2$ is a morphism, it is 
##  represented as `[f(1), f(2), ..., f(n)]'. 
##
##  \beginexample
##  gap> g1:=CycleGraph(4);;g2:=CompleteBipartiteGraph(2,2);;
##  gap> c:=[CHK_MORPH];;                            
##  gap> PropertyMorphism(g1,g2,c);                          
##  [ 1, 3, 1, 3 ]
##  \endexample
##  
DeclareOperation("PropertyMorphism",[Graphs,Graphs,IsList]);

##################################################################
##
#O  PropertyMorphisms( <G1>, <G2>, <c> )
##
##  Returns all morphisms from <G1> to <G2> 
##  satisfying the list of properties <c>
##
##  A number of preprogrammed properties are provided by {\YAGS}, and the user may create 
##  additional ones. The properties provided are: `CHK_WEAK', `CHK_MORPH', `CHK_METRIC', 
##  `CHK_CMPLT', `CHK_MONO' and `CHK_EPI'.
##
##  If <G1> has <n> vertices and $f:G1\rightarrow G2$ is a morphism, it is 
##  represented as `[f(1), f(2), ..., f(n)]'. 
##
##  \beginexample
##  gap> g1:=CycleGraph(4);;g2:=CompleteBipartiteGraph(2,2);;
##  gap> c:=[CHK_WEAK,CHK_MONO];;                    
##  gap> PropertyMorphisms(g1,g2,c);
##  [ [ 1, 3, 2, 4 ], [ 1, 4, 2, 3 ], [ 2, 3, 1, 4 ], [ 2, 4, 1, 3 ], 
##    [ 3, 1, 4, 2 ], [ 3, 2, 4, 1 ], [ 4, 1, 3, 2 ], [ 4, 2, 3, 1 ] ]
##  \endexample
##
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



