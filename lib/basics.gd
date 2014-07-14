############################################################################
##
#F  IsBoolean( <O> )
##
##  Returns `true' if object <O> is `true' or `false' and `false' otherwise.
##
##  \beginexample
##  gap> IsBoolean( true ); IsBoolean( fail ); IsBoolean ( false );
##  true
##  false
##  true
##  \endexample
##
##  --map
DeclareGlobalFunction("IsBoolean");

## #FIXME: No funciona para coordenadas (por ejemplo), averiguar por que.
############################################################################
##
#O  DumpObject( <O> )
##
##  Dumps all information available for object <O>. This information
##  includes to which categories it belongs as well as its type and 
##  hashing information used by {\GAP}.
##
##  \beginexample
##  gap> DumpObject( true );
##  Object( TypeObj := NewType( NewFamily( "BooleanFamily", [ 11 ], [ 11 ] ),
##  [ 11, 34 ] ), Categories := [ "IS_BOOL" ] )
##  \endexample
##
##  --map
DeclareOperation("DumpObject",[IsObject]);

############################################################################
##
#F  DeclareQtfyProperty( <Name>, <Filter> )
## 
##  For internal use. 
##  
##  Declares a \YAGS\ quantifiable property named <Name> for filter <Filter>. 
##  This in turns, declares a boolean \GAP\ property <Name> and an integer \GAP\ attribute <QtfyName>.  
##
##  The user must provide the method <Name>(<O>, <qtfy>). If <qtfy> is false,
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
##  --map
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

#E
