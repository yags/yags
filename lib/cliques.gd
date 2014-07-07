
############################################################################
##
#A  CliqueNumber( <G> )  
##
##  Returns the order, $\omega(G)$, of a maximum clique of <G>. 
##
##  \beginexample
##  gap> g:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies := 
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ], 
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CliqueNumber(g);
##  4
##  \endexample
##
##  --map
DeclareAttribute("CliqueNumber",Graphs);

############################################################################
##
#A  IsCliqueHelly( <G> )
##
##  Returns `true' if the set of (maximal) cliques <G> satisfy
##  the <Helly> property.
##
##  The Helly property is defined as follows:
##
##  A non-empty family $\Cal{F}$ of non-empty sets satisfies the Helly property if
##  every pairwise intersecting subfamily of $\Cal{F}$ has a non-empty total intersection.
##
##  Here we use the Dragan-Szwarcfiter characterization \cite{Dra89,Szw97} to compute the Helly property.
##
##  \beginexample
##  gap> g:=SunGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
##  [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], [ 2, 3, 5, 6 ], [ 4, 6 ],
##    [ 1, 2, 4, 5 ] ] )
##  gap> IsCliqueHelly(g);
##  false
##  \endexample
##
##  --map
DeclareQtfyProperty("IsCliqueHelly",Graphs);

############################################################################
##
#A  CliqueGraph( <G> )
#O  CliqueGraph( <G>, <m> )
##
##  Returns the intersection graph of all the (maximal) cliques of <G>.
##  
##  The additional parameter <m> aborts the computation when <m> cliques are found, 
##  even if they are all the cliques of <G>. If the bound <m> is reached, <fail> is returned.
##
##  \beginexample
##  gap> CliqueGraph(Octahedron);   
##  Graph( Category := SimpleGraphs, Order := 8, Size := 24, Adjacencies := 
##  [ [ 2, 3, 4, 5, 6, 7 ], [ 1, 3, 4, 5, 6, 8 ], [ 1, 2, 4, 5, 7, 8 ], 
##    [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 4, 5, 7, 8 ], 
##    [ 1, 3, 4, 5, 6, 8 ], [ 2, 3, 4, 5, 6, 7 ] ] )
##  gap> CliqueGraph(Octahedron,9); 
##  Graph( Category := SimpleGraphs, Order := 8, Size := 24, Adjacencies := 
##  [ [ 2, 3, 4, 5, 6, 7 ], [ 1, 3, 4, 5, 6, 8 ], [ 1, 2, 4, 5, 7, 8 ], 
##    [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 4, 5, 7, 8 ], 
##    [ 1, 3, 4, 5, 6, 8 ], [ 2, 3, 4, 5, 6, 7 ] ] )
##  gap> CliqueGraph(Octahedron,8);
##  fail
##  \endexample
##
##  --map
DeclareAttribute("CliqueGraph",Graphs);
DeclareOperation("CliqueGraph",[Graphs,IsCyclotomic]);

############################################################################
##
#A  Cliques( <G> )
#O  Cliques( <G>, <m> )
##
##  Returns the set of all (maximal) cliques of a graph <G>. A clique is a maximal complete subgraph.
##  Here, we use the Bron-Kerbosch algorithm \cite{BK73}.
##   
##  In the second form, It stops computing cliques after <m> of them have been found.
##
##  \beginexample
##  gap> Cliques(Octahedron);  
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ], [ 2, 3, 5 ], 
##    [ 2, 3, 6 ], [ 2, 4, 5 ], [ 2, 4, 6 ] ]
##  gap> Cliques(Octahedron,4);
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ] ]
##  \endexample
##
##  --map
DeclareAttribute("Cliques",Graphs);
DeclareOperation("Cliques",[Graphs,IsCyclotomic]);


############################################################################
##
#A  NumberOfCliques( <G> )
#O  NumberOfCliques( <G>, <m> )
##  
##  Returns the number of (maximal) cliques of <G>.  
##  In the second form, It stops computing cliques after <m> of them have been counted and 
##  returns <m> in case <G> has <m> or more cliques.
##  
##  \beginexample
##  gap> NumberOfCliques(Icosahedron);
##  20
##  gap> NumberOfCliques(Icosahedron,15);
##  15
##  gap> NumberOfCliques(Icosahedron,50);
##  20
##  \endexample
##
##  This implementation discards the cliques once counted hence, given enough time, 
##  it can compute the number of cliques of <G> even if the set of cliques does not fit in memory.
##
##  \beginexample
##  gap> NumberOfCliques(OctahedralGraph(30));
##  1073741824
##  \endexample
##
##  --map
DeclareAttribute("NumberOfCliques",Graphs);
DeclareOperation("NumberOfCliques",[Graphs,IsCyclotomic]);



############################################################################
##
#O  Basement( <G>, <KnG>, <x> )
#O  Basement( <G>, <KnG>, <V> )
##
##  Given a graph <G>, some iterated clique graph <KnG> of <G> and a vertex <x> of <KnG>,
##  the operation computes the <basement> of <x> with respect to <G> \cite{Piz04}. 
##  Loosely speaking, the basement of <x> is the set of vertices of <G> that constitutes 
##  the iterated clique <x>.
##
##  \beginexample
##  gap> g:=Icosahedron;;Cliques(g);
##  [ [ 1, 2, 3 ], [ 1, 2, 6 ], [ 1, 3, 4 ], [ 1, 4, 5 ], [ 1, 5, 6 ], 
##    [ 4, 5, 7 ], [ 4, 7, 11 ], [ 5, 7, 8 ], [ 7, 8, 12 ], [ 7, 11, 12 ], 
##    [ 5, 6, 8 ], [ 6, 8, 9 ], [ 8, 9, 12 ], [ 2, 6, 9 ], [ 2, 9, 10 ], 
##    [ 9, 10, 12 ], [ 2, 3, 10 ], [ 3, 10, 11 ], [ 10, 11, 12 ], [ 3, 4, 11 ] ]
##  gap> kg:=CliqueGraph(g);; k2g:=CliqueGraph(kg);;
##  gap> Basement(g,k2g,1);Basement(g,k2g,2);
##  [ 1, 2, 3, 4, 5, 6 ]
##  [ 1, 2, 3, 4, 6, 10 ]
##  \endexample
##
##  In its second form, <V> is a set of vertices of <KnG>, in that case, the basement is 
##  simply the union of the basements of the vertices in <V>.
##  
##  \beginexample
##  gap> Basement(g,k2g,[1,2]);              
##  [ 1, 2, 3, 4, 5, 6, 10 ]
##  \endexample
##  
##  --map
DeclareOperation("Basement",[Graphs,Graphs,IsList]);
DeclareOperation("Basement",[Graphs,Graphs,IsInt]);

############################################################################
##
#O  CompletesOfGivenOrder( <G>, <o> )
##
##  This operation finds all complete subgraphs of order <o> in graph <G>.
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
##  --map
DeclareOperation("CompletesOfGivenOrder",[Graphs,IsPosInt]);

############################################################################
##
#A  IsCliqueGated( <G> )
##
##  Returns `true' if <G> is a clique gated graph \cite{HK96}.
##  
##  --map
DeclareQtfyProperty("IsCliqueGated",SimpleGraphs);


#E
