##
##  some methods that operate on ONE graph
##
############################################################################
##
#O  LineGraph( <G> )
##
##  Returns the line graph <L(G)> of graph <G>. The line graph is the
##  intersection graph of the edges of <G>, <i.e.> the vertices of
##  $L(G)$ are the edges of <G> two of them being adjacent iff they
##  are incident. 
##
##  \beginexample 
##  gap> g:=Tetrahedron;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> LineGraph(g);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##    [ 1, 3, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  \endexample
##
##  --map

#FIXME: Does this make sense outside SimpleGraphs Category?
#
DeclareOperation("LineGraph",[Graphs]);

############################################################################
##
#A  ComplementGraph( <G> )
##
##  Computes the complement of graph <G>. The complement of a graph is
##  created as follows:
##  Create a graph <G'> with same vertices of <G>. For each <x>, <y>
##  $\in$ <G> if <x> $\nsim$ <y> in <G> then <x> $\sim$ <y> in <G'>
##
##  \beginexample 
##  gap> g:=ClawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
##  gap> ComplementGraph(g);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
##  [ [  ], [ 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
##  \endexample
##
##  --map
DeclareAttribute("ComplementGraph",Graphs);


##  FIXME: Makes sense in OrientedGraphs Category?
############################################################################
##
#O  QuotientGraph( <G>, <P> )
#O  QuotientGraph( <G>, <L1>, <L2> )
##
##  Returns the quotient graph of graph <G> given a vertex partition
##  <P>, by identifying any two vertices in the same part. 
##  The vertices of the quotient
##  graph are the parts in the partition <P> two of them
##  being adjacent iff any vertex in one part is adjacent to any vertex in the other part.
##  Singletons may be omited in P.
## 
##  \beginexample 
##  gap> g:=PathGraph(8);; 
##  gap> QuotientGraph(g,[[1,5,8],[2],[3],[4],[6],[7]]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 5, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], [ 1, 6 ], [ 1, 5 ] ] )
##  gap> QuotientGraph(g,[[1,5,8]]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 5, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], [ 1, 6 ], [ 1, 5 ] ] )
##  \endexample
##
##  In its second form, `QuotientGraph' identifies each vertex in list <L1>, 
##  with the corresponding vertex in list <L2>. <L1> and <L2> must have the same length,
##  but any or both of them may have repetitions.
##
##  \beginexample 
##  gap> g:=PathGraph(8);; 
##  gap> QuotientGraph(g,[[1,7],[4,8]]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], [ 4, 6 ], [ 1, 5 ] ] )
##  gap> QuotientGraph(g,[1,4],[7,8]);  
##  Graph( Category := SimpleGraphs, Order := 6, Size := 7, Adjacencies := 
##  [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], [ 4, 6 ], [ 1, 5 ] ] )
##  \endexample
##
##  --map
DeclareOperation("QuotientGraph",[Graphs,IsList]);

############################################################################
##
#O  Cone( <G> )
##
##  Returns the cone of graph <G>. The cone of <G> is the graph 
##  obtained from <G> by adding a new vertex which is adjacent to every 
##  vertex of <G>. The new vertex is the first one in the new graph.
##
##  \beginexample 
##  gap> Cone(CycleGraph(4));
##  Graph( Category := SimpleGraphs, Order := 5, Size := 8, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 5 ], [ 1, 2, 4 ], [ 1, 3, 5 ], [ 1, 2, 4 ] ] )
##  \endexample
##  
##  --map
DeclareOperation("Cone",[Graphs]);

############################################################################
##
#O  Suspension( <G> )
##
##  Returns the suspension of graph <G>. The suspension of <G> is the graph 
##  obtained from <G> by adding two new vertices which are adjacent to every 
##  vertex of <G> but not to each other. The new vertices are the first ones 
##  in the new graph.
##
##  \beginexample 
##  gap> Suspension(CycleGraph(4));
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies := 
##  [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ], 
##    [ 1, 2, 4, 6 ], [ 1, 2, 3, 5 ] ] )
##  \endexample
##  
##  --map
DeclareOperation("Suspension",[Graphs]);

#E
