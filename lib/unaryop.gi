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
##  unaryop.gi  some methods that operate on ONE graph
##


############################################################################
##
#M  LineGraph( <G> )
##
##  FIXME: Does this make sense outside SimpleGraphs Category?
##
InstallMethod(LineGraph,"for graphs", true, [Graphs],0,
function(G)
  return IntersectionGraph(Edges(G):Category:=TargetGraphCategory(G));
end);

############################################################################
##
#M  ComplementGraph( <G> )
##
##  FIXME: Makes sense in OrientedGraphs Category?
##
InstallMethod(ComplementGraph,"for graphs", true, [Graphs],0,
function(G) 
   local i,j,M0,M,n;
   n:=Order(G);
   M0:=AdjMatrix(G);
   M:=List([1..n],x->BlistList([1..n],[]));
   for i in [1..n] do
     M[i][i]:=not M0[i][i];
     for j in [i+1..n] do
        M[i][j]:=not M0[i][j];
        M[j][i]:=not M0[j][i];
     od;
   od;
   return GraphByAdjMatrix(M:GraphCategory:=TargetGraphCategory(G));
end);

############################################################################
##
#M  QuotientGraph( <G>, <P> )
#M  QuotientGrfaph( <G>, <L1>, <L2>)
##
##  FIXME: Makes sense in OrientedGraphs Category?
##
InstallMethod(QuotientGraph,"for graphs", true, [Graphs,IsList],0,
function(G,P) 
   local f,i,j,M,P1,rel;
   if ForAny(P,x->not (IsList(x) and IsSubset([1..Order(G)],x))) then
     Error("Usage: <P> must be a partition of V(G), \
i.e. a list of list of vertices of G in QuotientGraph( <G>, <P> )\n");
   fi;
   P1:=List(P,Set);
   for i in [1..Length(P1)] do
     for j in [i+1..Length(P1)] do
       if Intersection(P1[i],P1[j])<>[] then
          Error("each pair of classes in <P> must be\
 disjoint in QuotientGraph( <G>, <P> )\n");
       fi;
     od;
   od;
   P1:=Union(P1,List(Difference([1..Order(G)],Flat(P1)),x->[x]));
   M:=AdjMatrix(G);
   rel:=function(x,y) 
      local u,v; 
      for u in x do
        for v in y do
           if M[u][v] then return true; fi;
        od;
      od;
     return false;
   end;
   return GraphByRelation(P1,rel:GraphCategory:=TargetGraphCategory(G));
end); 

InstallOtherMethod(QuotientGraph,"for graphs", true, [Graphs,IsList,IsList],0,
function(G,L1,L2)
  local P,Pairs,x,n,m;
  if not IsSubset([1..Order(G)],L1) or not IsSubset([1..Order(G)],L2) or 
         Length(L1)<>Length(L2) then
    Error("Usage: L1 and L2 must be lists of vertices of G\
 of the same length in QuotientGraph(G,L1,L2) \n");
  fi;
  Pairs:=List([1..Length(L1)],z->[L1[z],L2[z]]);
  P:=List([1..Order(G)],x->[x]);
  for x in Pairs do 
    n:=First([1..Length(P)],z->x[1] in P[z]);
    m:=First([1..Length(P)],z->x[2] in P[z]);
    if n=m then continue; fi;
    P[n]:=Union(P[n],P[m]);
    RemoveElmList(P,m);
  od;
  return QuotientGraph(G,P);
end);

#E
