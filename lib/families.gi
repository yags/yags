############################################################################
############################################################################
##
##  YAGS: Yet Another Graph System
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.1
##  2003/May/08
##
##  families.gi contains the basic methods 
##  to generate several useful graphs



############################################################################
##
#F  DiscreteGraph( <n> )
##
InstallGlobalFunction(DiscreteGraph,
function(N) 
  if not IsPosInt(N) then
    Error("Usage: DiscreteGraph( <positive integer> )\n");
  fi;
  return GraphByRelation(N,ReturnFalse);
end);

############################################################################
##
#F  CompleteGraph( <n> )
##
InstallGlobalFunction(CompleteGraph,
function(N) 
  if not IsPosInt(N) then
    Error("Usage: CompleteGraph( <positive integer> )\n");
  fi;
  return GraphByRelation(N,ReturnTrue);
end);

############################################################################
##
#F  PathGraph( <n> )
##
InstallGlobalFunction(PathGraph,
function(N) 
  if not (IsInt(N) and N>=1) then
    Error("<n> must be at least 1 in PathGraph( <n> )\n");
  fi;
  if N=1 then return
    DiscreteGraph(1);
  fi;
  return GraphByRelation(N,function(x,y) return y-x=1; end);
end);

############################################################################
##
#F  CycleGraph( <n> )
##
InstallGlobalFunction(CycleGraph,
function(N) 
  local ctgy;
  if not IsPosInt(N) then
    Error("Usage: CycleGraph( <positive-integer> )\n");
  fi;
  ctgy:=TargetGraphCategory();
  if ctgy=UndirectedGraphs  and N=2 then 
    Error("<n> must not be at 2 in CycleGraph( <n> )\n\
for GraphCategory UndirectedGraphs \n");
  fi;
  if (ctgy=OrientedGraphs or ctgy=SimpleGraphs) and N<3 then 
    Error("<n> must be at least 3 in CycleGraph( <n> )\n\
for GraphCategories OrientedGraphs and SimpleGraphs\n");
  fi;
  if (ctgy=LooplessGraphs) and N<2 then 
    Error("<n> must be at least 2 in CycleGraph( <n> )\n\
for GraphCategory LooplessGraphs\n");
  fi;
  return GraphByRelation(N,function(x,y) return y-x=1 or [x,y]=[N,1]; end);
end);

############################################################################
##
#F  CubeGraph( <n> )
##
InstallGlobalFunction(CubeGraph,
function(n) 
  local V,rel;
   if not IsPosInt(n) then 
     Error("Usage: Cube( <positive-int> )\n");
   fi;
  V:=Cartesian(List([1..n],x->[0,1]));
  rel:=function(x,y) 
     return Length(Filtered([1..n],z->x[z]<>y[z]))=1;
  end;
  return GraphByRelation(V,rel);
end);

############################################################################
##
#F  OctahedralGraph( <n> )
##
InstallGlobalFunction(OctahedralGraph,
function(n)
   if not IsInt(n) then 
     Error("Usage: Octahedron( <integer> )\n");
   fi;
   if not n>=2 then 
     Error("Usage: n must satisfy n>=2 in Octahedron( <n> )\n");
   fi;
   return CompleteMultipartiteGraph(List([1..n],x->2));
end);


############################################################################
##
#F  JohnsonGraph( <n>, <r> )
##
InstallGlobalFunction(JohnsonGraph,
function(n,r)
  local Comb,G,func;
  if not (IsInt(n) and IsInt(r)) then 
    Error("usage: JohnsonGraph( <integer>, <integer>)\n");
  elif not( n>=0) then 
    Error("'n' must be a non-negative integer in: JohnsonGraph( n, r )\n");
  elif not (r>=0 and r<=n ) then 
    Error("'r' must satisfy 0<=r<=n in: JohnsonGraph( n, r )\n");
  fi;
  Comb:=Combinations([1..n],r);
  func:=function(i,j) 
     return Length(Intersection(Comb[i],Comb[j]))=r-1;
  end;
  G:=GraphByRelation(Length(Comb),func);
  SetVertexNames(G,Comb);
  return G;
end);

############################################################################
##
#F  CompleteBipartiteGraph( <n>, <m> )
#F  CompleteMultipartiteGraph( <n1>, <n2> [, <n3> ...] )
##
InstallGlobalFunction(CompleteBipartiteGraph,
function(n,m)
  if not IsPosInt(n) or not IsPosInt(m) then 
     Error("Usage: CompleteBipartiteGraph( <positive-int>, <positive-int> )\n");
  fi;
  return CompleteMultipartiteGraph(n,m);
end);

InstallGlobalFunction(CompleteMultipartiteGraph,
function(arg)
   local L, i, part, sum, rel;
   if Length(arg)=1 and IsList(arg[1]) then
      L:=arg[1];
   else
      L:=arg;
   fi;
   if Length(L)<2 then
      Error("CompleteMultipartiteGraph needs at least two parameters\n");
   fi;
   if ForAny(L,x-> not IsPosInt(x)) then 
      Error("Each parameter for CompleteMultipartiteGraph must be a positive integer\n");
   fi;
   part:=[];sum:=0;
   for i in [1..Length(L)] do
      Append(part,List([1..L[i]],x->i));
      sum:=sum+L[i];
   od;
   rel:=function(x,y) return part[x]<> part[y]; end;
   return GraphByRelation(sum,rel);
end);

############################################################################
##
#F  RandomGraph( <n>, <p> )
##  RandomGraph( <n> )
##
InstallGlobalFunction(RandomGraph,
function(arg)
  local n,p,M,a,b,i,j,ctgy;
  if not ( (Length(arg)=1 and IsInt(arg[1])) or 
           (Length(arg)=2 and IsInt(arg[1]) and IsRat(arg[2]))  ) then 
      Error("usage: RandomGraph( <int> [, <rational> ] )\n");
  fi; 
  n:=arg[1];
  if n<1 then
     Error("'integer' must be at least 1 in RandomGraph( <int> [, <rational> ] )\n");
  fi;
  if IsBound(arg[2]) then p:=arg[2]; else p:=1/2; fi;
  if p<0 or p>1 then
     Error("'rational' must satisfy 0<=p<=1 in RandomGraph( <int> [, <rational> ] )\n");
  fi;
  ctgy:=TargetGraphCategory();
  a:=NumeratorRat(p);b:=DenominatorRat(p);
  M:=List([1..n],x->BlistList([1..n],[]));
  for i in [1..n] do
    if RandomList([1..b])<=a then
      M[i][i]:=true;
    fi;
    for j in [i+1..n] do
       if ctgy<>LooplessGraphs and ctgy<>Graphs then
         if RandomList([1..b])<=a then
           if RandomList([true,false]) then
             M[i][j]:=true;
           else
	     M[j][i]:=true;
           fi;
         fi;
       else
         if RandomList([1..b])<=a then
             M[i][j]:=true;
         fi;
         if RandomList([1..b])<=a then
	     M[j][i]:=true;
         fi;
       fi;
    od;
  od;
  return GraphByAdjMatrix(M);
end);

############################################################################
##
#F  CylinderGraph( <Base>, <Height> )
##
InstallGlobalFunction(CylinderGraph,
function(Base, Height)
  local rel,Vert;
  if not (IsInt(Base) and Base>=3) then
    Error("Base must be at least 3 in  CylinderGraph( <Base>, <Height>)\n");
  fi;
  if not (IsInt(Height) and Height>=0) then
    Error("Height must be at least 0 in  CylinderGraph( <Base>, <Height>)\n");
  fi;
  rel:=function(u,v) 
      return (u[2]  =v[2] and ((v[1]-u[1]) mod Base) in [1,-1]) or 
             (u[2]+1=v[2] and ((v[1]-u[1]) mod Base) in [0,1]); 
  end;
  Vert:=Cartesian([0..Height], [0..Base-1]);
  Vert:=List(Vert,z->[z[2],z[1]]);
  return GraphByRelation(Vert,rel);
end);


############################################################################
##
#M  WheelGraph( <n> )
#M  WheelGraph( <n>, <radius> )
##
InstallMethod(WheelGraph,"for graphs", true, [IsInt],0,
function(N) 
  if not (IsInt(N) and N>=3) then
    Error("<n> must be at least 3 in  WheelGraph( <n> )\n");
  fi;
  return Join(TrivialGraph,CycleGraph(N));
end);

InstallOtherMethod(WheelGraph,"for graphs", true, [IsInt,IsInt],0,
function(N,Radius)
  if not (N>=3 and Radius>=1)  then
    Error("<n> must be at least 3 and <radius> must be at least 1 \
in  WheelGraph( <n>, <radius> )\n");
  fi;
  return QuotientGraph(CylinderGraph(N,Radius),[[1..N]]);
end);


############################################################################
##
#F  FanGraph( <n> )
##
InstallGlobalFunction(FanGraph,
function(N) 
  if not (IsInt(N) and N>=1) then
    Error("<n> must be at least 1 in FanGraph( <n> )\n");
  fi;
  return Join(TrivialGraph,PathGraph(N+1));
end);

############################################################################
##
#F  SunGraph( <n> )
##
InstallGlobalFunction(SunGraph,
function(N) 
  local Cover,G;
  if not (IsInt(N) and N>=3) then
    Error("<n> must be at least 3 in  SunGraph( <n> )\n");
  fi;
  Cover:=[[2,4..2*N],[2*N,1]];
  Append(Cover,List([1..2*N-1],x->[x,x+1]));
  G:=GraphByCompleteCover(Cover:GraphCategory:=SimpleGraphs);
  return CopyGraph(G);
end);

############################################################################
##
#F  SpikyGraph( <n> )
##
InstallGlobalFunction(SpikyGraph,
function(N) 
  local Cover,G,Comb;
  if not (IsInt(N) and N>=3) then
    Error("<n> must be at least 3 in  SpikyGraph( <n> )\n");
  fi;
  Comb:=Combinations([1..N],N-1);
  Cover:=List([1..N],x->Union([x+N],Comb[x]));
  Add(Cover,[1..N]);
  G:=GraphByCompleteCover(Cover:GraphCategory:=SimpleGraphs);
  return CopyGraph(G);
end);

############################################################################
##
#F  TorusGraph( <n>, <m> )
##
InstallGlobalFunction(TorusGraph, 
function(n,m)   
  local V,rel;
  V:=Cartesian([1..n],[1..m]); 
  rel:=function(x,y)
    local z;
    z:=[(x[1]-y[1])*ZmodnZObj(1,n),(x[2]-y[2])*ZmodnZObj(1,m)];
    return z in  
            [[ZmodnZObj( 1, n ),ZmodnZObj(0,m)],
             [ZmodnZObj( 0, n ),ZmodnZObj(1,m)],
             [ZmodnZObj( 1, n ),ZmodnZObj(1,m)]];
  end;
  return GraphByRelation(V,rel);
end);

############################################################################
##
#M  TreeGraph( <degree>, <depth> )
#M  TreeGraph( <DegreeList> )
##
InstallOtherMethod(TreeGraph,"for graphs", true, [IsInt,IsInt],0,
function(deg,depth) 
    return TreeGraph(List([1..depth],x->deg));
end);

InstallMethod(TreeGraph,"for graphs", true, [IsList],0,
function(DL)  
    local W,V,d,rel;
    W:=[[]];
    V:=[[]];
    for d in DL do
       W:=List(Cartesian(W,[1..d]),Flat);
       Append(V,W);
    od;
    rel:=function(x,y) 
      if Length(x)= Length(y)-1 then
         return x=y{[1..Length(x)]};
      fi;
      return false;
    end;
    return GraphByRelation(V,rel);
end);

############################################################################
##
#M  RandomCirculant( <n> )
#M  RandomCirculant( <n>, <p>)
##  
InstallOtherMethod(RandomCirculant,"for graphs", true, [IsInt],0,
function(n) 
    return RandomCirculant(n,1/2);
end);

InstallMethod(RandomCirculant,"for graphs", true, [IsInt,IsRat],0,
function(n,p)     
    return Circulant(n,RandomSubset([1..Int(n/2)],p));
end);

############################################################################
##
#M  ClockworkGraph( <NNFSList> )
#M  ClockworkGraph( <NNFSList>, <rank> )
#M  ClockworkGraph( <NNFSList>, <ReturnPermutation> )
#M  ClockworkGraph( <NNFSList>, <rank>, <ReturnPermutation> )
##
InstallOtherMethod(ClockworkGraph,"for graphs", true, [IsList],0,
function(LNSL)  
    return ClockworkGraph(LNSL,2,());
end);

InstallOtherMethod(ClockworkGraph,"for graphs", true, [IsList,IsInt],0,
function(LNSL,rank)    
    return ClockworkGraph(LNSL,rank,());
end);

InstallOtherMethod(ClockworkGraph,"for graphs", true, [IsList,IsPerm],0,
function(LNSL,perm) 
    return ClockworkGraph(LNSL,2,perm);
end);

InstallMethod(ClockworkGraph,"for graphs", true, [IsList,IsInt,IsPerm],0,
function(LNSL,rank,perm) 
  local V,NumSeg,rel,seg,numv;
  if ( rank< 2 ) or (rank< LargestMovedPoint(perm))   then
      Error("<rank> must be at least 2 and <Perm> must belong to SymmetricGroup(<rank>) in ",
            "in ClockworkGraph(<NNFSList>,<rank>,<Perm>).\n");
  fi;
  if  (ForAny(LNSL,x->not IsList(x))) or ForAny(LNSL,x->ForAny(x,y->not (IsInt(y) and y>=0)))   then
      Error("NNFSList must be a list of lists of non-negative integers ",
            "in ClockworkGraph(<NNFSList>,<rank>,<Perm>).\n");
  fi; 
  if (Length(LNSL)<3) then
      Error("Number of segments (= Length(NNFSList)) must be at least 3 ", 
            "in ClockworkGraph(<NNFSList>,<rank>,<Perm>).\n");
  fi; 
  NumSeg:=Length(LNSL);
  V:=[];
  for seg in [1..NumSeg] do
    for numv in [1..rank] do
      Add(V,[2*seg-1,numv]);
    od;
    for numv in [1..Length(LNSL[seg])] do;
      Add(V,[2*seg,numv]);
    od;
  od;
  
  rel:=function(x,y)
    if y[1]>x[1] then return rel(y,x); fi; #segment(y)<=segment(x)
    if x=y then return false; fi; # no loops
    if x[1]- y[1] in [0,1] then  #core-crown edge
      return true; 
    elif x[1]=2*NumSeg and y[1]=1 then
      return true;
    fi;
    if IsEvenInt(x[1]) and IsEvenInt(y[1]) then #core-core edge
      if x[1]-y[1] = 2 then
          return LNSL[y[1]/2][y[2]]>=x[2];
      elif x[1]=2*NumSeg and y[1]=2 then
          return LNSL[x[1]/2][x[2]]>=y[2];
      fi;
    fi;
    if IsOddInt(x[1]) and IsOddInt(y[1]) then #crown-crown edge
       if x[1]-y[1]=2 then
          return x[2]=y[2];
       elif x[1]=2*NumSeg-1 and y[1]=1 then
          return x[2]^perm=y[2];
       fi;
    fi;
    return false;
  end;
  return GraphByRelation(V,rel);
end);

InstallValue(TrivialGraph,GraphByAdjMatrix([[false]]));
InstallValue(DiamondGraph,FanGraph(2));
InstallValue(ClawGraph,CompleteBipartiteGraph(1,3));
InstallValue(PawGraph,GraphByWalks([1,2,3,4,2]));
InstallValue(HouseGraph,GraphByWalks([1,2,3,4,1,5,4]));
InstallValue(BullGraph,GraphByWalks([1,2,3,4,2,4,5]));
InstallValue(AntennaGraph,GraphByWalks([1,2,3,4,1,5,4],[5,6]));
InstallValue(KiteGraph,GraphByWalks([1,2,3,4,2],[3,5,4]));
InstallValue(DartGraph,GraphByWalks([1,2,3,4,2,5,3]));
InstallValue(ChairGraph,GraphByWalks([1,2,3],[2,4,5]));
InstallValue(GemGraph,FanGraph(3));
InstallValue(AGraph,GraphByWalks([1,2,3,4,5,6],[2,5]));
InstallValue(DominoGraph,GraphByWalks([1,2,3,4,5,6,1,4]));
InstallValue(ParapluieGraph,GraphByWalks([1,2,3,[4,5,6,7]]));
InstallValue(ParachuteGraph,GraphByWalks([1,2,[3,4,5,6],7]));
InstallValue(FishGraph,GraphByWalks([1,2,3,1,4,5,6,1]));
InstallValue(RGraph,GraphByWalks([1,2,3,4,5,2,6]));
InstallValue(Tetrahedron,WheelGraph(3));
InstallValue(Octahedron,OctahedralGraph(3));
InstallValue(Cube,CubeGraph(3));
InstallValue(Icosahedron,
  GroupGraph(WheelGraph(5),
    Group([(2,3,4,5,6)(7,8,9,10,11),(1,3,10,9,6)(4,11,12,8,5)])
  )
);
InstallValue(Dodecahedron,
   GroupGraph(CycleGraph(5),
     Group([(1,2,3,4,5)(6,7,8,9,10)(11,12,13,14,15)(16,17,18,19,20),
             (1,7,3)(4,6,12)(5,11,8)(9,15,17)(10,16,13)(14,20,18)])
   )
);
InstallValue(SnubDisphenoid, GraphByWalks([1,[2,3,4,5],6],[5,[6,7,8,1],2]));
InstallValue(PetersenGraph, 
   GraphByWalks([1..5],[5,1,6,8,10,7,9,6],[2,7],[3,8],[4,9],[5,10]));

#E
