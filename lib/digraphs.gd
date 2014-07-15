
############################################################################
##
#O  InNeigh( <G>, <x> )
##
##  Returns the list of in-neighbors of <x> in <G>.
##  
##  \beginexample
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 5, Size := 10, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], [  ] ] )
##  gap> InNeigh(tt,3);                                     
##  [ 1, 2 ]
##  gap> OutNeigh(tt,3);                                    
##  [ 4, 5 ]
##  \endexample
##  
##  --map
DeclareOperation("InNeigh",[Graphs,IsInt]);

############################################################################
##
#O  OutNeigh( <G>, <x> )
##
##  Returns the list of out-neighbors of <x> in <G>.
##  
##  \beginexample
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 5, Size := 10, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], [  ] ] )
##  gap> InNeigh(tt,3);                                     
##  [ 1, 2 ]
##  gap> OutNeigh(tt,3);                                    
##  [ 4, 5 ]
##  \endexample
##  
##  --map
DeclareOperation("OutNeigh",[Graphs,IsInt]);

############################################################################
##
#P  IsTournament( <G> )
##  
##  Returns `true' if <G> is a tournament.
##  
##  \beginexample
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 5, Size := 10, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], [  ] ] )
##  gap> IsTournament(tt);                                  
##  true
##  \endexample
##  
##  --map
DeclareProperty("IsTournament",Graphs);

############################################################################
##
#P  IsTransitiveTournament( <G> )
##  
##  Returns `true' if <G> is a transitive tournament.
##  
##  \beginexample
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 5, Size := 10, Adjacencies := 
##  [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], [  ] ] )
##  gap> IsTransitiveTournament(tt);
##  true
##  \endexample
##  
##  --map
DeclareProperty("IsTransitiveTournament",Graphs);

#E
