
############################################################################
##
#O  Graph6ToGraph( <String> )
##
##  Returns the graph represented by <String> which is encoded using 
##  Brendan McKay's graph6 format. This operation allows us to read data in 
##  databases which use this format. Several such databases can be found here:
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html}.
##  
##  The graph6 format is described here: 
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/formats.txt}.
##
##  \beginexample
##  gap> Graph6ToGraph("D?{");    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 4, Adjacencies := 
##  [ [ 5 ], [ 5 ], [ 5 ], [ 5 ], [ 1, 2, 3, 4 ] ] )
##  gap> Graph6ToGraph("FUzvW");  
##  Graph( Category := SimpleGraphs, Order := 7, Size := 15, Adjacencies := 
##  [ [ 3, 4, 5, 6, 7 ], [ 4, 5, 6, 7 ], [ 1, 5, 6, 7 ], [ 1, 2, 6 ], 
##    [ 1, 2, 3, 7 ], [ 1, 2, 3, 4, 7 ], [ 1, 2, 3, 5, 6 ] ] )
##  gap> Graph6ToGraph("HUzv~z}");
##  Graph( Category := SimpleGraphs, Order := 9, Size := 29, Adjacencies := 
##  [ [ 3, 4, 5, 6, 7, 8, 9 ], [ 4, 5, 6, 7, 8, 9 ], [ 1, 5, 6, 7, 8, 9 ], 
##    [ 1, 2, 6, 7, 8, 9 ], [ 1, 2, 3, 7, 8, 9 ], [ 1, 2, 3, 4, 7, 8, 9 ], 
##    [ 1, 2, 3, 4, 5, 6, 9 ], [ 1, 2, 3, 4, 5, 6 ], [ 1, 2, 3, 4, 5, 6, 7 ] ] )
##  \endexample
##  
##  See also `ImportGraph6( <Filename> )'.
DeclareOperation("Graph6ToGraph",[IsString]);


############################################################################
##
#O  ImportGraph6( <Filename> )
##
##  Returns the list of graphs represented in <Filename> which are encoded using 
##  Brendan McKay's graph6 format. This operation allows us to read data in 
##  databases which use this format. Several such databases can be found here:
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html}.
##  
##  The graph6 format is described here: 
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/formats.txt}.
##
##  The following example assumes that you have a file named `graph3.g6' 
##  in your working directory which encodes graphs in graph6 format; 
##  the contents of this file is assumed to be as indicated after the first 
##  command in the example.
##
##  \beginexample
##  gap> Exec("cat graph3.g6");
##  B?
##  BO
##  BW
##  Bw
##  gap> ImportGraph6("graph3.g6");
##  [ Graph( Category := SimpleGraphs, Order := 3, Size := 0, Adjacencies := 
##      [ [  ], [  ], [  ] ] ), Graph( Category := SimpleGraphs, Order := 
##      3, Size := 1, Adjacencies := [ [ 3 ], [  ], [ 1 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##      [ [ 3 ], [ 3 ], [ 1, 2 ] ] ), Graph( Category := SimpleGraphs, Order := 
##     3, Size := 3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] ) ]
##  \endexample
##  
DeclareOperation("ImportGraph6",[IsString]);

############################################################################
##
#O  GraphsOfGivenOrder( <n> )
##
##  Returns the list of all graphs of order <n> (upto isomorphism). 
##  This operation uses Brendan McKay's data published here: 
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html}. 
##  
##  These data are included with the {\YAGS} distribution in its `data' directory.
##  Hence this operation simply reads the corresponding file in that directory using
##  `ImportGraph6( <Filename> )'. Therefore, the integer <n> must be in the range 
##  from 1 upto 9. Data for graphs on 10 vertices is also available, but not included 
##  with {\YAGS}, it may not be practical to use that data, but if you would like to try, 
##  all you have to do is to copy (and to uncompress) the corresponding file into the 
##  directory `<YAGS-Directory>/data'.
##
##  \beginexample
##  gap> GraphsOfGivenOrder(2);          
##  [ Graph( Category := SimpleGraphs, Order := 2, Size := 0, Adjacencies := 
##      [ [  ], [  ] ] ), Graph( Category := SimpleGraphs, Order := 2, Size := 
##      1, Adjacencies := [ [ 2 ], [ 1 ] ] ) ]
##  gap> GraphsOfGivenOrder(3);
##  [ Graph( Category := SimpleGraphs, Order := 3, Size := 0, Adjacencies := 
##      [ [  ], [  ], [  ] ] ), Graph( Category := SimpleGraphs, Order := 
##      3, Size := 1, Adjacencies := [ [ 3 ], [  ], [ 1 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##      [ [ 3 ], [ 3 ], [ 1, 2 ] ] ), Graph( Category := SimpleGraphs, Order := 
##      3, Size := 3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] ) ]
##  gap> Length(GraphsOfGivenOrder(9));
##  274668
##  gap> GraphsOfGivenOrder(10);       
##  #W Unreadable File: /opt/gap4r7/pkg/yags/data/graph10.g6
##  fail
##  \endexample
##  
DeclareOperation("GraphsOfGivenOrder",[IsInt]);

############################################################################
##
#O  ConnectedGraphsOfGivenOrder( <n> )
##
##  Returns the list of all connected graphs of order <n> (upto isomorphism).
##  This operation uses Brendan McKay's data published here: 
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html}. 
##  
##  These data are included with the {\YAGS} distribution in its `data' directory.
##  Hence this operation simply reads the corresponding file in that directory using
##  `ImportGraph6( <Filename> )'. Therefore, the integer <n> must be in the range 
##  from 1 upto 9. Data for graphs on 10 vertices is also available, but not included 
##  with {\YAGS}, it may not be practical to use that data, but if you would like to try, 
##  all you have to do is to copy (and to uncompress) the corresponding file into the 
##  directory `<YAGS-Directory>/data'.
##
##  \beginexample
##  gap> ConnectedGraphsOfGivenOrder(3);
##  [ Graph( Category := SimpleGraphs, Order := 3, Size := 2, Adjacencies := 
##      [ [ 3 ], [ 3 ], [ 1, 2 ] ] ), Graph( Category := SimpleGraphs, Order := 
##      3, Size := 3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] ) ]
##  gap> ConnectedGraphsOfGivenOrder(4);
##  [ Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies := 
##      [ [ 4 ], [ 4 ], [ 4 ], [ 1, 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies := 
##      [ [ 3, 4 ], [ 4 ], [ 1 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##      [ [ 3, 4 ], [ 4 ], [ 1, 4 ], [ 1, 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 4, Adjacencies := 
##      [ [ 3, 4 ], [ 3, 4 ], [ 1, 2 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 5, Adjacencies := 
##      [ [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 6, Adjacencies := 
##      [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] ) ]
##  gap> Length(ConnectedGraphsOfGivenOrder(9));
##  261080
##  gap> ConnectedGraphsOfGivenOrder(10);       
##  #W Unreadable File: /opt/gap4r7/pkg/yags/data/graph10c.g6
##  fail
##  \endexample
##  
DeclareOperation("ConnectedGraphsOfGivenOrder",[IsInt]);
    
#FIXME: Unimplemented
#YAGSToGraph6:=function(G)
#end;

#FIXME: Unimplemented
#ExportGraph6:=function(L) 
#end;

############################################################################
##
#O  HararyToMcKay( <Spec> )
#O  McKayToHarary( <index> )
##  
##  Returns the McKay's <index> of a Harary's graph specification <Spec> and viceversa.
##  Frank Harary published in his book \cite{Har69}, a list af all 208 simple graphs 
##  of order upto 6 (upto isomorphism). Each of them had a label (which we 
##  call <Harary's graph specification>) of the form `[ <n>, <m>, <s> ]' 
##  where <n> is the number of vertices, <m> is the number of edges, and 
##  <s> is a consecutive integer which uniquely identifies
##  the graph from the others with the same <n> and <m>. On the other hand, 
##  Brendan McKay published data sets containing a list of all graphs of 
##  order upto 10 (also upto isomorphism), here:
##  
##  \URL{https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html}
##  
##  Each graph in these data sets appears in some specific position 
##  (which we call <McKay's index>).
##  
##  We found it convenient to have an automated way to convert from Harary's 
##  graph specifications to McKay's indexes and viceversa.
##  
##  \beginexample|unstableoutput
##  gap> HararyToMcKay([1,0,1]); 
##  1
##  gap> HararyToMcKay([1,0,2]);
##  fail
##  gap> HararyToMcKay([5,5,2]);
##  31
##  gap> HararyToMcKay([5,5,3]);
##  34
##  gap> HararyToMcKay([5,5,5]);
##  30
##  gap> HararyToMcKay([5,5,6]);
##  45
##  gap> HararyToMcKay([5,5,7]); 
##  fail
##  gap> HararyToMcKay([6,15,1]);
##  208
##  gap> HararyToMcKay([6,15,2]);
##  fail
##  gap> List([1..208],McKayToHarary);
##  [ [ 1, 0, 1 ], [ 2, 0, 1 ], [ 2, 1, 1 ], [ 3, 0, 1 ], [ 3, 1, 1 ], 
##    [ 3, 2, 1 ], [ 3, 3, 1 ], [ 4, 0, 1 ], [ 4, 1, 1 ], [ 4, 2, 1 ], 
##    [ 4, 3, 3 ], [ 4, 2, 2 ], [ 4, 3, 1 ], [ 4, 3, 2 ], [ 4, 4, 1 ], 
##  
##                 --- many more lines here ---   
##  
##    [ 6, 10, 10 ], [ 6, 10, 7 ], [ 6, 11, 3 ], [ 6, 12, 1 ], [ 6, 13, 1 ], 
##    [ 6, 11, 7 ], [ 6, 11, 9 ], [ 6, 11, 8 ], [ 6, 12, 4 ], [ 6, 12, 5 ], 
##    [ 6, 13, 2 ], [ 6, 14, 1 ], [ 6, 15, 1 ] ]
##  \endexample
##  
DeclareOperation("HararyToMcKay",[IsList]);
DeclareOperation("McKayToHarary",[IsInt]);

