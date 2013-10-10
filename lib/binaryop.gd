##
##  some methods that operate on TWO or more graphs
##  mainly products and sums.
##

############################################################################
##
#O  BoxProduct( <G>, <H> );
##
##  Returns the box product of two graphs <G> and <H> (also called
##  cartesian product), <G> $\square$ <H>.
##
##  The box product is calculated as follows:
##
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h).$ Given two such vertices $(g,h)$ and $(g',h')$ they are
##  adjacent <iff> $g = g'$ and $h \sim h'$ or $g \sim g'$ and $h = h'.$
##
##  \beginexample
##  gap> G:=GraphByAdjMatrix([[false,true],[true,false]]);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies :=
##  [ [ 2 ], [ 1 ] ] )
##  gap> BoxProduct(G,G);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies :=
##  [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], [ 2, 3 ] ] )
##  \endexample
##
DeclareOperation("BoxProduct",[Graphs,Graphs]);

############################################################################
##
#O  TimesProduct( <G>, <H> )
##
##  Returns the times product of two graphs <G> and <H>, <G> $\times$ <H>.
##
##  The times product is computed as follows:
##
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h).$ Given two such vertices $(g,h)$ and $(g',h')$ they are
##  adjacent <iff> $g \sim g'$ and $h \sim h'.$
##
##  \beginexample
##  gap> G:=GraphByAdjMatrix([[false,true],[true,false]]);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies :=
##  [ [ 2 ], [ 1 ] ] )
##  gap> TimesProduct(G,G);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 2, Adjacencies :=
##  [ [ 4 ], [ 3 ], [ 2 ], [ 1 ] ] )
##  \endexample
##
DeclareOperation("TimesProduct",[Graphs,Graphs]);

############################################################################
##
#O  BoxTimesProduct( <G>, <H> )
##
##  Returns the box times product of two graphs <G> and <H>, <G>
##  $\boxtimes$ <H>. 
##
##  The box times product is calculated as follows:
##
##  For each pair of vertices $g \in G, h \in H$ we create a vertex
##  $(g,h).$ Given two such vertices $(g,h)$ and $(g',h')$ such that
##  $(g,h) \neq (g',h')$ they are adjacent <iff> $g \simeq g'$ and $h
##  \simeq h'.$ 
##
##  \beginexample
##  gap> G:=GraphByAdjMatrix([[false,true],[true,false]]);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 1, Adjacencies :=
##  [ [ 2 ], [ 1 ] ] )
##  gap> G:=BoxTimesProduct(G,G);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  \endexample
##
DeclareOperation("BoxTimesProduct",[Graphs,Graphs]);
## DeclareOperation("Union",[Graphs,Graphs]);

############################################################################
##
#O  DisjointUnion( <G>, <H> )
##
##  Returns the DisjointUnion of two graphs <G> and <H>, <G> $\dot{\cup}$ <H>.
##
##  A disjoint union of graphs is obtained by combining both graphs in a
##  disjoint graph.
## 
##  \beginexample
##  gap> G:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> H:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> DisjointUnion(G,H);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  \endexample
##
DeclareOperation("DisjointUnion",[Graphs,Graphs]);

############################################################################
##
#O  Join( <G>, <H> )
##
##  Returns the result of joining graph <G> and <H>, <G> + <H>.
##
##  Joining graphs is computed as follows:
##
##  First, we obtain the disjoint union of graphs <G> and <H>. Second,
##  for each vertex $g \in G$ we add an edge to each vertex $h \in H.$
##  Finally, for each vertex $g \in G$ we add an edge to each vertex $h
##  \in H.$ 
##
##  \beginexample
##  gap> G:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> H:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> Join(G,H);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  \endexample
##
DeclareOperation("Join",[Graphs,Graphs]); # Zykov Sum

############################################################################
##
#O  GraphSum( <G>, <L> )
##
##  Returns the GraphSum of <G> and a list of graphs <L>.
##
##  The GraphSum is computed as follows:
##
##  Given <G> and a list of graphs $L = L_1, \dots L_n$,
##  if <G> is the trivial graph the result is $L_1.$ Otherwise we take
##  $g_1,g_2 \in G.$ If $g_1 \sim g_2$ we compute $L_1 + L_2$ and the
##  DisjointUnion in other case. We repeat this process for every
##  $g_i, g_{i+1}$ until $i+1 = n.$
##
##  If a graph is not given in a particular element of the list the
##  trivial graph will be used, <e.g.> $[H, , J, ] \equiv [H, T, J,
##  T]$ where <T> is the trivial graph. 
##
##  \beginexample
##  gap> G:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> H:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> GraphSum(G,H);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  \endexample
##
DeclareOperation("GraphSum",[Graphs,IsList]);

############################################################################
##
#O  Composition( <G>, <H> )
##
##  Returns the composition of two graphs <G> and <H>, $G[H].$
##
##  A composition of graphs is obtained by calculating the GraphSum
##  of <G> with <H>, $$G[H] = \hbox{GraphSum}(G, [H, \dots, H]).$$
##
##  \beginexample
##  gap> G:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> H:=RandomGraph(4);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  gap> Composition(G,H);
##  Graph( Category := Graphs, Order := 4, Size := 8, Adjacencies :=
##  [ [ 3, 4 ], [ 4 ], [ 1, 2, 3, 4 ], [ 2 ] ] )
##  \endexample
##
DeclareOperation("Composition",[Graphs,Graphs]);

#E
