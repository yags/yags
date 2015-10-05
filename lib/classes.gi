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
