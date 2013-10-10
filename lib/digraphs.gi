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
##  digraphs.gi: things that only apply to directed graphs.
## 


############################################################################
##
#M  InNeigh( <G>, <v> )
##
InstallMethod(InNeigh,"for graphs",true,[Graphs,IsInt],0,
function(G,v)
  if not v in Vertices(G) then return []; fi;
  return Filtered(Vertices(G),u->IsEdge(G,[u,v]));
end);

############################################################################
##
#M  OutNeigh( <G>, <v> )
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
   L:=VertexDegrees(G);
   Sort(L);
   return L=[0..Order(G)-1];
end);


