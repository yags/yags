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
##  distances.gi contains the methods to compute 
##  distances, diameters, distance graphs, and the like.
##


############################################################################
##
#M  DistanceMatrix( <G> )
##
##  Floyd's algorithm
##
InstallMethod(DistanceMatrix,"for graphs",true,[Graphs],0,
function(G)
   local D,M,i,j,k,n;
   n:=Order(G);
   M:=AdjMatrix(G);
   D:=List([1..n],x->List([1..n],y->infinity));
   for i in [1..n] do 
     D[i][i]:=0;
   od;
   for i in [1..n] do
      for j in [i+1..n] do
         if M[i][j] then D[i][j]:=1; fi;
         if M[j][i] then D[j][i]:=1; fi;
      od;
   od;
   for k in [1..n] do 
     for i in [1..n] do
       for j in [1..n] do
          if D[i][k]<infinity and D[k][j]<infinity then
              D[i][j]:=Minimum(D[i][j],D[i][k]+D[k][j]);
          fi;
       od; 
     od;
   od;
   return D;
end);

############################################################################
##
#M  Diameter( <G> )
##
InstallMethod(YAGSDiameter,"for graphs",true,[Graphs],0,
function(G)
   return (Maximum(List(DistanceMatrix(G),Maximum )));
end);
InstallMethod(Diameter,"for graphs",true,[Graphs],0,YAGSDiameter);

############################################################################
##
#M  Radius( <G> )
##
InstallMethod(Radius,"for graphs",true,[Graphs],0,
function(G)
   return(Minimum(List(DistanceMatrix(G),Maximum)));
end);

############################################################################
##
#M  Distance( <G>, <x>, <y> )
##
InstallMethod(Distance,"for graphs",true,[Graphs,IsInt,IsInt],0,
function(G,x,y)
   if not(x  in [1..Order(G)] and y in [1..Order(G)]) then 
       Error("Usage: Distance( <graph>, <vertex1>, <vertex2>)\n");
   fi;
   return DistanceMatrix(G)[x][y];
end);

############################################################################
##
#M  Distances( <G>, <A>, <B> )
##
InstallMethod(Distances,"for graphs",true,[Graphs,IsList,IsList],0,
function(G,A,B)
   local Dist,x,y;
   if not (IsSubset([1..Order(G)],A) and IsSubset([1..Order(G)],B)) then
      Error("Usage: Distances( <graph>, <vertex-set1>, <vertex-set2>)");
   fi;
   Dist:=[];
   for x in A do 
      for y in B do;
         Add(Dist,Distance(G,x,y));
      od;
   od;
   return(Dist);
end);

############################################################################
##
#M  DistanceSet( <G>, <A>, <B> )
##
InstallMethod(DistanceSet,"for graphs",true,[Graphs,IsList,IsList],0,
function(G,A,B)
   local Dist,x,y;
   if not (IsSubset([1..Order(G)],A) and IsSubset([1..Order(G)],B)) then
      Error("Usage: DistanceSet( <graph>, <vertex-set1>, <vertex-set2>)\n");
   fi;
   Dist:=[];
   A:=Set(A);B:=Set(B);
   for x in A do 
      for y in B do;
         AddSet(Dist,Distance(G,x,y));
      od;
   od;
   return(Dist);
end);

############################################################################
##
#M  DistanceGraph( <G>, <Dist> )
##
InstallMethod(DistanceGraph,"for graphs",true,[Graphs,IsList],0,
function(G,Dist)
   local M;
   Dist:=Set(Dist);
   if ForAny(Dist,x->not (IsInt(x)and x>=0)) then
      Error("Usage: DistanceGraph( <graph>, <distance-list>)\n");
   fi;
   M:=List([1..Order(G)],x->List([1..Order(G)],y-> Distance(G,x,y) in Dist));
   return GraphByAdjMatrix(M:GraphCategory:=TargetGraphCategory(G));
end);

############################################################################
##
#M  PowerGraph( <G>, <exp> )
##
InstallMethod(PowerGraph,"for graphs",true,[Graphs,IsInt],0,
function(G,exp)
   local M,i;
   if not ( exp>=0) then
      Error("Usage: Exponent must be non-negative in PowerGraph( <graph>, <exponent>)\n");
   fi;
   M:=List([1..Order(G)],x->List([1..Order(G)],y-> Distance(G,x,y) <= exp));
   return GraphByAdjMatrix(M:GraphCategory:=TargetGraphCategory(G));
end);

############################################################################
##
#F  Eccentricity( <G>, <x> )
##
InstallGlobalFunction(Eccentricity,
function(G,x)
   if not (G in Graphs and x in [1..Order(G)]) then 
      Error("Usage: Eccentricity( <graph>, <vertex>)\n");
   fi;
   return(Maximum(DistanceMatrix(G)[x]));
end);

############################################################################
##
#M  Girth( <G> )
##
InstallMethod(Girth,"for graphs", true, [Graphs],0,
function(G) 
   local x,S0,S,R,girth,height,HasRepetitions;
   if not UndirectedGraphs(G) then 
       Error("Usage: <G> must be a simple graph or an undirected graph in Girth( <G> )");
   fi;
   HasRepetitions:=function(R) 
     return Maximum(List(Collected(R),l->l[2]))>=2 ;
   end;
   girth:=infinity;
   for x in  [1..Order(G)] do
     if IsEdge(G,[x,x]) then return 1; fi;
     S:=[x];height:=1;
     R:=Filtered(Adjacency(G,x),w->w>x);
     while(R<>[]) do 
       if Intersection(S,Set(R))<>[] then 
         girth:=2*height-1; break;
       fi;
       if HasRepetitions(R)  then 
         girth:=2*height; break;
       fi;
       height:=height+1;
       if 2*height>girth then  break; fi;
       S0:=S;S:=Set(R);
       R:=Concatenation(List(S,z->Filtered(Adjacency(G,z),w->w>x and not w in S0)));
     od; 
   od;
   return girth;
end);

#E

