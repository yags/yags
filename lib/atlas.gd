
############################################################################
##
#O  Graph6ToGraph( <String> )
##  
##  <#GAPDoc Label="Graph6ToGraph">
##  <ManSection>
##  <Oper Name="Graph6ToGraph" Arg="String"/>
##  <Description>
##
##  <P/>Returns the graph represented by <A>String</A> which is encoded using 
##  Brendan McKay's graph6 format. This operation allows us to read data in 
##  databases which use this format. Several such databases can be found here:
##  <URL>https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html</URL>.
##  
##  <P/>The graph6 format is described here:
##  
##  <P/><URL>https://cs.anu.edu.au/people/Brendan.McKay/data/formats.txt</URL>.
##
##  <P/><Example>
##  gap> Graph6ToGraph("D?{");    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 5 ], [ 5 ], [ 5 ], [ 5 ], [ 1, 2, 3, 4 ] ] )
##  gap> Graph6ToGraph("FUzvW");  
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  15, Adjacencies := [ [ 3, 4, 5, 6, 7 ], [ 4, 5, 6, 7 ], 
##    [ 1, 5, 6, 7 ], [ 1, 2, 6 ], [ 1, 2, 3, 7 ], [ 1, 2, 3, 4, 7 ], 
##    [ 1, 2, 3, 5, 6 ] ] )
##  gap> Graph6ToGraph("HUzv~z}");
##  Graph( Category := SimpleGraphs, Order := 9, Size := 
##  29, Adjacencies := [ [ 3, 4, 5, 6, 7, 8, 9 ], [ 4, 5, 6, 7, 8, 9 ], 
##    [ 1, 5, 6, 7, 8, 9 ], [ 1, 2, 6, 7, 8, 9 ], [ 1, 2, 3, 7, 8, 9 ], 
##    [ 1, 2, 3, 4, 7, 8, 9 ], [ 1, 2, 3, 4, 5, 6, 9 ], 
##    [ 1, 2, 3, 4, 5, 6 ], [ 1, 2, 3, 4, 5, 6, 7 ] ] )
##  </Example>
##  
##  <P/>See also <C>ImportGraph6( <A>Filename</A> )</C>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Graph6ToGraph",[IsString]);


############################################################################
##
#O  ImportGraph6( <Filename> )
##  
##  <#GAPDoc Label="ImportGraph6">
##  <ManSection>
##  <Oper Name="ImportGraph6" Arg="Filename"/>
##  <Description>
##  
##  <P/>Returns the list of graphs represented in <A>Filename</A>
##  which are encoded using Brendan McKay's graph6 format. This
##  operation allows us to read data in databases which use this
##  format. Several such databases can be found here:
##  <URL>https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html</URL>.
##  
##  <P/>The graph6 format is described here:
##  
##  <P/><URL>https://cs.anu.edu.au/people/Brendan.McKay/data/formats.txt</URL>.
##  
##  <P/>The following example assumes that you have a file named
##  <C>graph3.g6</C> in your working directory which encodes graphs in
##  graph6 format; the contents of this file is assumed to be as
##  indicated after the first command in the example. It is also
##  assumed that your Operative System is a Unix-like system.
##
##  <P/><Log>
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
##  </Log>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("ImportGraph6",[IsString]);

############################################################################
##
#O  GraphsOfGivenOrder( <n> )
##  
##  <#GAPDoc Label="GraphsOfGivenOrder">
##  <ManSection>
##  <Oper Name="GraphsOfGivenOrder" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the list of all graphs of order <A>n</A> (up to
##  isomorphism).  This operation uses Brendan McKay's data published
##  here:
##  <URL>https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html</URL>.
##  
##  <P/>These data are included with the &YAGS; distribution in its
##  <C>data</C> directory.  Hence this operation simply reads the
##  corresponding file in that directory using <C>ImportGraph6(
##  <A>Filename</A> )</C>. Therefore, the integer <A>n</A> must be in
##  the range from 1 up to 9. Data for graphs on 10 vertices is also
##  available, but not included with &YAGS;, it may not be practical
##  to use that data, but if you would like to try, all you have to do
##  is to copy (and to uncompress) the corresponding file into the
##  directory <C><A>YAGS-DIR</A>/data</C>.
##
##  <P/><Example>
##  gap> GraphsOfGivenOrder(2);          
##  [ Graph( Category := SimpleGraphs, Order := 2, Size := 
##      0, Adjacencies := [ [  ], [  ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 2, Size := 
##      1, Adjacencies := [ [ 2 ], [ 1 ] ] ) ]
##  gap> GraphsOfGivenOrder(3);
##  [ Graph( Category := SimpleGraphs, Order := 3, Size := 
##      0, Adjacencies := [ [  ], [  ], [  ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 
##      1, Adjacencies := [ [ 3 ], [  ], [ 1 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 
##      2, Adjacencies := [ [ 3 ], [ 3 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] ) ]
##  gap> Length(GraphsOfGivenOrder(9));
##  274668
##  gap> GraphsOfGivenOrder(10);       
##  #W Unreadable File: /opt/gap4r7/pkg/yags/data/graph10.g6
##  fail
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GraphsOfGivenOrder",[IsInt]);

############################################################################
##  
#O  ConnectedGraphsOfGivenOrder( <n> )
##  
##  <#GAPDoc Label="ConnectedGraphsOfGivenOrder">
##  <ManSection>
##  <Oper Name="ConnectedGraphsOfGivenOrder" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the list of all connected graphs of order <A>n</A>
##  (up to isomorphism).  This operation uses Brendan McKay's data
##  published here:
##  <URL>https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html</URL>.
##  
##  <P/>These data are included with the &YAGS; distribution in its
##  <C>data</C> directory.  Hence this operation simply reads the
##  corresponding file in that directory using <C>ImportGraph6(
##  <A>Filename</A> )</C>. Therefore, the integer <A>n</A> must be in
##  the range from 1 up to 9. Data for graphs on 10 vertices is also
##  available, but not included with &YAGS;, it may not be practical
##  to use that data, but if you would like to try, all you have to do
##  is to copy (and to uncompress) the corresponding file into the
##  directory <C><A>YAGS-DIR</A>/data</C>.
##  
##  <P/><Example>
##  gap> ConnectedGraphsOfGivenOrder(3);
##  [ Graph( Category := SimpleGraphs, Order := 3, Size := 
##      2, Adjacencies := [ [ 3 ], [ 3 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] ) ]
##  gap> ConnectedGraphsOfGivenOrder(4);
##  [ Graph( Category := SimpleGraphs, Order := 4, Size := 
##      3, Adjacencies := [ [ 4 ], [ 4 ], [ 4 ], [ 1, 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      3, Adjacencies := [ [ 3, 4 ], [ 4 ], [ 1 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 3, 4 ], [ 4 ], [ 1, 4 ], [ 1, 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 3, 4 ], [ 3, 4 ], [ 1, 2 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      5, Adjacencies := [ [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] 
##       ] ), Graph( Category := SimpleGraphs, Order := 4, Size := 
##      6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##        [ 1, 2, 3 ] ] ) ]
##  gap> Length(ConnectedGraphsOfGivenOrder(9));
##  261080
##  gap> ConnectedGraphsOfGivenOrder(10);       
##  #W Unreadable File: /opt/gap4r7/pkg/yags/data/graph10c.g6
##  fail
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
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
##  <#GAPDoc Label="HararyToMcKay">
##  <ManSection>
##  <Oper Name="HararyToMcKay" Arg="Spec"/>
##  <Oper Name="McKayToHarary" Arg="index"/>
##  <Description>
##  
##  <P/>Returns the McKay's <A>index</A> of a Harary's graph
##  specification <A>Spec</A> and vice versa.  Frank Harary published
##  in his book <Cite Key="Har69"/>, a list of all 208 simple graphs
##  of order up to 6 (up to isomorphism). Each of them had a label
##  (which we call <A>Harary's graph specification</A>) of the form
##  <C>[ <A>n</A>, <A>m</A>, <A>s</A> ]</C> where <A>n</A> is the
##  number of vertices, <A>m</A> is the number of edges, and <A>s</A>
##  is a consecutive integer which uniquely identifies the graph from
##  the others with the same <A>n</A> and <A>m</A>. On the other hand,
##  Brendan McKay published data sets containing a list of all graphs
##  of order up to 10 (also up to isomorphism), here:
##  
##  <P/><URL>https://cs.anu.edu.au/people/Brendan.McKay/data/graphs.html</URL>
##  
##  <P/>Each graph in these data sets appears in some specific
##  position (which we call <E>McKay's index</E>).  We found it
##  convenient to have an automated way to convert from Harary's graph
##  specifications to McKay's indexes and vice versa.
##  
##  <P/><Example>
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
##  </Example>
##  <P/><Log>
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
##  </Log>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("HararyToMcKay",[IsList]);
DeclareOperation("McKayToHarary",[IsInt]);

