############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.5
##  2003/May/08
##
##  basics.gi: Things that I would like GAP to have and YAGSInfo stuff.
##

############################################################################
##
#V  YAGSInfo
##
InstallValue(YAGSInfo , rec() );
YAGSInfo.Directory:=PackageInfo("yags")[1].InstallationPath;
YAGSInfo.DataDirectory:=Concatenation(YAGSInfo.Directory,"/data");
YAGSInfo.Arch:=1; #Unix (default)
if "apple" in SplitString(GAPInfo.Architecture,"","-") then 
    YAGSInfo.Arch:=2; #Mac OS X
fi;
if "cygwin" in SplitString(GAPInfo.Architecture,"","-") then 
    YAGSInfo.Arch:=3; #Windows
fi;
YAGSInfo.Version:=PackageInfo("yags")[1].Version;
YAGSInfo.IsOnJupiter:=IsPackageLoaded("jupyterkernel");

############################################################################
##
#I  YAGSInfo.InfoClass
##
YAGSInfo.InfoOutput:="*stdout*";
YAGSInfo.InfoClass:=NewInfoClass("YAGSInfoClass");
SetInfoHandler(YAGSInfo.InfoClass,function ( infoclass, level, messagelist )
    local message;           
    if level > InfoLevel( infoclass )  then
        return;
    fi;
    AppendTo(YAGSInfo.InfoOutput, "#I " );
    for message in messagelist do
        AppendTo(YAGSInfo.InfoOutput,message);
    od;
    AppendTo(YAGSInfo.InfoOutput, "\r" );
    return;
end);

############################################################################
##
#F  IsBoolean( <Obj> )
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


############################################################################
##
#F  UFFind( <UFS>, <x> )
## 
InstallGlobalFunction("UFFind",
function(UFS,x)
  local x1,L;
  L:=[];
  if not IsBound(UFS[x]) then 
    UFS[x]:=rec(size:=1,parent:=0); #parent=0 means x is a root. 
  fi;
  while UFS[x].parent<>0 do
     Add(L,x);    #record x for later path compression
     x:=UFS[x].parent;
  od;             #now x is a root vertex.
  for x1 in L do  #path compression, (size may become invalid for non-root vertices)
     UFS[x1].parent:=x;
  od;
  return x;
end);

############################################################################
##
#F  UFUnite( <UFS>, <x>, <y> )
## 
InstallGlobalFunction("UFUnite",
function(UFS,x,y) # returns true if some action actually took place
  x:=UFFind(UFS,x);
  y:=UFFind(UFS,y);
  if x=y then return false; fi;
  if UFS[x].size<UFS[y].size then 
    UFS[x].parent:=y;
    UFS[y].size:=UFS[y].size+UFS[x].size;
    return true;
  fi;
  UFS[y].parent:=x;
  UFS[x].size:=UFS[x].size+UFS[y].size;
  return true;
end);

############################################################################
##
#M  RandomlyPermuted( <L> )
##
InstallMethod(RandomlyPermuted,"for lists", true, [IsList],0,
function(L)
    local L0,Perm,x;
    Perm:=[];
    L0:=ShallowCopy(L);
    while L0<>[] do
      x:=RandomList(L0);
      L0:=Difference(L0,[x]);
      Add(Perm,x);
    od;
    return Perm;
end);

############################################################################
##
#M  RandomPermutation( <n> )
##
InstallMethod(RandomPermutation,"for integers", true, [IsInt],0,
function(n)
  return PermList(RandomlyPermuted([1..n]));
end);

############################################################################
##
#M  RandomSubset( <Set> )
#M  RandomSubset( <Set>, <k> )
#M  RandomSubset( <Set>, <p> )
##
InstallOtherMethod(RandomSubset,"for sets",true,[IsList],0,
function(S)
    return RandomSubset(S,1/2);
end);

InstallOtherMethod(RandomSubset,"for sets",true,[IsList,IsFloat],0,
function(S,p)
    return RandomSubset(S,Rat(p));
end);

InstallMethod(RandomSubset,"for sets",true,[IsList,IsRat],0,
function(S,p)
    local k,L,S1,x;
    S1:=StructuralCopy(S);L:=[];
    if IsInt(p) then
       if p> Length(S) or p< 0 then return fail; fi;
       for k in [1..p] do 
          L[k]:=RandomList(S1);
          S1:=Difference(S1,[L[k]]);
       od;
    elif  p<0 or p>=1 then return fail;
    else   
       for k in [1..Length(S1)] do
           if RandomList([1..DenominatorRat(p)]) <=NumeratorRat(p) then
              Add(L,S1[k]);
          fi;
       od;
    fi;
    return L;
end);

############################################################################
##
#O  EquivalenceRepresentatives( <L>, <Eqiv> )
## 
InstallMethod(EquivalenceRepresentatives,"for Lists",true,[IsList,IsFunction],0,
function(L,rel)
  local Bag,x,y;
  Bag:=[];
  for x in L do
    if not ForAny(Bag,y->rel(x,y)) then
      Add(Bag,x);
    fi;
  od;
 return Bag;
end);

############################################################################
##
#F  YAGSPositionsTrueBlist( <Blist> )
## 
InstallGlobalFunction(YAGSPositionsTrueBlist,
function(Blist) 
  return ListBlist([1..Length(Blist)],Blist);
end);
#E
