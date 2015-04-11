## This file contains templates for easy cut and paste when adding new functions.


############################################################################
##
#APOF  Func( <G> )
##
##  Returns Func of <G>.
##
##  \beginexample
##  \endexample
##  
##  --map
DeclareAttribute("Func",Graphs);
DeclareProperty("Func",[Graphs]);
DeclareOperation("Func",[Graphs]);
DeclareQtfyProperty("Func",Graphs);
DeclareGlobalFunction("Func");

##--------------------------------------------------------------------------

############################################################################
##
#M  Func( <G> )
##
InstallMethod(Func,"for graphs", true, [Graphs],0,
function(G) 
   return Func;
end);

############################################################################
##
#F  Func( <G> )
##
InstallGlobalFunction(Func,
function(G)
  return Func; 
end);
