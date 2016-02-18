
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
DeclareProperty("IsTransitiveTournament",Graphs);

############################################################################
##
#O  PaleyTournament( <prime> )
##
##  Returns the Paley tournament associated with prime number <prime>.
##  <prime> must be congruent to 3 mod 4. The Paley tournament is the 
##  oriented circulant whose <jumps> are the all squares of the ring
##  $\Z_p$. 
##
##  \beginexample
##  gap> Filtered([1..30],x -> 0=((x-3) mod 4) and IsPrime(x));
##  [ 3, 7, 11, 19, 23 ]
##  gap> PaleyTournament(3);PaleyTournament(7);PaleyTournament(11);
##  Graph( Category := OrientedGraphs, Order := 3, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 3 ], [ 1 ] ] )
##  Graph( Category := OrientedGraphs, Order := 7, Size := 21, Adjacencies := 
##  [ [ 2, 3, 5 ], [ 3, 4, 6 ], [ 4, 5, 7 ], [ 1, 5, 6 ], [ 2, 6, 7 ], 
##    [ 1, 3, 7 ], [ 1, 2, 4 ] ] )
##  Graph( Category := OrientedGraphs, Order := 11, Size := 55, Adjacencies := 
##  [ [ 2, 4, 5, 6, 10 ], [ 3, 5, 6, 7, 11 ], [ 1, 4, 6, 7, 8 ], 
##    [ 2, 5, 7, 8, 9 ], [ 3, 6, 8, 9, 10 ], [ 4, 7, 9, 10, 11 ], 
##    [ 1, 5, 8, 10, 11 ], [ 1, 2, 6, 9, 11 ], [ 1, 2, 3, 7, 10 ], 
##    [ 2, 3, 4, 8, 11 ], [ 1, 3, 4, 5, 9 ] ] )
##  gap> PaleyTournament(5);                                       
##  fail
##  \endexample
##  
##  Note that `PaleyTournament( <prime> )' returns a graph in the 
##  category `OrientedGraphs' regardless of the `TargetGraphCategory'.  
##  
DeclareOperation("PaleyTournament",[IsInt]);

############################################################################
##
#O  Orientations( <G> )
##
##  Returns the list of all the oriented graphs that are obtained from <G>
##  by replacing (in every possible way) each edge `[x,y]' of <G> by 
##  one arrow: either `[x,y]' or `[y,x]'. In each of these orientations
##  Loops are removed and existing arrows of <G> are left untouched.
##  
##  Note that this operation will use time and memory which is exponential on
##  the number of edges of <G>. 
##  
##  \beginexample
##  gap> g:=GraphByWalks([1,1,2,3,1,3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 6, Adjacencies := 
##  [ [ 1, 2, 3 ], [ 3 ], [ 1, 2 ] ] )
##  gap> Orientations(g);
##  [ Graph( rec( Category := OrientedGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2 ], [  ], [ 1, 2 ] ] ) ), 
##    Graph( rec( Category := OrientedGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2 ], [ 3 ], [ 1 ] ] ) ), 
##    Graph( rec( Category := OrientedGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2, 3 ], [  ], [ 2 ] ] ) ), 
##    Graph( rec( Category := OrientedGraphs, Order := 3, Size := 
##      3, Adjacencies := [ [ 2, 3 ], [ 3 ], [  ] ] ) ) ]
##  gap> Length(Orientations(Octahedron));
##  4096
##  \endexample
##  
##  Note that `Orientations( <G> )' returns a list of graphs, each of them in the 
##  category `OrientedGraphs' regardless of the `TargetGraphCategory'.  
##  
DeclareOperation("Orientations",[Graphs]);

#E
