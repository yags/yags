
############################################################################
##
#O  Backtrack( <L>, <Opts>, <Chk>, <Done>, <Extra> )
##  
##  <#GAPDoc Label="Backtrack">
##  <ManSection>
##  <Oper Name="Backtrack" Arg="L, Opts, Chk, Done, Extra"/>
##  <Description>
##  
##  <P/>Generic, user-customizable backtracking algorithm.
##  
##  <P/>A backtracking algorithm explores a decision tree in search for
##  solutions to a combinatorial problem. The combinatorial problem
##  and the search strategy are specified by the parameters:
##  
##  <A>L</A> is just a list that <C>Backtrack</C> uses to keep track
##  of solutions and partial solutions.  It is usually set to the
##  empty list as a starting point.  After a solution is found, it is
##  returned *and* stored in <A>L</A>. This value of <A>L</A> is then
##  used as a starting point to search for the next solution in case
##  <C>Backtrack</C> is called again.  Partial solutions are also
##  stored in <A>L</A> during the execution of <C>Backtrack</C>.
##  
##  <A>Extra</A> may be any object, list, record,
##  etc. <C>Backtrack</C> only uses it to pass this data to the
##  user-defined functions <A>Opts</A>, <A>Chk</A> and <A>Done</A>,
##  therefore offering you a way to share data between your functions.
##  
##  <A>Opts</A><C>:=function(L,extra)</C> must return the list of
##  continuation options (children) one has after some partial solution
##  (node) <A>L</A> has been reached within the decision tree
##  (<A>Opts</A> may use the extra data <A>Extra</A> as needed). Each
##  of the values in the list returned by <A>Opts</A><C>(L,extra)</C>
##  will be tried as possible continuations of the partial solution
##  <A>L</A>. If <A>Opts</A><C>(L,extra)</C> always returns the same
##  list, you can put that list in place of the parameter <A>Opts</A>.
##  
##  <A>Chk</A><C>:=function(L,extra)</C> must evaluate the partial
##  solution <A>L</A> possibly using the extra data <A>Extra</A> and
##  must return <C>false</C> when it knows that <A>L</A> can not be
##  extended to a solution of the problem. Otherwise it returns
##  <C>true</C>. <A>Chk</A> may assume that
##  <A>L</A><C>{[1..Length(L)-1]}</C> already passed the test.
##  
##  <A>Done</A><C>:=function(L,extra)</C> returns <C>true</C> if
##  <A>L</A> is already a complete solution and <C>false</C>
##  otherwise.  In many combinatorial problems, any partial solution
##  of certain length <A>n</A> is also a solution (and vice versa), so
##  if this is your case, you can put that length in place of the
##  parameter <A>Done</A>.
##  
##  <P/>The following example uses <C>Backtrack</C> in its simplest
##  form to compute derrangements (permutations of a set, where none
##  of the elements appears in its original position).
##  
##  <P/><Example>
##  gap> N:=4;;L:=[];;extra:=[];;opts:=[1..N];;done:=N;;
##  gap> chk:=function(L,extra) local i; i:=Length(L); 
##  >           return not L[i] in L{[1..i-1]} and L[i]&lt;> i; end;;
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 2, 1, 4, 3 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 2, 3, 4, 1 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 2, 4, 1, 3 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 3, 1, 4, 2 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 3, 4, 1, 2 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 3, 4, 2, 1 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 4, 1, 2, 3 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 4, 3, 1, 2 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  [ 4, 3, 2, 1 ]
##  gap> Backtrack(L,opts,chk,done,extra);
##  fail
##  </Example>
##  
##  Extensive information on <C>Backtrack</C> and <C>BacktrackBag</C> 
##  can be found in Chapter <Ref Chap="backtracking"/>.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Backtrack",[IsList,IsFunction,IsFunction,IsFunction,IsObject]);

############################################################################
##  
#O  BacktrackBag( <Opts>, <Chk>, <Done>, <Extra> )
##  
##  <#GAPDoc Label="BacktrackBag">
##  <ManSection>
##  <Oper Name="BacktrackBag" Arg="Opts, Chk, Done, Extra"/>
##  <Description>
##  
##  <P/>Returns the list of all solutions that would be returned one
##  at a time by <C>Backtrack</C>.
##  
##  <P/>The following example computes all derrangements of order 4.
##  
##  <P/><Example>
##  gap> N:=4;;
##  gap> chk:=function(L,extra) local i; i:=Length(L); 
##  >           return not L[i] in L{[1..i-1]} and L[i]&lt;> i; end;;
##  gap> BacktrackBag([1..N],chk,N,[]);
##  [ [ 2, 1, 4, 3 ], [ 2, 3, 4, 1 ], [ 2, 4, 1, 3 ], [ 3, 1, 4, 2 ], 
##    [ 3, 4, 1, 2 ], [ 3, 4, 2, 1 ], [ 4, 1, 2, 3 ], [ 4, 3, 1, 2 ], 
##    [ 4, 3, 2, 1 ] ]
##  </Example>
##  
##  Extensive information on <C>Backtrack</C> and <C>BacktrackBag</C> 
##  can be found in Chapter <Ref Chap="backtracking"/>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("BacktrackBag",[IsObject,IsFunction,IsObject,IsObject]);

#E
