
############################################################################
##
#A  CliqueNumber( <G> )  
##  
##  <#GAPDoc Label="CliqueNumber">
##  <ManSection>
##  <Attr Name="CliqueNumber" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the order, <M>\omega( <A>G</A> )</M>, of a maximum clique of
##  <A>G</A>.<Index>clique number</Index>
##  <Index Key="omega"><M>\omega(G)</M></Index>
##
##  <P/>
##  <Example>
##  gap> g:=SunGraph(4);
##  Graph( rec( Category := SimpleGraphs, Order := 8, Size := 
##  14, Adjacencies := [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], 
##    [ 2, 3, 5, 6, 8 ], [ 4, 6 ], [ 2, 4, 5, 7, 8 ], [ 6, 8 ], 
##    [ 1, 2, 4, 6, 7 ] ] ) )
##  gap> Cliques(g);
##  [ [ 2, 4, 6, 8 ], [ 2, 3, 4 ], [ 1, 2, 8 ], [ 4, 5, 6 ], [ 6, 7, 8 ] ]
##  gap> CliqueNumber(g);
##  4
##  </Example>
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 1 (see
##  <Ref Label="YAGSInfo.InfoClass"/>).
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
##  <P/>Returns <C>true</C> if the set of (maximal) cliques <A>G</A>
##  satisfy the <E>Helly</E> property.
##  <Index>clique-Helly</Index>
##
##  <P/>The Helly property is defined as follows:
##  
##  <P/>A non-empty family <M>F</M> of non-empty sets satisfies the
##  Helly property if every pairwise intersecting subfamily of
##  <M>F</M> has a non-empty total intersection.
##  <Index>Helly property</Index>
##  
##  <P/>Here we use the Dragan-Szwarcfiter characterization <Cite
##  Key="Dra89"/><Cite Key="Szw97"/> to compute the Helly property.
##  <Index Subkey="Dragan-Szwarcfiter characterization">clique-Helly</Index>
##
##  <P/>
##  <Example>
##  gap> g:=SunGraph(3);
##  Graph( rec( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], 
##    [ 2, 3, 5, 6 ], [ 4, 6 ], [ 1, 2, 4, 5 ] ] ) )
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
##  <P/>Returns the intersection graph, <M>K(<A>G</A>)</M><Index
##  Key="K"><M>K(G)</M></Index>, of all the (maximal) cliques of
##  <A>G</A>.<Index>clique graph</Index>
##  <Index Subkey="clique">graph</Index>
##  
##  <P/>The additional parameter <A>maxNumCli</A> aborts the
##  computation when <A>maxNumCli</A> cliques are found, even if they
##  are all the cliques of <A>G</A>.  If the bound <A>maxNumCli</A> is
##  reached, <C>fail</C> is returned. However, the clique graph of
##  <A>G</A> is returned if it has been computed earlier, regardless
##  of the value of <A>maxNumCli</A>.
##
##  <P/>
##  <Example>
##  gap> CliqueGraph(Cube);           
##  Graph( rec( Category := SimpleGraphs, Order := 12, Size := 
##  24, Adjacencies := [ [ 2, 3, 5, 7 ], [ 1, 3, 4, 11 ], [ 1, 2, 8, 10 ],
##    [ 2, 5, 6, 11 ], [ 1, 4, 6, 7 ], [ 4, 5, 9, 12 ], [ 1, 5, 8, 9 ], 
##    [ 3, 7, 9, 10 ], [ 6, 7, 8, 12 ], [ 3, 8, 11, 12 ], 
##    [ 2, 4, 10, 12 ], [ 6, 9, 10, 11 ] ] ) )
##  gap> CliqueGraph(Octahedron,8);
##  fail
##  gap> CliqueGraph(Octahedron,9); 
##  Graph( rec( Category := SimpleGraphs, Order := 8, Size := 
##  24, Adjacencies := [ [ 2, 3, 4, 5, 6, 7 ], [ 1, 3, 4, 5, 6, 8 ], 
##    [ 1, 2, 4, 5, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], 
##    [ 1, 2, 4, 5, 7, 8 ], [ 1, 3, 4, 5, 6, 8 ], [ 2, 3, 4, 5, 6, 7 ] 
##   ] ) )
##  gap> CliqueGraph(Octahedron,8); 
##  Graph( rec( Category := SimpleGraphs, Order := 8, Size := 
##  24, Adjacencies := [ [ 2, 3, 4, 5, 6, 7 ], [ 1, 3, 4, 5, 6, 8 ], 
##    [ 1, 2, 4, 5, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], [ 1, 2, 3, 6, 7, 8 ], 
##    [ 1, 2, 4, 5, 7, 8 ], [ 1, 3, 4, 5, 6, 8 ], [ 2, 3, 4, 5, 6, 7 ] 
##   ] ) )
##  </Example>
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 1 (see
##  <Ref Label="YAGSInfo.InfoClass"/>).
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
##  <P/>Returns the set of all (maximal) cliques of a graph <A>G</A>. A
##  clique is a maximal complete subgraph<Index>clique</Index>.  Here, we use the
##  Bron-Kerbosch algorithm <Cite Key="BK73"/><Index>Bron-Kerbosch algorithm</Index>.
##   
##  <P/>In the second form, It stops computing cliques after
##  <A>maxNumCli</A> of them have been found.
##
##  <P/>
##  <Example>
##  gap> Cliques(Octahedron);  
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ], [ 2, 3, 5 ], 
##    [ 2, 3, 6 ], [ 2, 4, 5 ], [ 2, 4, 6 ] ]
##  gap> Cliques(Octahedron,4);
##  [ [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 4, 5 ], [ 1, 4, 6 ] ]
##  </Example>
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 1 (see
##  <Ref Label="YAGSInfo.InfoClass"/>).
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
##  <P/>Returns the number of (maximal) cliques of <A>G</A>.  In the
##  second form, it stops computing cliques after <A>maxNumCli</A> of
##  them have been counted and returns <A>maxNumCli</A> in case
##  <A>G</A> has <A>maxNumCli</A> or more cliques.
##  
##  <P/>
##  <Example>
##  gap> NumberOfCliques(Icosahedron,15);
##  15
##  gap> NumberOfCliques(Icosahedron);
##  20
##  gap> NumberOfCliques(Icosahedron,50);
##  20
##  </Example>
##  
##  <P/>This implementation discards the cliques once counted hence,
##  given enough time, it can compute the number of cliques of
##  <A>G</A> even if the set of cliques does not fit in memory.  This
##  test may take several minutes to complete:
##  
##  <P/><Log>
##  gap> NumberOfCliques(OctahedralGraph(30));
##  1073741824
##  </Log>
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 1 (see
##  <Ref Label="YAGSInfo.InfoClass"/>).
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
##  <P/>Given a graph <A>G</A>, some iterated clique graph <A>KnG</A>
##  of <A>G</A> and a vertex <A>x</A> of <A>KnG</A>, the operation
##  returns the <A>basement</A><Index>basement</Index> of <A>x</A> 
##  with respect to <A>G</A>
##  <Cite Key="Piz04"/>.  Loosely speaking, the basement of <A>x</A>
##  is the set of vertices of <A>G</A> that constitutes the iterated
##  clique <A>x</A>. 
##  
##  <P/>
##  <Example>
##  gap> g:=Icosahedron;;Cliques(g);
##  [ [ 1, 2, 3 ], [ 1, 2, 6 ], [ 1, 3, 4 ], [ 1, 4, 5 ], [ 1, 5, 6 ], 
##    [ 4, 5, 7 ], [ 4, 7, 11 ], [ 5, 7, 8 ], [ 7, 8, 12 ], 
##    [ 7, 11, 12 ], [ 5, 6, 8 ], [ 6, 8, 9 ], [ 8, 9, 12 ], [ 2, 6, 9 ], 
##    [ 2, 9, 10 ], [ 9, 10, 12 ], [ 2, 3, 10 ], [ 3, 10, 11 ], 
##    [ 10, 11, 12 ], [ 3, 4, 11 ] ]
##  gap> kg:=CliqueGraph(g);; k2g:=CliqueGraph(kg);;
##  </Example>
##  <Log>
##  gap> Basement(g,k2g,1);Basement(g,k2g,2);
##  [ 1, 2, 3, 4, 5, 6 ]
##  [ 1, 2, 3, 4, 6, 10 ]
##  </Log>
##  
##  <P/>Formally, taking <C>m=n-1</C>, the basement is defined as follows:  
## 
##  <P/><Table Align="l">
##  <Row><Item><C>Basement(G,G,x):=x;</C></Item></Row>
##  <Row><Item><C>Basement(G,KG,x):=VertexNames(KG)[x];</C></Item></Row>
##  <Row><Item><C>Basement(G,KnG,x):= Union(List(VertexNames(KnG)[x]),
##  z->Basement(G,KmG,z));</C></Item></Row>
##  </Table>
##
##  <P/>In its second form, <A>V</A> is a set of vertices of
##  <A>KnG</A>, in that case, the basement is simply the union of the
##  basements of the vertices in <A>V</A>.
##  
##  <P/>
##  <Example>
##  gap> Basement(g,k2g,[1,2]);              
##  [ 1, 2, 3, 4, 5, 6, 10 ]
##  </Example>
##  
##  <P/>Basements have been used to study distances and diameters of clique
##  graphs in <Cite Key="BS95"/> and <Cite Key="Piz04"/>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Basement",[Graphs,Graphs,IsList]);
DeclareOperation("Basement",[Graphs,Graphs,IsInt]);

############################################################################
##
#O  CompletesOfGivenOrder( <G>, <ord> )
##  
##  <#GAPDoc Label="CompletesOfGivenOrder">
##  <ManSection>
##  <Oper Name="CompletesOfGivenOrder" Arg="G, ord"/>
##  <Description>
##  
##  <P/>Returns the list of vertex sets of all complete subgraphs of
##  order <A>ord</A> of <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=SunGraph(4);
##  Graph( rec( Category := SimpleGraphs, Order := 8, Size := 
##  14, Adjacencies := [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], 
##    [ 2, 3, 5, 6, 8 ], [ 4, 6 ], [ 2, 4, 5, 7, 8 ], [ 6, 8 ], 
##    [ 1, 2, 4, 6, 7 ] ] ) )
##  gap> CompletesOfGivenOrder(g,3);
##  [ [ 1, 2, 8 ], [ 2, 3, 4 ], [ 2, 4, 6 ], [ 2, 4, 8 ], [ 2, 6, 8 ], 
##    [ 4, 5, 6 ], [ 4, 6, 8 ], [ 6, 7, 8 ] ]
##  gap> CompletesOfGivenOrder(g,4);
##  [ [ 2, 4, 6, 8 ] ]
##  </Example>
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 3 (see
##  <Ref Label="YAGSInfo.InfoClass"/> and Section <Ref
##  Sect="debuggingbacktracks"/>).
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
##  <P/>Returns <C>true</C> if <A>G</A> is a clique gated graph <Cite
##  Key="HK96"/>.
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 1 (see
##  <Ref Label="YAGSInfo.InfoClass"/>).
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsCliqueGated",SimpleGraphs);

#E
