##
##  some methods that operate on ONE graph
##

##FIXME: Does this make sense outside SimpleGraphs Category?
############################################################################
##  
#O  LineGraph( <G> )
##  
##  <#GAPDoc Label="LineGraph">
##  <ManSection>
##  <Oper Name="LineGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the line graph <A>L(G)</A> of graph <A>G</A>. The line
##  graph is the intersection graph of the edges of <A>G</A>,
##  <A>i.e.</A> the vertices of <M>L(G)</M> are the edges of <A>G</A>
##  two of them being adjacent iff they are incident.
##  
##  <P/><Example> 
##  gap> g:=Tetrahedron;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  gap> LineGraph(g);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 1, 3, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("LineGraph",[Graphs]);
    
############################################################################
##  
#A  ComplementGraph( <G> )
##  
##  <#GAPDoc Label="ComplementGraph">
##  <ManSection>
##  <Attr Name="ComplementGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the new graph <A>H</A> such that <M>V(H)=V(G)</M> and
##  <M>xy\in E(H) \iff xy \not\in E(G)</M>.
##  
##  <P/><Example> 
##  gap> g:=ClawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
##  gap> ComplementGraph(g);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [  ], [ 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("ComplementGraph",Graphs);
    
##  FIXME: Makes sense in OrientedGraphs Category?
############################################################################
##  
#O  QuotientGraph( <G>, <Part> )
#O  QuotientGraph( <G>, <L1>, <L2> )
##  
##  <#GAPDoc Label="QuotientGraph">
##  <ManSection>
##  <Oper Name="QuotientGraph" Arg="G, Part"/>
##  <Oper Name="QuotientGraph" Arg="G, L1, L2"/>
##  <Description>
##  
##  <P/>Returns the quotient graph of graph <A>G</A> given a vertex
##  partition <A>Part</A>, by identifying any two vertices in the same
##  part.  The vertices of the quotient graph are the parts in the
##  partition <A>Part</A> two of them being adjacent iff any vertex in
##  one part is adjacent to any vertex in the other part.  Singletons
##  may be omitted in <A>Part</A>.
##  
##  <P/><Example> 
##  gap> g:=PathGraph(8);; 
##  gap> QuotientGraph(g,[[1,5,8],[2],[3],[4],[6],[7]]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 5, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], 
##    [ 1, 6 ], [ 1, 5 ] ] )
##  gap> QuotientGraph(g,[[1,5,8]]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 5, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], 
##    [ 1, 6 ], [ 1, 5 ] ] )
##  </Example>
##  
##  <P/>In its second form, <C>QuotientGraph</C> identifies each
##  vertex in list <A>L1</A>, with the corresponding vertex in list
##  <A>L2</A>. <A>L1</A> and <A>L2</A> must have the same length, but
##  any or both of them may have repetitions.
##  
##  <P/><Example> 
##  gap> g:=PathGraph(8);; 
##  gap> QuotientGraph(g,[[1,7],[4,8]]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], 
##    [ 4, 6 ], [ 1, 5 ] ] )
##  gap> QuotientGraph(g,[1,4],[7,8]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], 
##    [ 4, 6 ], [ 1, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("QuotientGraph",[Graphs,IsList]);
    
############################################################################
##  
#O  Cone( <G> )
##  
##  <#GAPDoc Label="Cone">
##  <ManSection>
##  <Oper Name="Cone" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the cone of graph <A>G</A>. The cone of <A>G</A> is
##  the graph obtained from <A>G</A> by adding a new vertex which is
##  adjacent to every vertex of <A>G</A>. The new vertex is the first
##  one in the new graph.
##  
##  <P/><Example> 
##  gap> Cone(CycleGraph(4));
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  8, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 5 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 2, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Cone",[Graphs]);
    
############################################################################
##  
#O  Suspension( <G> )
##  
##  <#GAPDoc Label="Suspension">
##  <ManSection>
##  <Oper Name="Suspension" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the suspension of graph <A>G</A>. The suspension of
##  <A>G</A> is the graph obtained from <A>G</A> by adding two new
##  vertices which are adjacent to every vertex of <A>G</A> but not to
##  each other. The new vertices are the first ones in the new graph.
##  
##  <P/><Example> 
##  gap> Suspension(CycleGraph(4));
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 4, 6 ], 
##    [ 1, 2, 3, 5 ], [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Suspension",[Graphs]);
    
############################################################################
##  
#O  ParedGraph( <G> )
##  
##  <#GAPDoc Label="ParedGraph">
##  <ManSection>
##  <Oper Name="ParedGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the pared graph of <A>G</A>. This is the induced
##  subgraph obtained from <A>G</A> by removing its dominated
##  vertices. When there are twin vertices (mutually dominated
##  vertices), exactly one of them survives the paring in each
##  equivalent class of mutually dominated vertices.
##  
##  <P/><Example>
##  gap> g1:=PathGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
##  gap> ParedGraph(g1);  
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> g2:=PathGraph(2);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> ParedGraph(g2);  
##  Graph( Category := SimpleGraphs, Order := 1, Size := 
##  0, Adjacencies := [ [  ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("ParedGraph",[Graphs]);
    
############################################################################
##  
#O  CompletelyParedGraph( <G> )
##  
##  <#GAPDoc Label="CompletelyParedGraph">
##  <ManSection>
##  <Oper Name="CompletelyParedGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the completely pared graph of <A>G</A>, which is
##  obtained by repeatedly applying <C>ParedGraph</C> until no more
##  dominated vertices remain.
##  
##  <P/><Example>
##  gap> g:=PathGraph(6);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  5, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4, 6 ], 
##    [ 5 ] ] )
##  gap> CompletelyParedGraph(g);
##  Graph( Category := SimpleGraphs, Order := 1, Size := 
##  0, Adjacencies := [ [  ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CompletelyParedGraph",[Graphs]);

#E
