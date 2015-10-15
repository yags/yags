############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.1
##  2003/May/08
##
##  classes.gi contains the methods used
##  to recognize some well-known graph classes.
##


############################################################################
##
#M  IsDiamondFree( <G>, <qtfy> )
##
InstallMethod(IsDiamondFree,"for graph",true, [SimpleGraphs,IsBool],0,
function(G,qtfy)
   local edgs, count,common,e;
   edgs:=Edges(G);
   count:=0;
   for e in edgs do
      common:=Intersection(Adjacency(G,e[1]),Adjacency(G,e[2]));
      if not IsComplete(G,common) then
         if qtfy then
            count:=count+1;
         else
            return false;
         fi;
      fi;
   od;
   if qtfy then
     return count;
   else
     return true;
   fi;
end);

############################################################################
##
#M  IsLocallyH( <G>, <H> )
##
InstallMethod(IsLocallyH, [Graphs,Graphs],
function(G,H)   
   local i;
   for i in Vertices(G) do 
      if not IsIsomorphicGraph(H,Link(G,i)) then 
        return false; 
      fi;
   od;
   return true;
end);

############################################################################
##
#M  IsLocallyConstant( <G> )
##
InstallMethod(IsLocallyConstant, [Graphs],
function(G) 
   local i,H;
   if Order(G)< 1 then return true; fi;
   H:=Link(G,1);
   for i in Vertices(G) do 
      if not IsIsomorphicGraph(H,Link(G,i)) then 
        return false; 
      fi;
   od;
   return true;
end);

############################################################################
##
#M  IsSurface( <G> )
##
InstallMethod(IsSurface, [Graphs],
function(G) 
   local N, x;
   for x in Vertices(G) do
     N:=Link(G,x);
     if not (Order(N)>=4 and IsIsomorphicGraph(N,CycleGraph(Order(N)))) then 
       return false;
     fi;
   od;
   return true;
end);

############################################################################
##
#M  IsCompactSurface( <G> )
##
InstallMethod(IsCompactSurface, [Graphs],
function(G) 
   local N, x;
   for x in Vertices(G) do
     N:=Link(G,x);
     if not (Order(N)>=4 and IsIsomorphicGraph(N,CycleGraph(Order(N)))) and
        not (Order(N)>=2 and IsIsomorphicGraph(N,PathGraph(Order(N)))) then 
       return false;
     fi;
   od;
   return true;
end);

############################################################################
##
#M  BoundaryVertices( <G> )
##
InstallMethod(BoundaryVertices, [Graphs],
function(G) 
   if not IsCompactSurface(G) then return fail; fi;
   return Filtered(Vertices(G),function(x)
     local N;
     N:=Link(G,x);
     return not IsIsomorphicGraph(N,CycleGraph(Order(N)));
     end
   );
end);

############################################################################
##
#M  InteriorVertices( <G> )
##
InstallMethod(InteriorVertices, [Graphs],
function(G) 
  if not IsCompactSurface(G) then return fail; fi;
  return Filtered(Vertices(G),function(x)
    local N;
    N:=Link(G,x);
    return IsIsomorphicGraph(N,CycleGraph(Order(N)));
    end
  );
end);



#E
