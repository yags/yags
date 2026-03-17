###########################################################################
##  
#O  InNeigh( <G>, <x> )
##  
##  <#GAPDoc Label="InNeigh">
##  <ManSection>
##  <Oper Name="InNeigh" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the list of in-neighbors of <A>x</A> in <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( rec( Category := OrientedGraphs, Order := 5, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], 
##    [  ] ] ) )
##  gap> InNeigh(tt,3);                                     
##  [ 1, 2 ]
##  gap> OutNeigh(tt,3);                                    
##  [ 4, 5 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("InNeigh",[Graphs,IsInt]);
    
############################################################################
##  
#O  OutNeigh( <G>, <x> )
##  
##  <#GAPDoc Label="OutNeigh">
##  <ManSection>
##  <Oper Name="OutNeigh" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the list of out-neighbors of <A>x</A> in <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( rec( Category := OrientedGraphs, Order := 5, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], 
##    [  ] ] ) )
##  gap> InNeigh(tt,3);                                     
##  [ 1, 2 ]
##  gap> OutNeigh(tt,3);                                    
##  [ 4, 5 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("OutNeigh",[Graphs,IsInt]);

############################################################################
##  
#P  IsTournament( <G> )
##  
##  <#GAPDoc Label="IsTournament">
##  <ManSection>
##  <Prop Name="IsTournament" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if <A>G</A> is a tournament. A
##  <E>tournament</E> is a graph without loops and such that for every
##  pair of vertices <C>x</C>, <C>y</C>, either <C>[x,y]</C> is an arrow of
##  <A>G</A> , or <C>[y,x]</C> is an arrow of <A>G</A>, but not both.
##  <Index>tournament</Index>
##  
##  <P/>
##  <Example>
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( rec( Category := OrientedGraphs, Order := 5, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], 
##    [  ] ] ) )
##  gap> IsTournament(tt);                                  
##  true
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareProperty("IsTournament",Graphs);
    
############################################################################
##  
#P  IsTransitiveTournament( <G> )
##  
##  <#GAPDoc Label="IsTransitiveTournament">
##  <ManSection>
##  <Prop Name="IsTransitiveTournament" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if <A>G</A> is a transitive tournament. A
##  tournament is a <E>transitive tournament</E> if whenever
##  <C>[x,y]</C> and <C>[y,z]</C> are arrows of the tournament,
##  <C>[x,z]</C> is also an arrow of the tournament.
##  <Index Subkey="transitive">tournament</Index>
##  <Index>transitive tournament</Index>
##  
##  <P/>
##  <Example>
##  gap> tt:=CompleteGraph(5:GraphCategory:=OrientedGraphs);
##  Graph( rec( Category := OrientedGraphs, Order := 5, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5 ], [ 3, 4, 5 ], [ 4, 5 ], [ 5 ], 
##    [  ] ] ) )
##  gap> IsTransitiveTournament(tt);
##  true
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareProperty("IsTransitiveTournament",Graphs);
    
############################################################################
##  
#O  PaleyTournament( <prime> )
##  
##  <#GAPDoc Label="PaleyTournament">
##  <ManSection>
##  <Oper Name="PaleyTournament" Arg="prime"/>
##  <Description>
##  
##  <P/>Returns the <E>Paley tournament</E> associated with prime number
##  <A>prime</A>.  The <A>prime</A> must be congruent to 3 mod 4. The
##  Paley tournament is the oriented circulant whose <A>jumps</A> are
##  all the squares of the ring <M>&ZZ;_p</M>.
##  <Index Subkey="Paley">tournament</Index>
##  <Index>Paley tournament</Index>
##  
##  <P/>
##  <Example>
##  gap> Filtered([1..30],x -> 0=((x-3) mod 4) and IsPrime(x));
##  [ 3, 7, 11, 19, 23 ]
##  gap> PaleyTournament(3);PaleyTournament(7);PaleyTournament(11);
##  Graph( rec( Category := OrientedGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 2 ], [ 3 ], [ 1 ] ] ) )
##  Graph( rec( Category := OrientedGraphs, Order := 7, Size := 
##  21, Adjacencies := [ [ 2, 3, 5 ], [ 3, 4, 6 ], [ 4, 5, 7 ], 
##    [ 1, 5, 6 ], [ 2, 6, 7 ], [ 1, 3, 7 ], [ 1, 2, 4 ] ] ) )
##  Graph( rec( Category := OrientedGraphs, Order := 11, Size := 
##  55, Adjacencies := [ [ 2, 4, 5, 6, 10 ], [ 3, 5, 6, 7, 11 ], 
##    [ 1, 4, 6, 7, 8 ], [ 2, 5, 7, 8, 9 ], [ 3, 6, 8, 9, 10 ], 
##    [ 4, 7, 9, 10, 11 ], [ 1, 5, 8, 10, 11 ], [ 1, 2, 6, 9, 11 ], 
##    [ 1, 2, 3, 7, 10 ], [ 2, 3, 4, 8, 11 ], [ 1, 3, 4, 5, 9 ] ] ) )
##  gap> PaleyTournament(5);                                       
##  fail
##  </Example>
##  
##  <P/>Note that <C>PaleyTournament( <A>prime</A> )</C> returns a
##  graph in the category <C>OrientedGraphs</C> regardless of the
##  <C>TargetGraphCategory</C>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PaleyTournament",[IsInt]);
    
############################################################################
##  
#O  Orientations( <G> )
##  
##  <#GAPDoc Label="Orientations">
##  <ManSection>
##  <Oper Name="Orientations" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the list of all the oriented graphs that are obtained
##  from <A>G</A> by replacing (in every possible way) each edge
##  <C>[x,y]</C> of <A>G</A> by one arrow: either <C>[x,y]</C> or
##  <C>[y,x]</C>. In each of these orientations the loops are removed
##  and existing arrows of <A>G</A> are left untouched.
##  
##  <P/>Note that this operation will use time and memory which is
##  exponential on the number of edges of <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=GraphByWalks([1,1,2,3,1,3,2]:GraphCategory:=Graphs);
##  Graph( rec( Category := Graphs, Order := 3, Size := 6, Adjacencies := 
##  [ [ 1, 2, 3 ], [ 3 ], [ 1, 2 ] ] ) )
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
##  </Example>
##  
##  <P/>Note that <C>Orientations( <A>G</A> )</C> returns a list of
##  graphs, each of them in the category <C>OrientedGraphs</C>
##  regardless of the <C>TargetGraphCategory</C>.
##  
##  <P/>This operation reports progress at <C>InfoLevel</C> 3 (see
##  <Ref Label="YAGSInfo.InfoClass"/> and Section <Ref
##  Sect="debuggingbacktracks"/>).
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Orientations",[Graphs]);

#E
