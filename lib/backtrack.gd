
############################################################################
##
#O  BackTrack( <L>, <opts>, <chk>, <done>, <extra> )
##  
##  Generic, user-customizable backtracking algorithm.
##  
##  A backtraking algorithm explores a decision tree in search for solutions to a 
##  combinatorial problem. The combinatorial problem and the search strategy are specified 
##  by the parameters:
##  
##  <L> is just a list that `BackTrack' uses to keep track of solutions and partial solutions. 
##  It is usually set to the empty list as a starting point. 
##  After a solution is found, it is returned *and* stored in <L>. This value of <L> is then used 
##  as a starting point to search for the next solution in case `BackTrack' is called again. 
##  Partial solutions are also stored in <L> during the execution of `BackTrack'.
##  
##  <extra> may be any object, list, record, etc. `BackTrack' only uses it to pass this data to 
##  the user-defined functions <opts>, <chk> and <done>, therefore offering you a way to share data 
##  between your functions.
##  
##  <opts>`:=function(L,extra)' must return the list of continuation options (childs) one has after some 
##  partial solution (node) <L> has been reached within the decision tree (<opts> may use the extra data 
##  <extra> as needed). Each of the values in the list returned by <opts>`(L,extra)' will be tried as 
##  possible continuations of the partial solution <L>. If <opts>`(L,extra)' always returns the same list, 
##  you can put that list in place of the parameter <opts>.
##  
##  <chk>`:=function(L,extra)' must evaluate the partial solution <L> possibly using the extra data 
##  <extra> and must return `false' when it knows that <L> can not be extended to a solution 
##  of the problem. Otherwise it returns `true'. <chk> may assume that <L>`{[1..Length(L)-1]}' already 
##  passed the test.
##  
##  <done>`:=function(L,extra)' returns `true' if <L> is already a complete solution and `false' otherwise. 
##  In many combinatorial problems, any partial solution of certain length <N> is also a solution 
##  (and viceversa), so if this is your case, you can put that length in place of the parameter <done>.
##
##  The following example uses `BackTrack' in its simplest form to compute derrangements 
##  (permutations a set, where none of the elements appears in its original position).
##  
##  \beginexample
##  gap> N:=4;;L:=[];;extra:=[];;opts:=[1..N];;done:=N;;
##  gap> chk:=function(L,extra) local i; i:=Length(L); 
##  >           return not L[i] in L{[1..i-1]} and L[i]<> i; end;;
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 2, 1, 4, 3 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 2, 3, 4, 1 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 2, 4, 1, 3 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 3, 1, 4, 2 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 3, 4, 1, 2 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 3, 4, 2, 1 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 4, 1, 2, 3 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 4, 3, 1, 2 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  [ 4, 3, 2, 1 ]
##  gap> BackTrack(L,opts,chk,done,extra);
##  fail
##  \endexample
##  
##  --map
DeclareOperation("BackTrack",[IsList,IsFunction,IsFunction,IsFunction,IsObject]);

############################################################################
##
#O  BackTrackBag( <opts>, <chk>, <done>, <extra> )
##
##  Returns the list of all solutions that would be returned one at a time by 
##  `Backtrack'.
##  
##  The following example computes all derrangements of order 4.
##  
##  \beginexample
##  gap> N:=4;;
##  gap> chk:=function(L,extra) local i; i:=Length(L); 
##  >           return not L[i] in L{[1..i-1]} and L[i]<> i; end;;
##  gap> BackTrackBag([1..N],chk,N,[]);
##  [ [ 2, 1, 4, 3 ], [ 2, 3, 4, 1 ], [ 2, 4, 1, 3 ], [ 3, 1, 4, 2 ], 
##    [ 3, 4, 1, 2 ], [ 3, 4, 2, 1 ], [ 4, 1, 2, 3 ], [ 4, 3, 1, 2 ], 
##    [ 4, 3, 2, 1 ] ]
##  \endexample
##  
##  --map
DeclareOperation("BackTrackBag",[IsObject,IsFunction,IsObject,IsObject]);

#E
