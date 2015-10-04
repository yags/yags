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
##  binnaryop.gi  some methods that operate on TWO or more graphs
##  mainly products and sums.
##


############################################################################
##
#M  BoxProduct( <G>, <H> )
##
InstallMethod(BoxProduct,"box product",true, [Graphs,Graphs],0,
function(G,H)
    local ctgy,M1,M2,rel;
    ctgy:=TargetGraphCategory(G,H);
    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
    rel:=function(x,y) 
        return (x[1]=y[1] and M2[x[2]][y[2]]) or (x[2]=y[2] and M1[x[1]][y[1]]); 
    end;
    return GraphByRelation(Cartesian([1..Order(G)],[1..Order(H)]),rel :GraphCategory:=ctgy);
end);

############################################################################
##
#M  TimesProduct( <G>, <H> )
##
InstallMethod(TimesProduct,"times product",true, [Graphs,Graphs],0,
function(G,H)
    local ctgy,M1,M2,rel;
    ctgy:=TargetGraphCategory(G,H);
    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
    rel:=function(x,y) 
        return M1[x[1]][y[1]] and M2[x[2]][y[2]]; 
    end;
    return GraphByRelation(Cartesian([1..Order(G)],[1..Order(H)]),rel :GraphCategory:=ctgy);
end);

############################################################################
##
#M  BoxTimesProduct( <G>, <H> )
##
InstallMethod(BoxTimesProduct,"boxtimes product",true, [Graphs,Graphs],0,
function(G,H)
    local ctgy,M1,M2,rel;
    ctgy:=TargetGraphCategory(G,H);
    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
    rel:=function(x,y) 
        return (x[1]=y[1] or M1[x[1]][y[1]]) and (x[2]=y[2] or M2[x[2]][y[2]]); 
    end;
    return GraphByRelation(Cartesian([1..Order(G)],[1..Order(H)]),rel :GraphCategory:=ctgy);
end);


############################################################################
##
#M  Union( <G>, <H> )#FIXME: Union is a function in gap!
##
##  InstallMethod(Union,"for graphs",true, [Graphs,Graphs],0,
##  function(G,H)
##    local ctgy,M1,M2,rel;
##    ctgy:=TargetGraphCategory(G,H);
##    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
##    rel:=function(x,y) 
##        return (IsBound(M1[x][y]) and M1[x][y]) or (IsBound(M2[x][y]) and  M2[x][y]); 
##    end;
##    return GraphByRelation(Maximum(Order(G),Order(H)),rel :GraphCategory:=ctgy);
##  end);

############################################################################
##
#M  DisjointUnion( <G>, <H> )
##
InstallMethod(DisjointUnion,"for graphs",true, [Graphs,Graphs],0,
function(G,H)
    local ctgy,M1,M2,rel;
    ctgy:=TargetGraphCategory(G,H);
    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
    rel:=function(x,y) 
        if x<=Order(G) and y<=Order(G) then 
            return M1[x][y];
        elif  x>Order(G) and y>Order(G) then
            return M2[x-Order(G)][y-Order(G)];
        fi; 
        return false;
    end;
    return GraphByRelation(Order(G)+Order(H),rel :GraphCategory:=ctgy);
end);

############################################################################
##
#M  Join( <G>, <H> )
##
InstallMethod(Join,"for graphs",true, [Graphs,Graphs],0,
function(G,H)
    local ctgy,M1,M2,rel;
    ctgy:=TargetGraphCategory(G,H);
    M1:=AdjMatrix(G);M2:=AdjMatrix(H);
    rel:=function(x,y) 
        if x<=Order(G) and y<=Order(G) then 
            return M1[x][y];
        elif  x>Order(G) and y>Order(G) then
            return M2[x-Order(G)][y-Order(G)];
        fi; 
        return true;
    end;
    return GraphByRelation(Order(G)+Order(H),rel :GraphCategory:=ctgy);
end);

############################################################################
##
#M  GraphSum( <G>, <L> )
##
InstallMethod(GraphSum,"for graphs",true, [Graphs,IsList],0,
function(G,L)
    local ctgs,ctgy,K1,i,V,rel;
    if ForAny(L,x->not x in Graphs) then 
      Error("Usage: GraphSum( <graph>, <list-of-graphs> )\n");
    fi;
    ctgy:=TargetGraphCategory(Concatenation([G],L));
    K1:=CompleteGraph(1:GraphCategory:=SimpleGraphs);
    for i in [1..Order(G)] do 
       if not IsBound(L[i]) then
          L[i]:=K1;
       fi;
    od;
    V:=Union(List([1..Order(G)],x->Cartesian([x],[1..Order(L[x])]) ));
    rel:=function(x,y)
      if x[1]<>y[1] then 
         return AdjMatrix(G)[x[1]][y[1]]; 
      else
         return AdjMatrix(L[x[1]])[x[2]][y[2]];
      fi;
    end;
    return GraphByRelation(V,rel:GraphCategory:=ctgy);
end);

############################################################################
##
#M  Composition( <G>, <H> )
##
InstallMethod(Composition,"for graphs",true, [Graphs,Graphs],0,
function(G,H)
    return GraphSum(G,List([1..Order(G)],x->H));
end);

#E
