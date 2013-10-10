############################################################################
############################################################################
##
##
##  Yags: Yet another graph system
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.01
##  2003/May/08
##  Graphs, Genetic Algorihms and Groups
##
##  basics.g: Things that GAP forgot to include or I failed to find.
##


############################################################################
##
#F  IsBoolean( <x> )
## 
InstallGlobalFunction(IsBoolean,
function(x) 
  return (x=true or x=false); 
end);


############################################################################
##
#M  DumpObject( <Obj> )
##   
InstallMethod(DumpObject,"for objects",true,[IsObject],0,
function(Obj)
  local x,Attr,Prop,TrueProp;
  Print("Object( ");
    Attr:=KnownAttributesOfObject(Obj);
    Prop:=KnownPropertiesOfObject(Obj);
  Print("TypeObj := ",TypeObj(Obj));
  Print(", Categories := ", CategoriesOfObject(Obj));
  for x in [1..Length(Attr)] do 
    Print(", ");
    Print(Attr[x]," := ",ValueGlobal(Attr[x])(Obj));
  od;
  for x in [1..Length(Prop)] do 
    Print(", ");
    Print(Prop[x]," := ",ValueGlobal(Prop[x])(Obj));
  od;
  Print(" )\n");
end);

#E
