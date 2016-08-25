############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.2
##  2003/May/08
##
##  digraphs.gi: things that only apply to directed graphs.
## 


############################################################################
##
#M  InNeigh( <G>, <x> )
##
InstallMethod(InNeigh,"for graphs",true,[Graphs,IsInt],0,
function(G,v)
  if not v in Vertices(G) then return []; fi;
  return Filtered(Vertices(G),u->IsEdge(G,[u,v]));
end);

############################################################################
##
#M  OutNeigh( <G>, <x> )
##
InstallMethod(OutNeigh,"for graphs",true,[Graphs,IsInt],0,
function(G,v)
  if not v in Vertices(G) then return []; fi;
  return Adjacency(G,v);
end);

############################################################################
##
#M  IsTournament( <G> ) 
##  #FIXME: make this quantifiable
##
InstallMethod(IsTournament,"for graphs",true,[Graphs],0,
function(G)
   if not IsOriented(G) then return false; fi;
   return Sum(VertexDegrees(G))=Order(G)*(Order(G)-1)/2;
end);

############################################################################
##
#M  IsTransitiveTournament( <G> ) 
##  #FIXME: make this quantifiable
##
InstallMethod(IsTransitiveTournament,"for graphs",true,[Graphs],0,
function(G)
   local L;
   L:=ShallowCopy(VertexDegrees(G));
   Sort(L);
   return L=[0..Order(G)-1];
end);

# #FIXME: Use general finite fields and add references:
# Paley, R.E.A.C. (1933). "On orthogonal matrices". J. Math. Phys. 12: 311–320.
# Sachs, Horst (1962). "Über selbstkomplementäre Graphen". 
# Publicationes Mathematicae Debrecen 9: 270–288. MR 0151953.
# Erdős, P.; Rényi, A. (1963). "Asymmetric graphs". 
# Acta Mathematica Academiae Scientiarum Hungaricae 14 (3–4): 295–315. doi:10.1007/BF01895716. MR 0156334.
############################################################################
##
#O  PaleyTournament( <prime> )
##  
InstallMethod(PaleyTournament,[IsInt],
function(P)
    local G,jumps;
    if not IsPrime(Integers,P) then return fail; fi;
    if not 0 = ((P-3) mod 4) then return fail; fi;
    jumps:=Set(List([1..P-1],x->((x^2) mod P)));
    return Circulant(P,jumps:GraphCategory:=OrientedGraphs);
end);

############################################################################
##
#O  Orientations( <G> )
##  
InstallMethod(Orientations,[Graphs],
function(G)
  local G0,Edgs,Doubles,n,Bag,Sol,chk,Aux1,EliminateEdges;
  EliminateEdges:=function(G0,D,S)
    local Edgs1,k;
    Edgs1:=[];
    for k in [1..Length(D)] do
      if S[k]=0 then
        AddSet(Edgs1,D[k]);
       else
        AddSet(Edgs1,[D[k][2],D[k][1]]);
      fi;
    od;
    return(RemoveEdges(G0,Edgs1:GraphCategory:=OrientedGraphs));
  end;
  if OrientedGraphs(G) then return [G]; fi;
  G0:=CopyGraph(G:GraphCategory:=Graphs);
  Edgs:=Set(Edges(G0));
  Doubles:=Filtered(Edgs,z->z[1]<z[2] and IsEdge(G0,z[2],z[1]));
  n:=Length(Doubles);
  Bag:=[];
  Sol:=[];
  chk:=function(u,v) return true; end;
  while Backtrack(Sol,[0,1],chk,n,[])<>fail do
    Add(Bag,EliminateEdges(G0,Doubles,Sol));
  od;
  return(Bag);
end
);


#E
