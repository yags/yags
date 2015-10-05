############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.1
##  2015/Sep/30
##
##  atlas.gi contains methods for decoding Brendan McKay's graph6 format
##  and for dealing with Brendan McKay's databases for small graphs.
##


## First we define several private methods:
YAGSInfo.graph6:=rec();

YAGSInfo.graph6.NumToBinList:=function(n)
   local NumBin,d0;
   if not (IsInt(n) and n>=0) then 
     Error("Usage: n must be a non-negative integer \
in function YAGSInfo.graph6.NumToBinList(n)\n");
   fi;
   if n=0 then return [0]; fi;
   if n=1 then return [1]; fi;
   d0:=(n mod 2);
   NumBin:=YAGSInfo.graph6.NumToBinList((n-d0)/2);
   Add(NumBin,d0);
   return NumBin;
end;

YAGSInfo.graph6.BinListToNum:=function(L)
  #FIXME: error management, data types.
  local num,b;
  num:=0;
  for b in L do 
    num:=num*2+b;
  od;
  return num;
end;

YAGSInfo.graph6.PadLeftnSplitList6:=function(L) ###################NO SE USA?????
  #FIXME: error management, data types.
   local n,n6,L1,LL,i;
   n:=Length(L);
   n6:=Maximum(1,Int((n+5)/6)*6);
   L1:=Concatenation(List([n+1..n6],z->0),L);
   LL:=[];
   for i in [1..n6/6] do 
     LL[i]:=L1{[6*i-5..6*i]};
   od;
   return LL;
end;

YAGSInfo.graph6.PadRightnSplitList6:=function(L) 
  #FIXME: error management, data types.
   local n,n6,L1,LL,i;
   n:=Length(L);
   n6:=Maximum(1,Int((n+5)/6)*6);
   L1:=Concatenation(L,List([n+1..n6],z->0));
   LL:=[];
   for i in [1..n6/6] do 
     LL[i]:=L1{[6*i-5..6*i]};
   od;
   return LL;
end;

YAGSInfo.graph6.BinListToNumList:=function(L) 
  #FIXME: error management, data types.
    local Ln;
    Ln:=YAGSInfo.graph6.PadRightnSplitList6(L);
    Ln:=List(Ln,l->YAGSInfo.graph6.BinListToNum(l)+63);
    return Ln;
end;

YAGSInfo.graph6.NumListToString:=function(L) 
  #FIXME: error management, data types.
   local str,n;
   str:=[];
   for n in L do
     Add(str,CharInt(n)); 
   od;
   return str;
end;

YAGSInfo.graph6.McKayR:=function(L) 
  #FIXME: error management, data types.
    return YAGSInfo.graph6.NumListToString(YAGSInfo.graph6.BinListToNumList(L));
end;

YAGSInfo.graph6.McKayN:=function(n) 
  #FIXME: error management, data types.
   local str,str2;
   str:=[];str2:=YAGSInfo.graph6.NumToBinList(n);
   if(n<0 or n>68719476735) then return fail; fi;
   if n<=62 then
      str2:=Concatenation(List([Length(str2)+1..6],z->0),str2); 
   elif n<=258047 then 
       Add(str,CharInt(126));
       str2:=Concatenation(List([Length(str2)+1..18],z->0),str2); 
   else 
       Add(str,CharInt(126)); 
       Add(str,CharInt(126)); 
       str2:=Concatenation(List([Length(str2)+1..36],z->0),str2);
   fi;
   str2:=YAGSInfo.graph6.McKayR(str2);
   return Concatenation(str,str2); 
end;

YAGSInfo.graph6.StringToBinList:=function(Str) 
    local car,L,num,aux;
    L:=[];
    for car in Str do
       num:=IntChar(car)-63;
       aux:=YAGSInfo.graph6.NumToBinList(num);
       aux:=Concatenation(List([Length(aux)+1..6],z->0),aux);
       Append(L,aux); 
    od;
    return L;
end;

## Now we install the public methods.

############################################################################
##
#M  Graph6ToGraph( <String> )
##
InstallMethod(Graph6ToGraph,"for strings", true, [IsString],0,
function(Str)
   local pos,n,bv,i,j,k,M;
   if Str[Length(Str)] in "\n\r" then Remove(Str); fi;  
   if Str[Length(Str)] in "\n\r" then Remove(Str); fi;  
   if Str{[1,2]}="~~" then
      pos:=9;
      n:=YAGSInfo.graph6.BinListToNum(YAGSInfo.graph6.StringToBinList(Str{[3..8]}));
   elif Str[1]='~' then
      pos:=5;
      n:=YAGSInfo.graph6.BinListToNum(YAGSInfo.graph6.StringToBinList(Str{[2..4]}));
   else
      pos:=2;
      n:=YAGSInfo.graph6.BinListToNum(YAGSInfo.graph6.StringToBinList(Str{[1]}));
   fi;
   bv:=YAGSInfo.graph6.StringToBinList(Str{[pos..Length(Str)]}); #bv:=bitvector;
   M:=List([1..n],z->List([1..n],w->false));
   k:=0;
   for j in [1..n] do 
     for i in [1..j-1] do
       k:=k+1;
       if bv[k]=1 then M[i][j]:=true; fi;
     od;
   od;
   return GraphByAdjMatrix(M:GraphCategory:=SimpleGraphs);
end);

############################################################################
##
#M  ImportGraph6( <Filename> )
##
InstallMethod(ImportGraph6,"for filenames", true, [IsString],0,
function(filename) 
   local inp,str,L; 
   L:=[];
   inp:=InputTextFile( filename );
   if inp=fail then
      Print("#W Unreadable File: ",filename,"\n"); 
      return fail; 
   fi;
   str:=ReadLine(inp);
   while(str<>fail) do 
      Add(L,Graph6ToGraph(str));
      str:=ReadLine(inp);
   od;
   CloseStream(inp);
   return L;
end);

############################################################################
##
#M  GraphsOfGivenOrder( <n> )
##
InstallMethod(GraphsOfGivenOrder,"for integers", true, [IsInt],0,
function(n)
  local filename;
  if n<1 then return fail; fi;
  filename:=StructuralCopy(YAGSInfo.DataDirectory);
  Append(filename,"/graph");
  Append(filename,String(n));
  Append(filename,".g6");
  return ImportGraph6(filename);
end);

############################################################################
##
#M  ConnectedGraphsOfGivenOrder( <n> )
##
InstallMethod(ConnectedGraphsOfGivenOrder,"for integers", true, [IsInt],0,
function(n)
  local filename;
  if n<1 then return fail; fi;
  filename:=StructuralCopy(YAGSInfo.DataDirectory);
  Append(filename,"/graph");
  Append(filename,String(n));
  Append(filename,"c.g6");
  return ImportGraph6(filename);
end);

