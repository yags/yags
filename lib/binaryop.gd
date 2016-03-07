##
##  some methods that operate on TWO or more graphs
##  mainly products and sums.
##

############################################################################
##  
#O  BoxProduct( <G>, <H> );
##  
##  <#GAPDoc Label="BoxProduct">
##  <ManSection>
##  <Oper Name="BoxProduct" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the box product, <A>G</A> <M>\square</M> <A>H</A>, of
##  two graphs <A>G</A> and <A>H</A> (also known as the cartesian
##  product).
##  
##  <P/>The box product is calculated as follows:
##  
##  <P/>For each pair of vertices <M>x \in G, y \in H</M> we create a
##  vertex <M>(x,y)</M>. Given two such vertices <M>(x,y)</M> and
##  <M>(x',y')</M> they are adjacent iff <M>x = x</M> and <M>y \sim
##  y'</M> or <M>x \sim x'</M> and <M>y = y'</M>.
##  
##  <Example>
##  gap> g:=PathGraph(3);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=BoxProduct(g,h);           
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  20, Adjacencies := [ [ 2, 4, 5 ], [ 1, 3, 6 ], [ 2, 4, 7 ], 
##    [ 1, 3, 8 ], [ 1, 6, 8, 9 ], [ 2, 5, 7, 10 ], [ 3, 6, 8, 11 ], 
##    [ 4, 5, 7, 12 ], [ 5, 10, 12 ], [ 6, 9, 11 ], [ 7, 10, 12 ], 
##    [ 8, 9, 11 ] ] )
##  gap> VertexNames(gh);
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
##    [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("BoxProduct",[Graphs,Graphs]);
    
############################################################################
##  
#O  TimesProduct( <G>, <H> )
##  
##  <#GAPDoc Label="TimesProduct">
##  <ManSection>
##  <Oper Name="TimesProduct" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the times product of two graphs <A>G</A> and <A>H</A>,
##  <A>G</A> <M>\times</M> <A>H</A> (also known as the tensor
##  product).
##  
##  <P/>The times product is computed as follows:
##  
##  <P/>For each pair of vertices <M>x \in G, y \in H</M> we create a
##  vertex <M>(x,y)</M>. Given two such vertices <M>(x,y)</M> and
##  <M>(x',y')</M> they are adjacent iff <M>x \sim x'</M> and <M>y
##  \sim y'</M>.
##  
##  <Example>
##  gap> g:=PathGraph(3);h:=CycleGraph(4);                              
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=TimesProduct(g,h);         
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  16, Adjacencies := [ [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ], 
##    [ 2, 4, 10, 12 ], [ 1, 3, 9, 11 ], [ 2, 4, 10, 12 ], 
##    [ 1, 3, 9, 11 ], [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ] ] )
##  gap> VertexNames(gh);                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
##    [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("TimesProduct",[Graphs,Graphs]);
    
############################################################################
##  
#O  BoxTimesProduct( <G>, <H> )
##  
##  <#GAPDoc Label="BoxTimesProduct">
##  <ManSection>
##  <Oper Name="BoxTimesProduct" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the boxtimes product of two graphs <A>G</A> and
##  <A>H</A>, <A>G</A> <M>\boxtimes</M> <A>H</A> (also known as the
##  strong product).
##  
##  <P/>The boxtimes product is calculated as follows:
##  
##  <P/>For each pair of vertices <M>x \in G, y \in H</M> we create a
##  vertex <M>(x,y)</M>. Given two such vertices <M>(x,y)</M> and
##  <M>(x',y')</M> such that <M>(x,y) \neq (x',y')</M> they are
##  adjacent iff <M>x \simeq x'</M> and <M>y \simeq y'</M>.
##  
##  <Example>
##  gap> g:=PathGraph(3);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=BoxTimesProduct(g,h);      
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  36, Adjacencies := [ [ 2, 4, 5, 6, 8 ], [ 1, 3, 5, 6, 7 ], 
##    [ 2, 4, 6, 7, 8 ], [ 1, 3, 5, 7, 8 ], [ 1, 2, 4, 6, 8, 9, 10, 12 ], 
##    [ 1, 2, 3, 5, 7, 9, 10, 11 ], [ 2, 3, 4, 6, 8, 10, 11, 12 ], 
##    [ 1, 3, 4, 5, 7, 9, 11, 12 ], [ 5, 6, 8, 10, 12 ], 
##    [ 5, 6, 7, 9, 11 ], [ 6, 7, 8, 10, 12 ], [ 5, 7, 8, 9, 11 ] ] )
##  gap> VertexNames(gh);                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], 
##    [ 2, 3 ], [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("BoxTimesProduct",[Graphs,Graphs]);
## DeclareOperation("Union",[Graphs,Graphs]);
    
############################################################################
##  
#O  DisjointUnion( <G>, <H> )
##  
##  <#GAPDoc Label="DisjointUnion">
##  <ManSection>
##  <Oper Name="DisjointUnion" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the disjoint union of two graphs <A>G</A> and
##  <A>H</A>, <M>G <Alt Only="LaTeX">\dot</Alt>\cup H </M>.
##  
##  <Example>
##  gap> g:=PathGraph(3);h:=PathGraph(2); 
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> DisjointUnion(g,h);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ], [ 5 ], [ 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("DisjointUnion",[Graphs,Graphs]);
    
############################################################################
##  
#O  Join( <G>, <H> )
##  
##  <#GAPDoc Label="Join">
##  <ManSection>
##  <Oper Name="Join" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the join graph <A>G</A> + <A>H</A> of <A>G</A> and
##  <A>H</A> (also known as the Zykov sum<Index>Zykov sum</Index>); it
##  is the graph obtained from the disjoint union of <A>G</A> and
##  <A>H</A> by adding every possible edge from every vertex in
##  <A>G</A> to every vertex in <A>H</A>.
##  
##  <Example>
##  gap> g:=DiscreteGraph(2);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  0, Adjacencies := [ [  ], [  ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> Join(g,h);                           
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 4, 6 ], 
##    [ 1, 2, 3, 5 ], [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Join",[Graphs,Graphs]); # Zykov Sum
    
############################################################################
##  
#O  GraphSum( <G>, <L> )
##  
##  <#GAPDoc Label="GraphSum">
##  <ManSection>
##  <Oper Name="GraphSum" Arg="G, L"/>
##  <Description>
##  
##  <P/>Returns the lexicographic sum of a list of graphs <A>L</A>
##  over a graph <A>G</A>.
##  
##  <P/>The lexicographic sum is computed as follows:
##  
##  <P/>Given <A>G</A>, with <M>Order(G)=n</M> and a list of <A>n</A>
##  graphs <M>L = [G_1, \ldots, G_n]</M>, We take the disjoint union
##  of <M>G_1,G_2, \ldots,G_n</M> and then we add all the edges
##  between <M>G_i</M> and <M>G_j</M> whenever <M>[i,j]</M> is and
##  edge of <M>G</M>.
##  
##  <P/>If <A>L</A> contains holes, the trivial graph is used in
##  place.
##  
##  <Example>
##  gap> t:=TrivialGraph;; g:=CycleGraph(4);;
##  gap> GraphSum(PathGraph(3),[t,g,t]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], 
##    [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  gap> GraphSum(PathGraph(3),[,g,]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], 
##    [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GraphSum",[Graphs,IsList]);
    
############################################################################
##  
#O  Composition( <G>, <H> )
##  
##  <#GAPDoc Label="Composition">
##  <ManSection>
##  <Oper Name="Composition" Arg="G, H"/>
##  <Description>
##  
##  <P/>Returns the composition <M>G[H]</M> of two graphs <A>G</A> and
##  <A>H</A>.
##  
##  <P/>A composition of graphs is obtained by calculating the
##  GraphSum of <A>G</A> with <A>Order(G)</A> copies of <A>H</A>,
##  <M>G[H] = GraphSum(G, [H, \ldots, H])</M>.
##  
##  <Example>
##  gap> g:=CycleGraph(4);;h:=DiscreteGraph(2);;                  
##  gap> Composition(g,h);                      
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  16, Adjacencies := [ [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Composition",[Graphs,Graphs]);

#E
