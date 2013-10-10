##
##  some methods that operate on ONE graph
##
############################################################################
##
#O  LineGraph( <G> )
##
##  Returns the line graph of graph <G>. The line graph is the
##  intersection graph of the edges of <G>, <i.e.> the vertices of
##  $L(G)$ are the edges of <G> two of them being adjacent iff they
##  are incident. 
##
##  \beginexample 
##  gap> G:=Tetrahedron;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> LineGraph(G);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 12, Adjacencies :=
##  [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], [ 1, 2, 5, 6 ],
##    [ 1, 3, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  \endexample
##

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
##  gap> G:=ClawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
##  [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
##  gap> ComplementGraph(G);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies :=
##  [ [  ], [ 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
##  \endexample
##
DeclareAttribute("ComplementGraph",Graphs);

############################################################################
##
#O  QuotientGraph( <G>, <P> )
#O  QuotientGraph( <G>, <L1>, <L2> )
##
##  Returns the quotient graph of graph <G> given a vertex partition
##  <P>, by identifying any two vertices in the same part. 
##  The vertices of the quotient
##  graph are the parts in the partition <P> two of them
##  being adjacent iff any two of the vertices in the parts are
##  adjacent in <G>. Singletons may be omited in P.
## 
##  In its second form, QuotientGraph identifies each vertex in list L1, 
##  with the corresponding vertex in list L2. L1 and L2 must have the same length,
##  but any or both of them may have repetitions.
##
##  \beginexample 
##  gap> G:=HouseGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 6, Adjacencies :=
##  [ [ 2, 3 ], [ 1, 3, 4 ], [ 1, 2, 5 ], [ 2, 5 ], [ 3, 4 ] ] )
##  gap> QuotientGraph(G,[[1,2],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 3, Adjacencies :=
##  [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] )
##  \endexample
##

#  FIXME: Makes sense in OrientedGraphs Category?
#
DeclareOperation("QuotientGraph",[Graphs,IsList]);
