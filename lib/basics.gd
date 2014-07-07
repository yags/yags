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
DeclareGlobalFunction("IsBoolean");

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
DeclareOperation("DumpObject",[IsObject]);

############################################################################
##
#F  DeclareQtfyProperty( <N>, <F> )
## 
##  Declares a quantifiable property named <N> for filter <F>. A
##  quantifiable property is a property that can be measured according
##  to some metric. This Declaration actually declares two functions:
##  a boolean property <N> and an integer property Qtfy<N>.  The
##  user must provide the method <N>(<O>, <qtfy>) where <qtfy> is
##  a boolean that tells the method whether to quantify the property or
##  simply return a boolean stating if the property is `true' or `false'. 
##
##  \beginexample
##  gap> DeclareQtfyProperty("Is2Regular",Graphs);
##  gap> InstallMethod(Is2Regular,"for graphs",true,[Graphs,IsBool],0,
##  > function(G,qtfy)
##  >  local m;
##  >  m:=Length(Filtered(VertexDegrees(G),x->x<>2));
##  >  if qtfy then
##  >     return m;
##  >  else
##  >     return (m=0);
##  >  fi;
##  > end);
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

#E
