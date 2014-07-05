
############################################################################
##
#A  CliqueNumber( <G> )  
##
##  The order of the largest clique in <G>, $\omega(G)$. 
##
##  \beginexample
##  gap> G:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CliqueNumber(G);
##  4
##  \endexample
##
DeclareAttribute("CliqueNumber",Graphs);

############################################################################
##
#Q  IsCliqueHelly( <G> )
##
##  The attribute form is `true' if all cliques of graph <G> satisfy
##  the <Helly> property.
##  The property form measures how far graph <G> is from being
##  cliquehelly, <i.e.> the number of non-Helly cliques in <G>.
##
##  The Helly property is defined as follows:
##
##  A family $\Cal{F}$ of sets satisfies the Helly property if
##  $$\eqalign{\forall \Cal{X} \subseteq& \Cal{F} \cr
##  \forall x_1,x_2 \in& \Cal{X} \cr
##  x_1 \cap x_2 \neq \phi \Rightarrow& \bigcap \Cal{X} \neq \phi}$$
##
##  The algorithm used to compute the Helly property is by Jayme
##
##  \beginexample
##  gap> G:=SunGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
##  [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], [ 2, 3, 5, 6 ], [ 4, 6 ],
##    [ 1, 2, 4, 5 ] ] )
##  gap> IsCliqueHelly(G);
##  false
##  gap> QtfyIsCliqueHelly(G);
##  1
##  \endexample
##
DeclareQtfyProperty("IsCliqueHelly",Graphs);

############################################################################
##
#A  CliqueGraph( <G> )
#O  CliqueGraph( <G>, <m> )
##
##  The clique graph of graph <G>, $K(G)$. The additional parameter <m>
##  stops the operation when a maximum of <m> cliques have been found.
##
##  \beginexample
##  gap> G:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CliqueGraph(G);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 8, Adjacencies :=
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 4 ], [ 1, 2, 5 ], [ 1, 2, 5 ], [ 1, 3, 4 ] ] )
##  \endexample
##
DeclareAttribute("CliqueGraph",Graphs);
DeclareOperation("CliqueGraph",[Graphs,IsCyclotomic]);

############################################################################
##
#A  Cliques( <G> )
#O  Cliques( <G>, <m> )
##
##  The set of all cliques in graph <G> using the Bron-Kerbosch algorithm.
##  The additional parameter <m> stops the operation when a maximum of
##  <m> cliques have been found.  
##
##  Each clique is represented by the set of vertices in <G> that
##  belong to the clique. A set is represented as a list.
##
##  \beginexample
##  gap> G:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> Cliques(G);
##  [ [ 2, 4, 6, 8 ], [ 2, 4, 3 ], [ 2, 1, 8 ], [ 5, 4, 6 ], [ 7, 6, 8 ] ]
##  \endexample
##
DeclareAttribute("Cliques",Graphs);
DeclareOperation("Cliques",[Graphs,IsCyclotomic]);


############################################################################
##
#A  NumberOfCliques( <G> )
#O  NumberOfCliques( <G>, <m> )
##
##FIXME: Document!
##
DeclareAttribute("NumberOfCliques",Graphs);
DeclareOperation("NumberOfCliques",[Graphs,IsCyclotomic]);



############################################################################
##
#O  Basement( <G>, <KnG>, <x> )
#O  Basement( <G>, <KnG>, <V> )
##
##  The operation calculates the basement 
##
##  Given a graph <G> and <Q> a subset of the vertices in <G> the
##  basement of <G>  
##
##  \beginexample
##  G:=RandomGraph(4);
##  Order(G);
##  4
##  \endexample
##
DeclareOperation("Basement",[Graphs,Graphs,IsList]);
DeclareOperation("Basement",[Graphs,Graphs,IsInt]);

############################################################################
##
#O  CompletesOfGivenOrder( <G>, <o> )
##
##  This operation finds all complete graphs of order <o> in graph <G>.
##
##  \beginexample
##  gap> G:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CompletesOfGivenOrder(G,3);
##  [ [ 1, 2, 8 ], [ 2, 3, 4 ], [ 2, 4, 6 ], [ 2, 4, 8 ], [ 2, 6, 8 ],
##    [ 4, 5, 6 ], [ 4, 6, 8 ], [ 6, 7, 8 ] ]
##  gap> CompletesOfGivenOrder(G,4);
##  [ [ 2, 4, 6, 8 ] ]
##  \endexample
##
DeclareOperation("CompletesOfGivenOrder",[Graphs,IsPosInt]);

############################################################################
##
#O  IsCliqueGated( <G>, <qtfy> )
##
##  \beginexample
##  G:=RandomGraph(4);
##  Order(G);
##  4
##  \endexample
##
DeclareQtfyProperty("IsCliqueGated",SimpleGraphs);


#E
