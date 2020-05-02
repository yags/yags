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
##  algebraic.gi contains functions to construct graphs
##  with vertices lying in a group or a ring.
##

####FIXME: Does all of this make sense in OrientedGraphs category ?

############################################################################
##
#M  GroupGraph( <G>, <Grp>, <act> )
#M  GroupGraph( <G>, <Grp> )
##
InstallMethod(GroupGraph,"for graphs", true, [Graphs,IsGroup,IsFunction],0,
function(G,Grp,act)
   local V,rel;
   V:=Union(Orbits(Grp,Vertices(G),act));
   rel:=function(x,y) 
         return First(Elements(Grp),g->IsEdge(G,[act(x,g),act(y,g)]))<>fail; 
   end;
   return GraphByRelation(V,rel);
end);

InstallMethod(GroupGraph,"for graphs", true, [Graphs,IsGroup],0,
function(G,Grp)
   return GroupGraph(G,Grp,OnPoints);
end);

############################################################################
##
#M  CayleyGraph( <Grp>, <elms> )
#M  CayleyGraph( <Grp> )
##
InstallMethod(CayleyGraph,"for graphs", true, [IsGroup,IsList],0,
function(Grp,elms)
   if not IsSubset(Elements(Grp),elms) then 
     Error("<elms> must be a subset of Elements( <Grp> ) in \
CayleyGraph( <Grp>, <elms> )\n");
   fi;
   return GraphByRelation(
              Elements(Grp),
              function(x,y) return y*x^-1 in elms; end
          );
end);

InstallMethod(CayleyGraph,"for graphs", true, [IsGroup],0,
function(Grp)
   return CayleyGraph(Grp, GeneratorsOfGroup(Grp));
end);

############################################################################
##
#M  RingGraph( <Rng>, <elms> )
##
InstallMethod(RingGraph,"for graphs", true, [IsRing,IsList],0,
function(Rng,elms)
   if not IsSubset(Elements(Rng),elms) then 
     Error("<elms> must be a subset of Elements( <Rng> ) in \
RingGraph( <Rng>, <elms> )\n");
   fi;
   return GraphByRelation(Elements(Rng),function(x,y) return y-x in elms; end);
end);

############################################################################
##
#M  Circulant( <n>, <jumps> )
##
InstallMethod(Circulant,"for graphs", true, [IsInt,IsList],0,
function(n,jumps)
   local L;
   if not ForAll(jumps,IsInt) then 
     Error("<elms> must be a list of integers in Circulant( <n>, <jumps> )\n");
   fi;
   L:=List(jumps,x->x mod n);
   return GraphByRelation(n, function(x,y) return ((y-x) mod n) in L; end);
end);

############################################################################
##
#M  QuadraticRingGraph( <Rng> )
##
InstallMethod(QuadraticRingGraph,"for graphs", true, [IsRing],0,
function(Rng) 
   return RingGraph(Rng,Set(List(Elements(Rng),z->z^2)));
end);

############################################################################
##
#M  UnitsRingGraph( <Rng> )
##
InstallMethod(UnitsRingGraph,"for graphs", true, [IsRing],0,
function(Rng) 
   return RingGraph(Rng,Elements(Units(Rng)));
end);
