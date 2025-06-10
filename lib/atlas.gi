############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.6
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

# YAGSInfo.graph6.PadLeftnSplitList6:=function(L) ###################NO SE USA?????
#   #FIXME: error management, data types.
#    local n,n6,L1,LL,i;
#    n:=Length(L);
#    n6:=Maximum(1,Int((n+5)/6)*6);
#    L1:=Concatenation(List([n+1..n6],z->0),L);
#    LL:=[];
#    for i in [1..n6/6] do 
#      LL[i]:=L1{[6*i-5..6*i]};
#    od;
#    return LL;
# end;

YAGSInfo.graph6.PadRightnSplitList6:=function(L) 
  #FIXME: error management, data types.
   local n,n6,L1,LL,i;
   n:=Length(L);
   n6:=Maximum(6,Int((n+5)/6)*6);
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

YAGSInfo.graph6.GraphToBinList:=function(g) 
   local L,n,i,j;
   n:=Order(g);L:=[];
   for j in [1..n] do 
     for i in [1..j-1] do
       if IsEdge(g,[i,j]) then 
         Add(L,1);
       else
         Add(L,0);
       fi;
     od;
   od;
   return L;
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

YAGSInfo.graph6.HararyList:=MakeImmutable(
[ [ 1, 0, 1 ], [ 2, 0, 1 ], [ 2, 1, 1 ], [ 3, 0, 1 ], [ 3, 1, 1 ], 
  [ 3, 2, 1 ], [ 3, 3, 1 ], [ 4, 0, 1 ], [ 4, 1, 1 ], [ 4, 2, 1 ], 
  [ 4, 3, 3 ], [ 4, 2, 2 ], [ 4, 3, 1 ], [ 4, 3, 2 ], [ 4, 4, 1 ], 
  [ 4, 4, 2 ], [ 4, 5, 1 ], [ 4, 6, 1 ], [ 5, 0, 1 ], [ 5, 1, 1 ], 
  [ 5, 2, 1 ], [ 5, 3, 3 ], [ 5, 4, 3 ], [ 5, 2, 2 ], [ 5, 3, 4 ], 
  [ 5, 3, 2 ], [ 5, 3, 1 ], [ 5, 4, 2 ], [ 5, 4, 6 ], [ 5, 5, 5 ], 
  [ 5, 5, 2 ], [ 5, 4, 1 ], [ 5, 5, 1 ], [ 5, 5, 3 ], [ 5, 6, 2 ], 
  [ 5, 6, 5 ], [ 5, 7, 2 ], [ 5, 4, 5 ], [ 5, 4, 4 ], [ 5, 5, 4 ], 
  [ 5, 6, 1 ], [ 5, 6, 3 ], [ 5, 6, 6 ], [ 5, 7, 3 ], [ 5, 5, 6 ], 
  [ 5, 6, 4 ], [ 5, 7, 1 ], [ 5, 8, 1 ], [ 5, 7, 4 ], [ 5, 8, 2 ], 
  [ 5, 9, 1 ], [ 5, 10, 1 ], [ 6, 0, 1 ], [ 6, 1, 1 ], [ 6, 2, 1 ], 
  [ 6, 3, 3 ], [ 6, 4, 4 ], [ 6, 5, 13 ], [ 6, 2, 2 ], [ 6, 3, 4 ], 
  [ 6, 4, 9 ], [ 6, 3, 2 ], [ 6, 3, 1 ], [ 6, 4, 1 ], [ 6, 4, 5 ], 
  [ 6, 5, 6 ], [ 6, 5, 9 ], [ 6, 6, 15 ], [ 6, 4, 7 ], [ 6, 5, 11 ], 
  [ 6, 5, 1 ], [ 6, 5, 8 ], [ 6, 6, 21 ], [ 6, 4, 2 ], [ 6, 5, 5 ], 
  [ 6, 5, 4 ], [ 6, 6, 4 ], [ 6, 6, 12 ], [ 6, 7, 18 ], [ 6, 6, 16 ], 
  [ 6, 7, 22 ], [ 6, 6, 6 ], [ 6, 7, 4 ], [ 6, 7, 17 ], [ 6, 8, 3 ], 
  [ 6, 8, 15 ], [ 6, 9, 1 ], [ 6, 3, 5 ], [ 6, 4, 6 ], [ 6, 4, 8 ], 
  [ 6, 5, 15 ], [ 6, 4, 3 ], [ 6, 5, 3 ], [ 6, 6, 3 ], [ 6, 5, 10 ], 
  [ 6, 6, 14 ], [ 6, 7, 19 ], [ 6, 5, 14 ], [ 6, 6, 19 ], [ 6, 5, 12 ], 
  [ 6, 6, 20 ], [ 6, 5, 7 ], [ 6, 6, 13 ], [ 6, 6, 10 ], [ 6, 7, 10 ], 
  [ 6, 6, 9 ], [ 6, 7, 8 ], [ 6, 7, 13 ], [ 6, 8, 1 ], [ 6, 6, 1 ], 
  [ 6, 7, 3 ], [ 6, 7, 24 ], [ 6, 8, 4 ], [ 6, 5, 2 ], [ 6, 6, 8 ], 
  [ 6, 6, 18 ], [ 6, 6, 5 ], [ 6, 6, 2 ], [ 6, 7, 2 ], [ 6, 6, 11 ], 
  [ 6, 7, 11 ], [ 6, 7, 20 ], [ 6, 8, 2 ], [ 6, 8, 22 ], [ 6, 8, 18 ], 
  [ 6, 8, 8 ], [ 6, 9, 4 ], [ 6, 7, 7 ], [ 6, 8, 21 ], [ 6, 8, 11 ], 
  [ 6, 8, 24 ], [ 6, 8, 9 ], [ 6, 9, 5 ], [ 6, 9, 19 ], [ 6, 10, 5 ], 
  [ 6, 7, 12 ], [ 6, 6, 7 ], [ 6, 7, 6 ], [ 6, 8, 16 ], [ 6, 7, 21 ], 
  [ 6, 7, 16 ], [ 6, 8, 20 ], [ 6, 7, 5 ], [ 6, 8, 12 ], [ 6, 9, 2 ], 
  [ 6, 9, 18 ], [ 6, 9, 13 ], [ 6, 10, 1 ], [ 6, 7, 1 ], [ 6, 8, 19 ], 
  [ 6, 7, 14 ], [ 6, 8, 10 ], [ 6, 9, 3 ], [ 6, 9, 21 ], [ 6, 9, 15 ], 
  [ 6, 9, 14 ], [ 6, 10, 6 ], [ 6, 8, 13 ], [ 6, 8, 23 ], [ 6, 9, 20 ], 
  [ 6, 9, 10 ], [ 6, 10, 3 ], [ 6, 11, 1 ], [ 6, 10, 15 ], [ 6, 9, 17 ], 
  [ 6, 10, 12 ], [ 6, 11, 6 ], [ 6, 12, 2 ], [ 6, 6, 17 ], [ 6, 7, 15 ], 
  [ 6, 7, 23 ], [ 6, 7, 9 ], [ 6, 8, 17 ], [ 6, 8, 14 ], [ 6, 9, 6 ], 
  [ 6, 9, 16 ], [ 6, 8, 5 ], [ 6, 9, 11 ], [ 6, 9, 12 ], [ 6, 9, 9 ], 
  [ 6, 10, 4 ], [ 6, 10, 14 ], [ 6, 11, 2 ], [ 6, 10, 13 ], [ 6, 10, 9 ], 
  [ 6, 11, 4 ], [ 6, 10, 11 ], [ 6, 10, 8 ], [ 6, 11, 5 ], [ 6, 12, 3 ], 
  [ 6, 8, 7 ], [ 6, 8, 6 ], [ 6, 9, 8 ], [ 6, 10, 2 ], [ 6, 9, 7 ], 
  [ 6, 10, 10 ], [ 6, 10, 7 ], [ 6, 11, 3 ], [ 6, 12, 1 ], [ 6, 13, 1 ], 
  [ 6, 11, 7 ], [ 6, 11, 9 ], [ 6, 11, 8 ], [ 6, 12, 4 ], [ 6, 12, 5 ], 
  [ 6, 13, 2 ], [ 6, 14, 1 ], [ 6, 15, 1 ] ]);


## Now we install the public methods.

############################################################################
##
#M  Graph6ToGraph( <String> )
##
InstallMethod(Graph6ToGraph,"for strings", true, [IsString],0,
function(Str)
   local pos,n,bv,i,j,k,Adj;
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
   Adj:=List([1..n],z->[]);
   k:=0;
   for j in [1..n] do 
     for i in [1..j-1] do
       k:=k+1;
       if bv[k]=1 then AddSet(Adj[i],j); fi;
     od;
   od;
   return GraphByAdjacencies(Adj:GraphCategory:=SimpleGraphs);
end);

############################################################################
##
#M  GraphToGraph6( <G> )
##
InstallMethod(GraphToGraph6,"for strings", true, [SimpleGraphs],0,
function(g)
   local N,R;
   N:=YAGSInfo.graph6.McKayN(Order(g));
   R:=YAGSInfo.graph6.McKayR(YAGSInfo.graph6.GraphToBinList(g));
   return Concatenation(N,R);
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
#M  ImportGraph6Iterator( <Filename> )
##
InstallMethod(ImportGraph6Iterator,"for filenames", true, [IsString],0,
function(filename) 
   local reco,inp0,next0,iter;
   inp0:=InputTextFile( filename );
   next0:=ReadLine(inp0);
   reco:=rec(
      filename:=filename,
      count:=0,
      inp:=inp0,
      next:=next0,
      NextIterator:=function(iter) 
        local g;
        g:=iter!.next;
        iter!.next:=ReadLine(iter!.inp);
        if g <> fail then 
          g:=Graph6ToGraph(g); 
          iter!.count:=iter!.count+1;
        fi;
        return g;
      end,
      IsDoneIterator:=function(iter) 
        return iter!.next=fail;
      end,
      ShallowCopy:=function(iter) return reco; end,#should we return fail instead?
      PrintObj:=function(iter) Print("<Iterator for ",iter!.filename," at ",iter!.count,">"); end
   );
   iter:=IteratorByFunctions(reco);
   return iter;
end);

############################################################################
##
#M  ExportGraph6( <Filename>, <G> )
#M  ExportGraph6( <Filename>, <L> )
#M  ExportGraph6( <Filename>, <L>, <overwrite> )
##
InstallOtherMethod(ExportGraph6,"for graphs", [IsString,Graphs],
function(filename, G)
  ExportGraph6(filename,[G],false);#do not overwrite, append instead.
end);

InstallOtherMethod(ExportGraph6,"for list of graphs", [IsString,IsList],
function(filename, L)
  ExportGraph6(filename,L,false);#do not overwrite, append instead.
end);

InstallMethod(ExportGraph6,"for graphs", [IsString,IsList,IsBool],
function(filename,L,overwrite) 
   local outp,str,g; 
   outp:=OutputTextFile( filename, not overwrite );#append = not overwrite
   if outp=fail then
      Print("#W Unable to create/write file: ",filename,"\n"); 
      return fail; 
   fi;
   for g in L do 
     str:=GraphToGraph6(g);
     WriteLine(outp,str);
   od;
   CloseStream(outp);
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

############################################################################
##
#M  HararyToMcKay( <Spec> )
##  
InstallMethod(HararyToMcKay,"for integers", true, [IsList],0,
function(L) 
   return Position(YAGSInfo.graph6.HararyList,L);
end);

############################################################################
##
#M  McKayToHarary( <index> )
##  
InstallMethod(McKayToHarary,"for integers", true, [IsInt],0,
function(x) 
   if x<1 or x>208 then 
     return fail;
   fi;
   return YAGSInfo.graph6.HararyList[x];
end);


