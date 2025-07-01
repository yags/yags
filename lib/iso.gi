############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, D. Lopez, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.6
##  2025/Jun/09
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
#I  IsoMorphismIJ( <G1>, <G2>, <i>, <j> ) ... intended for internal use.
##
BindGlobal("IsoMorphismIJ",function(G1,G2,i,j)
    local chk;
    chk:=function(L,extra)
        local x,y,G,H;
        G:=extra[1];H:=extra[2];
        x:=Length(L);
        if x = 0 then return true; fi;
        if x < i then return L[x]=x; fi;
        if x = i and L[i]<>j then return false; fi;
   
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
    end;
  
    return Backtrack([], Vertices(G2), chk, Order(G1),[G1,G2]);
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
    return NextIsoMorphism(G,H,[fail]);
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
#M  AutomorphismGroup( <G> )
##
##  Returns the group of automorphisms of the graph <G>.
##
InstallOtherMethod(AutomorphismGroup,"for Graphs",true,[Graphs],0,
function(G) 
   local i,j,s,L,n;
   #if HasAutomorphismGroup(G) then return AutomorphismGroup(G); fi; 
   n:=Order(G);L:=[];
   for i in [1..n] do 
     for j in [i+1..n] do
       s:=IsoMorphismIJ(G,G,i,j);
       if s<> fail then Add(L,PermList(s)); fi;
     od;
   od;
#   if L=[] then 
#     SetAutomorphismGroup(g,Group([()])); 
#   else
#     SetAutomorphismGroup(g,Group(SmallGeneratingSet(Group(L))));
#   fi;
#   return AutomorphismGroup(g);
   if L=[] then return Group([()]); fi;
   return Group(SmallGeneratingSet(Group(L)));
end);

############################################################################
##
#M  AutGroupGraph( <G> )
##
##  Returns the group of automorphisms of the graph <G>.
##
InstallOtherMethod(AutGroupGraph,"for Graphs",true,[Graphs],0,AutomorphismGroup);

#E
