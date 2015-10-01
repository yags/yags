
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

