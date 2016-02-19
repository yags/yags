
############################################################################
##
#A  CliqueNumber( <G> )  
##  
##  <#GAPDoc Label="CliqueNumber">
##  <ManSection>
##  <Attr Name="CliqueNumber" Arg="G"/>
##  <Description>
##
##  Returns the order, $\omega(G)$, of a maximum clique of <A>G</A>. 
##
##  <Example>
##  gap> g:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies := 
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ], 
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CliqueNumber(g);
##  4
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("CliqueNumber",Graphs);

############################################################################
##
#P  IsCliqueHelly( <G> )
##  
##  <#GAPDoc Label="IsCliqueHelly">
##  <ManSection>
##  <Prop Name="IsCliqueHelly" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if the set of (maximal) cliques <A>G</A> satisfy
##  the <E>Helly</E> property.
##
##  The Helly property is defined as follows:
##
##  A non-empty family $\Cal{F}$ of non-empty sets satisfies the Helly property if
##  every pairwise intersecting subfamily of $\Cal{F}$ has a non-empty total intersection.
##
##  Here we use the Dragan-Szwarcfiter characterization <Cite Key="Dra89"/><Cite Key="Szw97"/> 
##  to compute the Helly property.
##
##  <Example>
##  gap> g:=SunGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 9, Adjacencies :=
##  [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], [ 2, 3, 5, 6 ], [ 4, 6 ],
##    [ 1, 2, 4, 5 ] ] )
##  gap> IsCliqueHelly(g);
##  false
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsCliqueHelly",Graphs);

############################################################################
##
#A  CliqueGraph( <G> )
#O  CliqueGraph( <G>, <maxNumCli> )
##  
##  <#GAPDoc Label="CliqueGraph">
##  <ManSection>
##  <Attr Name="CliqueGraph" Arg="G"/>
##  <Oper Name="CliqueGraph" Arg="G, maxNumCli"/>
##  <Description>
##
##  Returns the intersection graph of all the (maximal) cliques of <A>G</A>.
##  
##  The additional parameter <A>maxNumCli</A> aborts the computation when <A>maxNumCli</A> 
##  cliques are found, even if they are all the cliques of <A>G</A>. 
##  If the bound <A>maxNumCli</A> is reached, <A>fail</A> is returned.
##
##  <Example>
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
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("CliqueGraph",Graphs);
DeclareOperation("CliqueGraph",[Graphs,IsCyclotomic]);

############################################################################
##
#A  Cliques( <G> )
#O  Cliques( <G>, <maxNumCli> )
##  
##  <#GAPDoc Label="Cliques">
##  <ManSection>
##  <Attr Name="Cliques" Arg="G"/>
##  <Oper Name="Cliques" Arg="G, maxNumCli"/>
##  <Description>
##
##  Returns the set of all (maximal) cliques of a graph <A>G</A>. A clique is a maximal complete subgraph.
##  Here, we use the Bron-Kerbosch algorithm <Cite Key="BK73"/>.
##   
##  In the second form, It stops computing cliques after <A>maxNumCli</A> of them have been found.
##
##  <Example>
##  gap> Cliques(Octahedron);  
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ], [ 2, 3, 5 ], 
##    [ 2, 3, 6 ], [ 2, 4, 5 ], [ 2, 4, 6 ] ]
##  gap> Cliques(Octahedron,4);
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ] ]
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("Cliques",Graphs);
DeclareOperation("Cliques",[Graphs,IsCyclotomic]);


############################################################################
##
#A  NumberOfCliques( <G> )
#O  NumberOfCliques( <G>, <maxNumCli> )
##  
##  <#GAPDoc Label="NumberOfCliques">
##  <ManSection>
##  <Attr Name="NumberOfCliques" Arg="G"/>
##  <Oper Name="NumberOfCliques" Arg="G, maxNumCli"/>
##  <Description>
##  
##  Returns the number of (maximal) cliques of <A>G</A>.  
##  In the second form, It stops computing cliques after <A>maxNumCli</A> of them have been counted and 
##  returns <A>maxNumCli</A> in case <A>G</A> has <A>maxNumCli</A> or more cliques.
##  
##  <Example>
##  gap> NumberOfCliques(Icosahedron);
##  20
##  gap> NumberOfCliques(Icosahedron,15);
##  15
##  gap> NumberOfCliques(Icosahedron,50);
##  20
##  </Example>
##
##  This implementation discards the cliques once counted hence, given enough time, 
##  it can compute the number of cliques of <A>G</A> even if the set of cliques does not fit in memory.
##
##  <Example>
##  gap> NumberOfCliques(OctahedralGraph(30));
##  1073741824
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("NumberOfCliques",Graphs);
DeclareOperation("NumberOfCliques",[Graphs,IsCyclotomic]);



############################################################################
##
#O  Basement( <G>, <KnG>, <x> )
#O  Basement( <G>, <KnG>, <V> )
##  
##  <#GAPDoc Label="Basement">
##  <ManSection>
##  <Oper Name="Basement" Arg="G, KnG, x"/>
##  <Oper Name="Basement" Arg="G, KnG, V"/>
##  <Description>
##
##  Given a graph <A>G</A>, some iterated clique graph <A>KnG</A> of <A>G</A> and a 
##  vertex <A>x</A> of <A>KnG</A>,
##  the operation returns the <A>basement</A> of <A>x</A> with respect to <A>G</A> <Cite Key="Piz04"/>. 
##  Loosely speaking, the basement of <A>x</A> is the set of vertices of <A>G</A> that constitutes 
##  the iterated clique <A>x</A>.
##
##  <Example>
##  gap> g:=Icosahedron;;Cliques(g);
##  [ [ 1, 2, 3 ], [ 1, 2, 6 ], [ 1, 3, 4 ], [ 1, 4, 5 ], [ 1, 5, 6 ], 
##    [ 4, 5, 7 ], [ 4, 7, 11 ], [ 5, 7, 8 ], [ 7, 8, 12 ], [ 7, 11, 12 ], 
##    [ 5, 6, 8 ], [ 6, 8, 9 ], [ 8, 9, 12 ], [ 2, 6, 9 ], [ 2, 9, 10 ], 
##    [ 9, 10, 12 ], [ 2, 3, 10 ], [ 3, 10, 11 ], [ 10, 11, 12 ], [ 3, 4, 11 ] ]
##  gap> kg:=CliqueGraph(g);; k2g:=CliqueGraph(kg);;
##  gap> Basement(g,k2g,1);Basement(g,k2g,2);
##  [ 1, 2, 3, 4, 5, 6 ]
##  [ 1, 2, 3, 4, 6, 10 ]
##  </Example>
##
##  In its second form, <A>V</A> is a set of vertices of <A>KnG</A>, in that case, the basement is 
##  simply the union of the basements of the vertices in <A>V</A>.
##  
##  <Example>
##  gap> Basement(g,k2g,[1,2]);              
##  [ 1, 2, 3, 4, 5, 6, 10 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Basement",[Graphs,Graphs,IsList]);
DeclareOperation("Basement",[Graphs,Graphs,IsInt]);

############################################################################
##
#O  CompletesOfGivenOrder( <G>, <Ord> )
##  
##  <#GAPDoc Label="CompletesOfGivenOrder">
##  <ManSection>
##  <Oper Name="CompletesOfGivenOrder" Arg="G, Ord"/>
##  <Description>
##
##  Returns the list of vertex sets of all complete subgraphs of order <A>Ord</A> of <A>G</A>.
##
##  <Example>
##  gap> g:=SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 14, Adjacencies :=
##  [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], [ 2, 3, 5, 6, 8 ], [ 4, 6 ],
##    [ 2, 4, 5, 7, 8 ], [ 6, 8 ], [ 1, 2, 4, 6, 7 ] ] )
##  gap> CompletesOfGivenOrder(g,3);
##  [ [ 1, 2, 8 ], [ 2, 3, 4 ], [ 2, 4, 6 ], [ 2, 4, 8 ], [ 2, 6, 8 ],
##    [ 4, 5, 6 ], [ 4, 6, 8 ], [ 6, 7, 8 ] ]
##  gap> CompletesOfGivenOrder(g,4);
##  [ [ 2, 4, 6, 8 ] ]
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompletesOfGivenOrder",[Graphs,IsPosInt]);

############################################################################
##
#P  IsCliqueGated( <G> )
##  
##  <#GAPDoc Label="IsCliqueGated">
##  <ManSection>
##  <Prop Name="IsCliqueGated" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if <A>G</A> is a clique gated graph <Cite Key="HK96"/>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsCliqueGated",SimpleGraphs);


#E
