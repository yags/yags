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
##  iso.gi contains the basic methods 
##  to compute isomorphisms between graphs
##

##FIXME: All of these is preliminary code, make it much more efficient!


############################################################################
##
#I  CHK_ISO( <L>, <extra> ) ... intended for internal use
##
BindGlobal("CHK_ISO",function(L,extra)
   local x,y,G,H;
   G:=extra[1];H:=extra[2];
   x:=Length(L);
   if VertexDegree(G,x)<>VertexDegree(H,L[x]) then
      return false;
   fi;
   if L[x] in L{[1..x-1]} then
      return false;
   fi;
   for y in [1..x] do
       if AdjMatrix(G)[y][x]<>AdjMatrix(H)[L[y]][L[x]] then
         return false;
       fi;
       if AdjMatrix(G)[x][y]<>AdjMatrix(H)[L[x]][L[y]] then
         return false;
       fi;
   od;
   return true;
end);


############################################################################
##
#M  NextIsoMorphism( <G>, <H>, <morph> )
#M  IsoMorphism( <G>, <H> )
#M  IsoMorphisms( <G>, <H> )
##
InstallMethod(NextIsoMorphism,"for Graphs",true,[Graphs,Graphs,IsList],0,
function(G,H, morph)
    if Order(G)<>Order(H) then
      return fail;
    fi;
    if Collected(VertexDegrees(G))<>Collected(VertexDegrees(H)) then
      return fail;
    fi;
    return Backtrack(morph,[1..Order(G)],CHK_ISO,Order(G),[G,H]);
end);

InstallMethod(IsoMorphism,"for Graphs",true,[Graphs,Graphs],0,
function(G,H)
    return NextIsoMorphism(G,H,[]);
end);

InstallMethod(IsoMorphisms,"for Graphs",true,[Graphs,Graphs],0,
function(G,H)
    if Order(G)<>Order(H) then
      return [];
    fi;
    if Collected(VertexDegrees(G))<>Collected(VertexDegrees(H)) then
      return [];
    fi;
    return BacktrackBag([1..Order(G)],CHK_ISO,Order(G),[G,H]);
end);

############################################################################
##
#M  IsIsomorphicGraph( <G>, <H> )
##
InstallMethod(IsIsomorphicGraph,"for Graphs",true,[Graphs,Graphs],0,
function(G,H)
   if IsoMorphism(G,H)=fail then
      return false;
   else
      return true;
   fi;
end);

############################################################################
##
#M  AutGroupGraph( <G> )
##
##  Returns the group of automorphisms of the graph <G>.
##
InstallMethod(AutGroupGraph,"for Graphs",true,[Graphs],0,
function(G)
   local L;
   L:=IsoMorphisms(G,G);
   L:=List(L,PermList);
   L:=SmallGeneratingSet(Group(L));
   if L=[] then L:=[()]; fi;
   return Group(L);
end);

############################################################################
##
#M  AutomorphismGroup( <G> )
##
##  Returns the group of automorphisms of the graph <G>.
##
InstallOtherMethod(AutomorphismGroup,"for Graphs",true,[Graphs],0,AutGroupGraph);

#E
