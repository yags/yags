##################################################################
##
#O  NextPropertyMorphism( <G1>, <G2>, <m>, <c> )
##
##  Returns the next morphisms that is true for the list of checks <c>
##  given graphs <G1> and <G2> starting with (possibly incomplete)
##  morphism <m>. 
##  Note that if <m> is a variable the operation will change its
##  value to the result of the operation.
##
## \beginexample
## gap> f:=[];;
## gap> NextPropertyMorphism(CycleGraph(4),CompleteGraph(4),f,[CHQ_MONO,CHQ_MORPH$
## [ 1, 2, 3, 4 ]
## gap> NextPropertyMorphism(CycleGraph(4),CompleteGraph(4),f,[CHQ_MONO,CHQ_MORPH$
## [ 1, 2, 4, 3 ]
## gap> f;
## [ 1, 2, 4, 3 ]
## \endexample
##
DeclareOperation("NextPropertyMorphism",[Graphs,Graphs,IsList,IsList]);

##################################################################
##
#O  PropertyMorphism( <G1>, <G2>, <c> )
##
##  Returns the first morphisms that is true for the list of checks <c>
##  given graphs <G1> and <G2>.
##
## \beginexample
## gap> PropertyMorphism(CycleGraph(4),CompleteGraph(4),[CHQ_MONO,CHQ_MORPH]);
## [ 1, 2, 3, 4 ]
## \endexample
##
DeclareOperation("PropertyMorphism",[Graphs,Graphs,IsList]);

##################################################################
##
#O  PropertyMorphisms( <G1>, <G2>, <c> )
##
##  Returns all morphisms that are true for the list of checks <c>
##  given graphs <G1> and <G2>.
##
## \beginexample
## gap> PropertyMorphism(CycleGraph(4),CompleteGraph(4),[CHQ_MONO,CHQ_MORPH]);
## [ [ 1, 2, 3, 4 ], [ 1, 2, 4, 3 ], [ 1, 3, 2, 4 ], [ 1, 3, 4, 2 ],
##   [ 1, 4, 2, 3 ], [ 1, 4, 3, 2 ], [ 2, 1, 3, 4 ], [ 2, 1, 4, 3 ],
##   [ 2, 3, 1, 4 ], [ 2, 3, 4, 1 ], [ 2, 4, 1, 3 ], [ 2, 4, 3, 1 ],
##   [ 3, 1, 2, 4 ], [ 3, 1, 4, 2 ], [ 3, 2, 1, 4 ], [ 3, 2, 4, 1 ],
##   [ 3, 4, 1, 2 ], [ 3, 4, 2, 1 ], [ 4, 1, 2, 3 ], [ 4, 1, 3, 2 ],
##   [ 4, 2, 1, 3 ], [ 4, 2, 3, 1 ], [ 4, 3, 1, 2 ], [ 4, 3, 2, 1 ] ]
## \endexample
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



