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
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h)$. Given two such vertices $(g,h)$ and $(g',h')$ they are
##  adjacent <iff> $g = g'$ and $h \sim h'$ or $g \sim g'$ and $h = h'$.
##
##  \beginexample
##  gap> g1:=PathGraph(3);g2:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> g1g2:=BoxProduct(g1,g2);           
##  Graph( Category := SimpleGraphs, Order := 12, Size := 20, Adjacencies := 
##  [ [ 2, 4, 5 ], [ 1, 3, 6 ], [ 2, 4, 7 ], [ 1, 3, 8 ], [ 1, 6, 8, 9 ], 
##    [ 2, 5, 7, 10 ], [ 3, 6, 8, 11 ], [ 4, 5, 7, 12 ], [ 5, 10, 12 ], 
##    [ 6, 9, 11 ], [ 7, 10, 12 ], [ 8, 9, 11 ] ] )
##  gap> VertexNames(g1g2);
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
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h)$. Given two such vertices $(g,h)$ and $(g',h')$ they are
##  adjacent <iff> $g \sim g'$ and $h \sim h'$.
##
##  \beginexample
##  gap> g1:=PathGraph(3);g2:=CycleGraph(4);                              
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> g1g2:=TimesProduct(g1,g2);         
##  Graph( Category := SimpleGraphs, Order := 12, Size := 16, Adjacencies := 
##  [ [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ], [ 2, 4, 10, 12 ], [ 1, 3, 9, 11 ], 
##    [ 2, 4, 10, 12 ], [ 1, 3, 9, 11 ], [ 6, 8 ], [ 5, 7 ], [ 6, 8 ], [ 5, 7 ] ] )
##  gap> VertexNames(g1g2);                 
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
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h)$. Given two such vertices $(g,h)$ and $(g',h')$ such that
##  $(g,h) \neq (g',h')$ they are adjacent <iff> $g \simeq g'$ and $h
##  \simeq h'$. 
##
##  \beginexample
##  gap> g1:=PathGraph(3);g2:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> g1g2:=BoxTimesProduct(g1,g2);      
##  Graph( Category := SimpleGraphs, Order := 12, Size := 36, Adjacencies := 
##  [ [ 2, 4, 5, 6, 8 ], [ 1, 3, 5, 6, 7 ], [ 2, 4, 6, 7, 8 ], [ 1, 3, 5, 7, 8 ], 
##    [ 1, 2, 4, 6, 8, 9, 10, 12 ], [ 1, 2, 3, 5, 7, 9, 10, 11 ], 
##    [ 2, 3, 4, 6, 8, 10, 11, 12 ], [ 1, 3, 4, 5, 7, 9, 11, 12 ], 
##    [ 5, 6, 8, 10, 12 ], [ 5, 6, 7, 9, 11 ], [ 6, 7, 8, 10, 12 ], 
##    [ 5, 7, 8, 9, 11 ] ] )
##  gap> VertexNames(g1g2);                 
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
##  gap> g1:=PathGraph(3);g2:=PathGraph(2); 
##  Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies := 
##  [ [ 2 ], [ 1 ] ] )
##  gap> DisjointUnion(g1,g2);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2 ], [ 5 ], [ 4 ] ] )
##  \endexample
##
DeclareOperation("DisjointUnion",[Graphs,Graphs]);

############################################################################
##
#O  Join( <G>, <H> )
##
##  Returns the result of joining graph <G> and <H>, <G> + <H> 
##  (also known as the Zykov sum \index{Zykov sum}).
##
##  Joining graphs is computed as follows:
##
##  First, we obtain the disjoint union of graphs <G> and <H>. Second,
##  for each vertex $g \in G$ we add an edge to each vertex $h \in H$.
##
##  \beginexample
##  gap> g1:=DiscreteGraph(2);g2:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 0, Adjacencies := 
##  [ [  ], [  ] ] )
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##  [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> Join(g1,g2);                           
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
##  gap> g1:=CycleGraph(4);;g2:=DiscreteGraph(2);;                  
##  gap> Composition(g1,g2);                      
##  Graph( Category := SimpleGraphs, Order := 8, Size := 16, Adjacencies := 
##  [ [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ], 
##    [ 3, 4, 7, 8 ], [ 3, 4, 7, 8 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ] ] )
##  \endexample
##  
DeclareOperation("Composition",[Graphs,Graphs]);

#E
