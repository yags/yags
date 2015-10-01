##
##  some methods that operate on TWO or more graphs
##  mainly products and sums.
##

############################################################################
##
#O  BoxProduct( <G>, <H> );
##
##  Returns the box product, <G> $\square$ <H>, of two graphs <G> and <H> 
##  (also known as the cartesian product).
##
##  The box product is calculated as follows:
##
##  For each pair of vertices $x \in G, y \in H$ we create a vertex
##  $(x,y)$. Given two such vertices $(x,y)$ and $(x',y')$ they are
##  adjacent <iff> $x = x'$ and $y \sim y'$ or $x \sim x'$ and $y = y'$.
##
##  \beginexample
##  gap> g:=PathGraph(3);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=BoxProduct(g,h);           
##  Graph( Category := SimpleGraphs, Order := 12, Size := 20, Adjacencies := 
##  [ [ 2, 4, 5 ], [ 1, 3, 6 ], [ 2, 4, 7 ], [ 1, 3, 8 ], [ 1, 6, 8, 9 ], 
##    [ 2, 5, 7, 10 ], [ 3, 6, 8, 11 ], [ 4, 5, 7, 12 ], [ 5, 10, 12 ], 
##    [ 6, 9, 11 ], [ 7, 10, 12 ], [ 8, 9, 11 ] ] )
##  gap> VertexNames(gh);
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], 
##    [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  \endexample
##
DeclareOperation("BoxProduct",[Graphs,Graphs]);

############################################################################
##
#O  TimesProduct( <G>, <H> )
##
##  Returns the times product of two graphs <G> and <H>, <G> $\times$ <H>
##  (also known as the tensor product).
##
##  The times product is computed as follows:
##
##  For each pair of vertices $x \in G, y \in H$ we create a vertex
##  $(x,y)$. Given two such vertices $(x,y)$ and $(x',y')$ they are
##  adjacent <iff> $x \sim x'$ and $y \sim y'$.
##
##  \beginexample
##  gap> g:=PathGraph(3);h:=CycleGraph(4);                              
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=TimesProduct(g,h);         
##  Graph( Category := SimpleGraphs, Order := 12, Size := 16, Adjacencies := 
##  [ [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ], [ 2, 4, 10, 12 ], [ 1, 3, 9, 11 ], 
##    [ 2, 4, 10, 12 ], [ 1, 3, 9, 11 ], [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ] ] )
##  gap> VertexNames(gh);                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], 
##    [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  \endexample
##
DeclareOperation("TimesProduct",[Graphs,Graphs]);

############################################################################
##
#O  BoxTimesProduct( <G>, <H> )
##
##  Returns the boxtimes product of two graphs <G> and <H>, <G>
##  $\boxtimes$ <H> (also known as the strong product). 
##
##  The boxtimes product is calculated as follows:
##
##  For each pair of vertices $x \in G, y \in H$ we create a vertex
##  $(x,y)$. Given two such vertices $(x,y)$ and $(x',y')$ such that
##  $(x,y) \neq (x',y')$ they are adjacent <iff> $x \simeq x'$ and $y
##  \simeq y'$. 
##
##  \beginexample
##  gap> g:=PathGraph(3);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> gh:=BoxTimesProduct(g,h);      
##  Graph( Category := SimpleGraphs, Order := 12, Size := 36, Adjacencies := 
##  [ [ 2, 4, 5, 6, 8 ], [ 1, 3, 5, 6, 7 ], [ 2, 4, 6, 7, 8 ], [ 1, 3, 5, 7, 8 ], 
##    [ 1, 2, 4, 6, 8, 9, 10, 12 ], [ 1, 2, 3, 5, 7, 9, 10, 11 ], 
##    [ 2, 3, 4, 6, 8, 10, 11, 12 ], [ 1, 3, 4, 5, 7, 9, 11, 12 ], 
##    [ 5, 6, 8, 10, 12 ], [ 5, 6, 7, 9, 11 ], [ 6, 7, 8, 10, 12 ], 
##    [ 5, 7, 8, 9, 11 ] ] )
##  gap> VertexNames(gh);                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], 
##    [ 2, 4 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]
##  \endexample
##
DeclareOperation("BoxTimesProduct",[Graphs,Graphs]);
## DeclareOperation("Union",[Graphs,Graphs]);

############################################################################
##
#O  DisjointUnion( <G>, <H> )
##
##  Returns the disjoint union of two graphs <G> and <H>, <G> $\dot{\cup}$ <H>.
## 
##  \beginexample
##  gap> g:=PathGraph(3);h:=PathGraph(2); 
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [ 1 ] ] )
##  gap> DisjointUnion(g,h);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ], [ 5 ], [ 4 ] ] )
##  \endexample
##
DeclareOperation("DisjointUnion",[Graphs,Graphs]);

############################################################################
##
#O  Join( <G>, <H> )
##
##  \index{Zykov sum}
##  Returns the join graph <G> + <H> of <G> and <H>  (also known as the Zykov sum);
##  it is the graph obtained from the disjoint union of <G> and <H> by
##  adding every possible edge from every vertex in <G> to every vertex in <H>.
##
##  \beginexample
##  gap> g:=DiscreteGraph(2);h:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 0, Adjacencies := 
##  [ [  ], [  ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> Join(g,h);                           
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ], 
##    [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ] ] )
##  \endexample
##
DeclareOperation("Join",[Graphs,Graphs]); # Zykov Sum

############################################################################
##
#O  GraphSum( <G>, <L> )
##
##  Returns the lexicographic sum of a list of graphs <L> over a graph <G>.
##
##  The lexicographic sum is computed as follows:
##
##  Given <G>, with $Order(G)=n$ and a list of <n> graphs $L = [G_1, \ldots, G_n]$,
##  We take the disjoint union of $G_1,G_2, \ldots,G_n$ and then we add all the 
##  edges between $G_i$ and $G_j$ whenever $[i,j]$ is and edge of $G$.
##
##  If <L> contains holes, the trivial graph is used in place.
##
##  \beginexample
##  gap> t:=TrivialGraph;; g:=CycleGraph(4);;
##  gap> GraphSum(PathGraph(3),[t,g,t]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], [ 1, 3, 5, 6 ], 
##    [ 1, 2, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  gap> GraphSum(PathGraph(3),[,g,]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 5, 6 ], [ 1, 2, 4, 6 ], [ 1, 3, 5, 6 ], 
##    [ 1, 2, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  \endexample
##
DeclareOperation("GraphSum",[Graphs,IsList]);

############################################################################
##
#O  Composition( <G>, <H> )
##
##  Returns the composition $G[H]$ of two graphs <G> and <H>.
##
##  A composition of graphs is obtained by calculating the GraphSum
##  of <G> with <Order(G)> copies of <H>, $G[H] = GraphSum(G, [H, \ldots, H])$.
##
##  \beginexample
##  gap> g:=CycleGraph(4);;h:=DiscreteGraph(2);;                  
##  gap> Composition(g,h);                      
##  Graph( Category := SimpleGraphs, Order := 8, Size := 16, Adjacencies := 
##  [ [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ], 
##    [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ] ] )
##  \endexample
##  
DeclareOperation("Composition",[Graphs,Graphs]);

#E
