############################################################################
##
#V  YAGSInfo
##
##  A global record where much YAGS-related information is stored. 
##  This is intended for internal use, and much of this information is 
##  undocumented, but some of the data stored here could possibly be useful 
##  for advanced users.
##
##  However, storing user information in this record and/or changing the values of 
##  the stored information is discouraged and may produce unpredictable 
##  results and an unstable system.
##
##  \beginexample|unstableoutput
##  gap> YAGSInfo;
##  rec( AuxInfo := "/dev/null", DataDirectory := "/opt/gap4r7/pkg/yags/data", 
##    Directory := "/opt/gap4r7/pkg/yags", Internal := rec(  ), Version := "0.0.1", 
##    graph6 := rec( BinListToNum := function( L ) ... end, 
##        BinListToNumList := function( L ) ... end, McKayN := function( n ) ... end, 
##        McKayR := function( L ) ... end, NumListToString := function( L ) ... end, 
##        NumToBinList := function( n ) ... end, PadLeftnSplitList6 := function( L ) ... end, 
##        PadRightnSplitList6 := function( L ) ... end, 
##        StringToBinList := function( Str ) ... end ) )
##  \endexample
##
DeclareGlobalVariable("YAGSInfo");

############################################################################
##
#F  IsBoolean( <Obj> )
##
##  Returns `true' if object <Obj> is `true' or `false' and `false' otherwise.
##
##  \beginexample
##  gap> IsBoolean( true ); IsBoolean( fail ); IsBoolean ( false );
##  true
##  false
##  true
##  \endexample
##
DeclareGlobalFunction("IsBoolean");

## #FIXME: No funciona para coordenadas (por ejemplo), averiguar por que.
############################################################################
##
#O  DumpObject( <Obj> )
##
##  Dumps all information available for object <Obj>. This information
##  includes to which categories it belongs as well as its type and 
##  hashing information used by {\GAP}.
##
##  \beginexample
##  gap> DumpObject( true );
##  Object( TypeObj := NewType( NewFamily( "BooleanFamily", [ 11 ], [ 11 ] ),
##  [ 11, 34 ] ), Categories := [ "IS_BOOL" ] )
##  \endexample
##
DeclareOperation("DumpObject",[IsObject]);

############################################################################
##
#F  DeclareQtfyProperty( <Name>, <Filter> )
## 
##  For internal use. 
##  
##  Declares a {\YAGS} quantifiable property named <Name> for filter <Filter>. 
##  This in turns, declares a boolean {\GAP} property <Name> and an integer {\GAP} attribute <QtfyName>.  
##
##  The user must provide the method <Name>(<Obj>, <qtfy>). If <qtfy> is false,
##  the method must return a boolean indicating whether the property holds, otherwise,
##  the method must return a non-negative integer quantifying how far is the object from satisfying the property. 
##  In the latter case, returning 0 actually means that the object does satisfy the property.
##
##  \beginexample
##  gap> DeclareQtfyProperty("Is2Regular",Graphs);
##  gap> InstallMethod(Is2Regular,"for graphs",true,[Graphs,IsBool],0,
##  > function(G,qtfy)
##  >   local x,count;
##  >   count:=0;
##  >   for x in Vertices(G) do
##  >     if VertexDegree(G,x)<> 2 then 
##  >       if not qtfy then
##  >         return false;
##  >       fi;
##  >         count:=count+1;
##  >     fi;
##  >   od;
##  >   if not qtfy then return true; fi;
##  >   return count;
##  > end);
##  gap> Is2Regular(CycleGraph(4));
##  true
##  gap> QtfyIs2Regular(CycleGraph(4));
##  0
##  gap> Is2Regular(DiamondGraph);     
##  false
##  gap> QtfyIs2Regular(DiamondGraph);
##  2
##  \endexample
##
DeclareGlobalFunction("DeclareQtfyProperty");
InstallGlobalFunction(DeclareQtfyProperty,
function(N,F) 
   local Qtfyname; 
   Qtfyname:=Concatenation("Qtfy",N);
   DeclareProperty(N,F);
   DeclareAttribute(Qtfyname,F);
   DeclareOperation(N,[F,IsBool]); # to be provided by user

   InstallMethod(ValueGlobal(N),"trying easy way",true,[F],0,
   function(Obj) 
       if Tester(ValueGlobal(Qtfyname))(Obj) then
          return ValueGlobal(Qtfyname)(Obj)=0;
       else
          return ValueGlobal(N)(Obj,false); 
       fi;
   end); 

   InstallMethod(ValueGlobal(Qtfyname),"trying easy way",true,[F],0,
   function(Obj)  
       if Tester(ValueGlobal(N))(Obj) and 
                 ValueGlobal(N)(Obj)=true then
          return 0;
       else
          return ValueGlobal(N)(Obj,true); 
       fi;
   end); 
end);

## FIXME: Be more explicit.
############################################################################
##
#F  UFFind( <UFS>, <x> )
##  
##  For internal use. Implements the <find> operation on the <union-find structure>. 
##  
DeclareGlobalFunction("UFFind");

## FIXME: Be more explicit.
############################################################################
##
#F  UFUnite( <UFS>, <x>, <y> )
##  
##  For internal use. Implements the <unite> operation on the <union-find structure>. 
##  
DeclareGlobalFunction("UFUnite");

############################################################################
##
#O  RandomlyPermuted( <Obj> )
##
##  Returns a copy of <Obj> with the order of its elements permuted randomly.
##  Currently, the operation is implemented for lists and graphs.
##
##  \beginexample
##  gap> RandomlyPermuted([1..9]);
##  [ 9, 7, 5, 3, 1, 4, 8, 6, 2 ]
##  gap> g:=PathGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies := 
##  [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
##  gap> RandomlyPermuted(g);           
##  Graph( Category := SimpleGraphs, Order := 4, Size := 3, Adjacencies := 
##  [ [ 4 ], [ 3, 4 ], [ 2 ], [ 1, 2 ] ] )
##  \endexample
##  
DeclareOperation("RandomlyPermuted",[IsObject]);

############################################################################
##
#O  RandomPermutation( <n> )
##
##  Returns a random permutation of the list `[1, 2, ... <n>]'.
##
##  \beginexample
##  gap> RandomPermutation(12);
##  (1,8,10)(2,7,9,12)(3,5,11)(4,6)
##  \endexample
##  
DeclareOperation("RandomPermutation",[IsInt]);

#E
