############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, D. Lopez, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.7-dev
##  Inception: 2025/Jun/09
##
##  kernel.gi contains the basic methods and 
##  data definitions to operate with graphs
##

############################################################################
##
#F  SetDefaultGraphCategory( <Catgy> );
##  
InstallGlobalFunction(SetDefaultGraphCategory,
function(Catgy)
   if not Catgy in AvailableGraphCategories then
     Error("Catgy must be a graph category in SetDefaultGraphCategory( <Catgy> )\n");
   fi;
   MakeReadWriteGlobal("DefaultGraphCategory");
   UnbindGlobal("DefaultGraphCategory");
   BindGlobal("DefaultGraphCategory",Catgy);
end);

############################################################################
##
#F  GraphCategory( [ <Graph>, ... ] );
## 
InstallGlobalFunction(GraphCategory,
function(arg)
    local ctgy,ctgs;
    if Length(arg)=0 then 
        return DefaultGraphCategory; 
    fi;
    if Length(arg)=1 and IsList(arg[1]) then
       arg:=arg[1];
    fi;
    arg:=Compacted(arg);
    ctgs:=List(arg,x->CategoriesOfObject(x));
    ctgs:=Intersection(ctgs); 
    ctgy:= First(AvailableGraphCategories,x-> NamesFilter(x)[1] in ctgs);
    return ctgy;
end);

############################################################################
##
#F  TargetGraphCategory( [ <Graph>, ... ] );
##  
InstallGlobalFunction(TargetGraphCategory,
function(arg) 
    local ctgy;
    ctgy:=ValueOption("GraphCategory");
    if ctgy in AvailableGraphCategories then 
        return ctgy; 
    fi;
    return CallFuncList(GraphCategory,arg);
end);

############################################################################
##
#M  PrintObj( <G> )
##   
InstallMethod(PrintObj,"for graphs",true,[Graphs],0,
function(G)
  Print("Graph( rec( Category := ", NamesFilter(GraphCategory(G))[1] ); 
  Print(", Order := ",Order(G),", Size := ",Size(G));
  Print(", Adjacencies := ");
  Print(Adjacencies(G));
  Print(" ) )");
end);

############################################################################
##
#M  ViewObj( <G> )
##   
InstallMethod(ViewObj,"for graphs",true,[Graphs],0,
function(G)
  Print("Graph( rec( Category := ", NamesFilter(GraphCategory(G))[1] ); 
  Print(", Order := ",Order(G),", Size := ",Size(G));
  Print(", Adjacencies := ");
  Print(Adjacencies(G));
  Print(" ) )");
end);

############################################################################
##
#M  DumpObject( <Obj> )
##   
InstallMethod(DumpObject,"for graphs",true,[Graphs],0,
function(Obj)
  local x,Attr,Prop,TrueProp;
  Print("Graph( rec( ");
    Attr:=KnownAttributesOfObject(Obj);
    Prop:=KnownPropertiesOfObject(Obj);
  Print(" Categories := ", CategoriesOfObject(Obj));
  for x in [1..Length(Attr)] do 
    Print(", ");
    Print(Attr[x]," := ",ValueGlobal(Attr[x])(Obj));
  od;
  for x in [1..Length(Prop)] do 
    Print(", ");
    Print(Prop[x]," := ",ValueGlobal(Prop[x])(Obj));
  od;
  Print(" ) )\n");
end);


############################################################################
##
#M  IsInternallyConsistent( <G> )   ...  For Debugging
##   
InstallMethod(IsInternallyConsistent,"for graphs",true,[Graphs],0,
function(G)
   return HasAdjacencies(G) or HasAdjMatrix(G); 
   #FIXME: or HasIsEdge(G,i,j);
end);

############################################################################
##
#M  Order( <G> )
##
InstallMethod(Order,"for graphs",true,[Graphs],0,
function(G)
  if HasAdjacencies(G) then 
     return Length(Adjacencies(G));
  elif HasAdjMatrix(G) then 
     return Length(AdjMatrix(G));
  else
    Info(InfoWarning,1,"Graph <G> is not fully specified in Order( <G> ).");
    return fail;
  fi;
end);

############################################################################
##
#M  Size( <G> )
##
InstallMethod(Size,"for graphs",true,[Graphs],0,
function(G)
  local m,l,i;
  if HasAdjacencies(G) then
    m:=Sum(List(Adjacencies(G),Length));
  elif HasAdjMatrix(G) then 
    m:=Sum(List(AdjMatrix(G),SizeBlist));
  else
    m:=Sum(List(Adjacencies(G),Length));
  fi;
  l:=0;
  for i in [1..Order(G)] do
      if IsEdge(G,i,i) then 
         l:=l+1;
      fi;
  od;
  if not G in UndirectedGraphs then
      return (m); #total number of arrows
  else 
      return ((m-l)/2 + l); #total edges, works fine for graphs with and without loops.
  fi;
end);

############################################################################
##
#M  VertexNames( <G> )
## 
InstallMethod(VertexNames,"for graphs", true, [Graphs],0,
function(G)
   return [1..Order(G)];
end);


############################################################################
##
#M  IsCompleteGraph( <G>, <qtfy> )
##
InstallMethod(IsCompleteGraph,"for graphs", true, [Graphs,IsBool],0,
  function(G, qtfy)
    local MaxSize,n;
    n:=Order(G);
    if G in SimpleGraphs or G in OrientedGraphs then
       MaxSize:=n*(n-1)/2;
    elif G in LooplessGraphs then
       MaxSize:=n^2-n;
    elif G in UndirectedGraphs then
       MaxSize:=n*(n-1)/2+n;
    else
       MaxSize:=n^2;
    fi;
    if qtfy then
       return MaxSize-Size(G);
    else
       return MaxSize=Size(G);
    fi;
end);


############################################################################
##
#M  IsLoopless( <G>, <qtfy> )
##
InstallMethod(IsLoopless,"for graphs",true,[Graphs,IsBool],0,
function(G,qtfy)
  local i,count;
  if G in LooplessGraphs then
    if qtfy then 
       return 0; 
    else 
       return true; 
    fi;
  fi;
  count:=0;
  for i in [1..Order(G)] do
     if IsEdge(G,i,i) then
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
#M  IsUndirected( <G>, <qtfy> ) 
##
InstallMethod(IsUndirected,"for graphs",true,[Graphs,IsBool],0,
function(G,qtfy)
  local i,j,count;
  if G in UndirectedGraphs then
    if qtfy then 
       return 0; 
    else 
       return true; 
    fi;
  fi;
  count:=0;
  for i in [1..Order(G)] do
    for j in [i+1..Order(G)] do
       if IsEdge(G,i,j)<>IsEdge(G,j,i) then
         if qtfy then 
           count:=count+1;
         else
           return false;
         fi;
       fi;
    od;
  od;
  if qtfy then
    return count;
  else
    return true; 
  fi;
end);

############################################################################
##
#M  IsOriented( <G>, <qtfy> )
##
InstallMethod(IsOriented,"for graphs",true,[Graphs,IsBool],0,
function(G,qtfy)
  local i,j,count;
  if G in OrientedGraphs then
    if qtfy then 
       return 0; 
    else 
       return true; 
    fi;
  fi;
  count:=0;
  for i in [1..Order(G)] do
    for j in [i..Order(G)] do
       if IsEdge(G,i,j) and IsEdge(G,j,i) then
         if qtfy then 
           count:=count+1;
         else
           return false;
         fi;
       fi;
    od;
  od;
  if qtfy then
    return count;
  else
    return true; 
  fi;
end);

############################################################################
##
#M  IsSimple( <G> )
#M  QtfyIsSimple( <G> )
##
InstallOtherMethod(IsSimple,"for graphs",true,[Graphs],0,
function(G)
  return( IsLoopless(G) and IsUndirected(G) );
end);
InstallMethod(QtfyIsSimple,"for graphs",true,[Graphs],0,
function(G)
  return( QtfyIsLoopless(G) + QtfyIsUndirected(G) );
end);


############################################################################
##
#M  IsComplete( <G>, <L> )
##
InstallMethod(IsComplete,"for graph",true, [Graphs,IsList],0,
function(G,L)
    local MaxSize,IndSize,n,L0;
    L0:=Set(L);
    if not IsSubset(Vertices(G),L0) then
       Error("L must be a subset of Vertices(G) in IsComplete( <G>, <L> )\n");
    fi;
    n:=Length(L0);
    if G in OrientedGraphs then
       MaxSize:=n*(n-1)/2;
    elif G in LooplessGraphs or G in SimpleGraphs then
       MaxSize:=n^2-n;
    else # Graphs and UndirectedGraphs
       MaxSize:=n^2;
    fi;
    IndSize:=Sum(List(L0,x->Length(Intersection(Adjacencies(G)[x],L0))));
    return MaxSize=IndSize;
end);

############################################################################
##
#M  Vertices( <G> )
##
InstallMethod(Vertices,"for graphs", true,[Graphs],0,
function(G)
    return [1..Order(G)];
end);

############################################################################
##
#M  IsEdge( <G>, <x>, <y>)
#M  IsEdge( <G>, <e> )
InstallMethod(IsEdge,"for graphs", true,[Graphs,IsInt,IsInt],0,
function(G,x,y)
   if HasAdjMatrix(G) then 
      return AdjMatrix(G)[x][y];
   elif HasAdjacencies(G) then 
      return y in Adjacencies(G)[x];
   else
      Info(InfoWarning,1,"Graph <G> is not fully specified in IsEdge( <G>, <x>, <y> ).");
      return fail;
   fi;
end);

InstallOtherMethod(IsEdge,"for graphs", true,[Graphs,IsList],0,
function(G,e)
    if Length(e)<>2 then
       return false;
    fi;
    if IsSubset(Vertices(G),e) then
      return IsEdge(G,e[1],e[2]);
    fi;
    return false;
end);

############################################################################
##
#M  Adjacency( <G>, <x> )
##
InstallMethod(Adjacency,"for graphs", true, [Graphs,IsInt],0,
function(G,x)
  if not x in [1..Order(G)] then 
     Error("usage: Adjacency( <graph>, <vertex> )\n");
  fi;
  if HasAdjacencies(G) then
    return Adjacencies(G)[x];
  elif HasAdjMatrix(G) then 
    return ListBlist(Vertices(G),AdjMatrix(G)[x]);
  else
    return List(Vertices(G),x->Filtered(Vertices(G),y->IsEdge(G,x,y)));
  fi;
end);

############################################################################
##
#M  AdjMatrix( <G> )
##
InstallMethod(AdjMatrix,"for graphs", true, [Graphs],0,
function(G)
  if HasAdjacencies(G) then 
    return List(Vertices(G),x->BlistList(Vertices(G),Adjacencies(G)[x]));
  else
   return List(Vertices(G),x->List(Vertices(G),y->IsEdge(G,x,y)));
  fi;
end);

############################################################################
##
#M  Adjacencies( <G> )
##
InstallMethod(Adjacencies,"for graphs", true, [Graphs],0,
function(G)
   if HasAdjMatrix(G) then 
     return List(AdjMatrix(G),row->ListBlist(Vertices(G),row));
   elif Order(G)>=1 and IsEdge(G,1,1)<> fail then 
     return List(Vertices(G),x->Filtered(Vertices(G),y->IsEdge(G,x,y)));
   fi;
end);

############################################################################
##
#M  VertexDegree( <G>, <x> )
##
InstallMethod(VertexDegree,"for graphs", true, [Graphs,IsInt],0,
function(G,x)
  if not x in Vertices(G) then 
     Error("usage: VertexDegree( <graph>, <vertex> )\n");
  fi;
  if HasVertexDegrees(G) then
     return VertexDegrees(G)[x];
  elif HasAdjacencies(G) then 
     return Length(Adjacencies(G)[x]);
  elif HasAdjMatrix(G) then 
     return SizeBlist(AdjMatrix(G)[x]);
  else
     return Length(Filtered(Vertices(G),y->IsEdge(G,x,y)));
  fi;
end);

############################################################################
##
#M  VertexDegrees( <G> )
##
InstallMethod(VertexDegrees,"for graphs", true, [Graphs],0,
function(G)
  return List(Vertices(G),x->VertexDegree(G,x));
end);

############################################################################
##
#M  MaxDegree( <G> )
##
InstallMethod(MaxDegree,"for graphs", true, [Graphs],0,
function(G)
  if Order(G)=0 then return 0; fi;
  return Maximum(VertexDegrees(G));
end);

############################################################################
##
#M  MinDegree( <G> )
##
InstallMethod(MinDegree,"for graphs", true, [Graphs],0,
function(G)
  if Order(G)=0 then return 0; fi;
  return Minimum(VertexDegrees(G));
end);

############################################################################
##
#M  Edges( <G> )
##
InstallMethod(Edges,"for graphs", true, [Graphs],0,
function(G)
 local Edg,i,j,Adj;
 Edg:=[];
 Adj:=Adjacencies(G);
 if G in UndirectedGraphs then
    for i in [1..Order(G)] do 
       for j in Adj[i] do
          if j>=i then Add(Edg,[i,j]); fi; 
       od; 
    od;  
 else 
    for i in [1..Order(G)] do 
       for j in Adj[i] do
          AddSet(Edg,[i,j]);
       od; 
    od;  
 fi;
 return Edg;
end);

############################################################################
##
#M  Graph( <Rec> )
##
##  FIXME: read and set the additional data present in Rec.
##
InstallMethod(Graph,"for graphs",true,[IsRecord],0,
function(Rec)
   local ctgy;
   if not (IsBound(Rec.Adjacencies) or IsBound(Rec.AdjMatrix)) then
     Error("either Rec.Adjacencies or Rec.AdjMatrix must be bound in Graph( <Rec> )\n"); 
   fi;
   if not (IsBound(Rec.Category) or IsBound(Rec.Categories))then
     Error("either Rec.Category or Rec.Categories must be bound in Graph( <Rec> )\n"); 
   fi;
   if IsBound(Rec.Category) then
      ctgy:=Rec.Category;
   else
      ctgy:=First(AvailableGraphCategories,x->NamesFilter(x)[1] in Rec.Categories);
   fi; 
   if not (ctgy in AvailableGraphCategories) then 
       Error("invalid Graph Category in  Graph( <Rec> )\n");
   fi;
   if IsBound(Rec.Adjacencies) then 
      return GraphByAdjacencies(Rec.Adjacencies: GraphCategory:=ctgy);
   else
      return GraphByAdjMatrix(Rec.AdjMatrix: GraphCategory:=ctgy);
   fi;
end);

############################################################################
##
#F  GraphByAdjMatrix( <M> )
##
InstallGlobalFunction(GraphByAdjMatrix,
function(M) 
  local i,j,n,x,G; 
  if not IsList(M) then
    Error("usage: GraphByAdjMatrix( < List > )\n");
  fi;
  n:=Length(M);
  for x in M do
     if not (IsList(x) and Length(x)= n and IsBlist(x)) then
       Error("'AdjMatrix' must be a square Boolean matrix in GraphByAdjMatrix( <AdjMatrix> )\n"); 
     fi;
  od;   
  G:=Objectify(GraphType,rec());
  SetFilterObj(G,TargetGraphCategory());
  for i in [1..n] do
    if G in LooplessGraphs then
       M[i][i]:=false;
    fi;
    for j in [i+1..n] do
       if G in UndirectedGraphs then
          M[i][j]:=M[i][j] or M[j][i];
          M[j][i]:=M[i][j];
       elif G in OrientedGraphs then
          M[j][i]:=M[j][i] and not M[i][j]; 
       else
       fi;
    od;
  od;
  MakeImmutable(M);
  SetAdjMatrix(G,M);
  return(G);
end
);

############################################################################
##
#F  GraphByAdjacencies( <Adj> )
##
InstallGlobalFunction(GraphByAdjacencies,
function(Adj) 
  local n,i,j,G;
  if not IsList(Adj) then
     Error("usage: GraphByAdjacencies( <adjacency list> )\n");
  fi;
  #FIXME: Accept immutable Adj. Make a copy only if necessary. 
  #FIXME: Enter double for loop only if necessary.
  G:=Objectify(GraphType,rec());
  SetFilterObj(G,TargetGraphCategory());
  n:=Maximum(Union(Flat(Adj),[Length(Adj)]));
  for i in [1..n] do
    if not IsBound(Adj[i]) then Adj[i]:=[]; fi;
    if G in LooplessGraphs then
       RemoveSet(Adj[i],i);
    fi;
  od;
  for i in [1..n] do
    for j in Adj[i] do
       if G in UndirectedGraphs then
           AddSet(Adj[j],i); 
       elif G in OrientedGraphs and j>i then
           RemoveSet(Adj[j],i); 
       fi;
    od;
  od;
  MakeImmutable(Adj);
  SetAdjacencies(G,Adj);
  return(G);
end
);

############################################################################
##
#F  GraphByCompleteCover( <Cover> )
##
InstallGlobalFunction(GraphByCompleteCover,
function(Cover) 
  local Adj,N,x,i,j,complete;
    if not IsList(Cover) or ForAny(Cover,x-> not IsList(x)) then
        Error("usage: CompCoverGraph( <complete cover> )\n");
    fi;
    if Flat(Cover)=[] then 
      N:=0; 
    else
      N:=Maximum(List(Cover,Maximum));
    fi;
    Adj:=List([1..N],x->[]); 
    for complete in Cover do
      for x in complete do
         UniteSet(Adj[x],complete);
      od;
    od;
  return(GraphByAdjacencies(Adj));
end);

############################################################################
##
#F  GraphByRelation( <V>, <rel> )
#F  GraphByRelation( <n>, <rel> )
##
InstallGlobalFunction(GraphByRelation,
function(V,rel) 
   local Adj,N,G,setnames;
   if (IsInt(V) and V<0) or ((not IsList(V) and not IsInt(V)) or (not IsFunction(rel)) ) then 
      Error("usage: GraphByRelation( <vertex-set or non-negative-integer>, <function> )\n");
   fi;
   setnames:=true;
   if IsInt(V) then V:=[1..V];setnames:=false; fi;
   N:=Length(V);
   Adj:=List([1..N],x->Filtered([1..N],y->rel(V[x],V[y]))); 
   G:=GraphByAdjacencies(Adj);
   if setnames then SetVertexNames(G,V); fi;
   return(G);
end);

############################################################################
##
#F  GraphByWalks( <Walk1>, <Walk2>,... )
##
InstallGlobalFunction(GraphByWalks,
function(arg)
  local i,j,w,u,v,x,y,Adj,V,N;
  V:=Set(Flat(arg));
  if not IsListOfPositiveIntegers(V) then 
     Error("Usage: GraphByWalks( <Walk1>, <Walk2>,... )\n");
  fi; 
  if V=[] then return EmptyGraph; fi;
  N:=Maximum(V);
  Adj:=List([1..N],z->[]);
  for w in arg do
    if w=[] then continue; fi;
    for i in [1..Length(w)] do
      if not IsBound(w[i]) then continue; fi;
      if IsListOfPositiveIntegers(w[i]) then
        for j in [1..Length(w[i])-1] do 
          if not (IsBound(w[i][j]) and IsBound(w[i][j+1])) then continue; fi;
          AddSet(Adj[w[i][j]],w[i][j+1]);
        od;
      fi;
      if i=Length(w) then continue; fi;
      if not IsBound(w[i+1]) then continue; fi;
      u:=w[i];v:=w[i+1];
      if IsInt(u) then u:=[u]; fi;
      if IsInt(v) then v:=[v]; fi;
      for x in u do 
        UniteSet(Adj[x],v);
      od;
    od;
  od;
  return GraphByAdjacencies(Adj);
end);

############################################################################
##
#F  GraphByEdges( <L> )
##
InstallGlobalFunction(GraphByEdges,
function(L) 
  local e,N,Adj;
  if Flat(L)=[] then 
    N:=0;
  else
    N:=Maximum(Set(Flat(L)));
  fi;
  Adj:=List([1..N],z->[]);
  for e in L do 
    AddSet(Adj[e[1]],e[2]);
  od; 
  return GraphByAdjacencies(Adj);
end);

############################################################################
##
#F  IntersectionGraph( <L> )
##
InstallGlobalFunction(IntersectionGraph,
#FIXME: speedup by using the elements in Flat(L)?                      
function(L)
   local func,G;
   if not IsList(L) or ForAny(L,x-> not IsList(x)) then 
      Error("usage: IntersectionGraph( <List> )\n");
   fi;
   func:=function(x,y)
      if Length(x)< Length(y) then
          return ( First(x,z-> z in y)<> fail ); 
      else
          return ( First(y,z-> z in x)<> fail );
      fi;
   end;
   G:=GraphByRelation(L,func);
   return(G);
end);

###################################
##  New graphs from old graphs:  ##
###################################


############################################################################
##
#M  CopyGraph( <G> ) 
##
InstallMethod(CopyGraph,"for graphs", true,[Graphs],0,
function(G) 
   local Adj,G1;
   Adj:=List(Adjacencies(G),ShallowCopy);
   G1:=GraphByAdjacencies(Adj);
   CopyCoordinates(G1,G);
   return G1;
end);

############################################################################
##
#M  InducedSubgraph( <G>, <V> )
##
InstallMethod(InducedSubgraph,"for graphs",true,[Graphs,IsList],0,
function(G,V)
  local G1;
    if not IsSubset([1..Order(G)],V) or  Length(V)<> Length(Set(V)) then 
      Error("'V' must be a list of elements of \n [1..Order(G)], without repeated elements, in \nInducedSubgraph( <G>, <V> )\n");
  fi;
  G1:=GraphByRelation(V,function(x,y) return IsEdge(G,x,y); end
           :GraphCategory:=TargetGraphCategory(G));
  G1!.ParentGraph:=G;
  SetVertexNames(G1,V);
  CopyCoordinates(G1,G,V);
  return G1;
end);

############################################################################
##
#M  AddVerticesByAdjacencies( <G>, <NewAdjList> )
##
InstallMethod(AddVerticesByAdjacencies,"for graphs",true,[Graphs,IsList],0,
function(G,L) 
    local new,G1,coords,newcoords,numnew,vec,veccoord,numvec,z;
    numnew:=Length(L);
    if numnew=0 then return G; fi;
    new:=[1..numnew];
    G1:=DisjointUnion(G,DiscreteGraph(Length(L)));
    G1:=AddEdges(G1,Union(List(new,z->Cartesian([z+Order(G)],L[z]))));;
    CopyCoordinates(G1,G,Concatenation(Vertices(G),L));
    return G1;
end);

############################################################################
##
#M  RemoveVertices( <G>, <V> )
##
InstallMethod(RemoveVertices,"for graphs", true, [Graphs,IsList],0,
function(G,V)
   if not IsSubset([1..Order(G)],V) then
     Error("'vertex-list' must be a list of vertices of graph in \n\
RemoveVertices( <graph>, <vertex-list> )\n"); 
   fi;
   return InducedSubgraph(G,Difference([1..Order(G)],V));
end);

############################################################################
##
#M  AddEdges( <G>, <Edgs> )
##
InstallMethod(AddEdges,"for graphs", true, [Graphs,IsList],0,
function(G,Edgs)
   local Adj,e,n,G1,coords;
   if(Length(Edgs)=2 and IsInt(Edgs[1]) and IsInt(Edgs[2])) then 
      Edgs:=[Edgs];
   fi;
   n:=Order(G);
   Adj:=List(Adjacencies(G),ShallowCopy);
   for e in Edgs do 
      if IsList(e) and Length(e)=2 and 
         e[1] in [1..n] and e[2] in [1..n] then
            AddSet(Adj[e[1]],e[2]);
            if TargetGraphCategory(G)=OrientedGraphs  then
               RemoveSet(Adj[e[2]],e[1]);
            fi;
      fi;
   od; 
   G1:=GraphByAdjacencies(Adj:GraphCategory:=TargetGraphCategory(G));
   CopyCoordinates(G1,G);
   return G1;
end);

############################################################################
##
#M  RemoveEdges( <G>, <Edgs> )
##
InstallMethod(RemoveEdges,"for graphs", true, [Graphs,IsList],0,
function(G,Edgs)
   local Adj,e,n,G1,coords;
   if(Length(Edgs)=2 and IsInt(Edgs[1]) and IsInt(Edgs[2])) then 
      Edgs:=[Edgs];
   fi;
   n:=Order(G);
   Adj:=List(Adjacencies(G),ShallowCopy); 
   for e in Edgs do
      if IsList(e) and Length(e)=2 and
         e[1] in [1..n] and e[2] in [1..n] then
            RemoveSet(Adj[e[1]],e[2]);
            if TargetGraphCategory(G) in [UndirectedGraphs,SimpleGraphs] then
               RemoveSet(Adj[e[2]],e[1]);
            fi;
      fi;
   od;
   G1:=GraphByAdjacencies(Adj:GraphCategory:=TargetGraphCategory(G));
   CopyCoordinates(G1,G);
   return G1;
end);

############################################################################
##
#M  ConnectedComponents( <G> )
##
InstallMethod(ConnectedComponents,"for graphs", true, [Graphs],0,
function(G) 
  local x,e,rep,L,CC;
  L:=[];
  for e in Edges(G) do 
    UFUnite(L,e[1],e[2]);
  od;
  CC:=[];
  for x in [1..Order(G)] do
    rep:=UFFind(L,x);
    if(not IsBound(CC[rep])) then CC[rep]:=[];fi;
    UniteSet(CC[rep],[x]);
  od;
  return Filtered(CC,x->true); #eliminate holes in list;
end);

############################################################################
##
#M  NumberOfConnectedComponents( <G> )
##
InstallMethod(NumberOfConnectedComponents,"for graphs", true, [Graphs],0,
function(G) 
   return Length(ConnectedComponents(G)); 
end);

############################################################################
##
#M  SpanningForestEdges( <G> )
##
InstallMethod(SpanningForestEdges,"for graphs", true, [Graphs],0,
function(G)
  local e,L,UFS;
  L:=[];UFS:=[];
  for e in Edges(G) do 
     if UFFind(UFS,e[1])<>UFFind(UFS,e[2]) then 
        UFUnite(UFS,e[1],e[2]);
        Add(L,e);
     fi;
  od;
  return L;
end);

############################################################################
##
#M  SpanningForest( <G> )
##
InstallMethod(SpanningForest,"for graphs", true, [Graphs],0,
function(G) 
   local G1;
   G1:=AddEdges(DiscreteGraph(Order(G)),SpanningForestEdges(G)); 
   CopyCoordinates(G1,G);
   return G1;
end);

############################################################################
##
#M  DFSTree( <G> )
#M  DFSTree( <G>, <root> )
##
InstallMethod(DFSTree,"for graphs", [UndirectedGraphs],function(G) 
  return DFSTree(G,1);
end);
InstallOtherMethod(DFSTree,"for graphs", [UndirectedGraphs,IsPosInt],
function(G,x)  
   local DFS,used,arrs,G1;
   if NumberOfConnectedComponents(G)<> 1 then return fail; fi;
   if not x in Vertices(G) then return fail; fi;
   G1:=CompleteGraph(1:GraphCategory:=OrientedGraphs);#preferred category
   DFS:=function(G,x,used,arrs) 
      local y;
      for y in Adjacency(G,x) do
        if y in used then continue; fi;
        AddSet(used,y);
        Add(arrs,[x,y]);
        DFS(G,y,used,arrs);
      od;
    return arrs;
   end;
   G1:=GraphByEdges(DFS(G,x,[x],[]):GraphCategory:=TargetGraphCategory(G1));
   CopyCoordinates(G1,G);
   return G1;
end);

############################################################################
##
#M  Link( <G>, <x> )
##
InstallMethod(Link,"for graphs", true, [Graphs,IsInt],0,
function(G,x)
  return InducedSubgraph(G,Adjacency(G,x));
end);

############################################################################
##
#M  Links( <G> )
##
InstallMethod(Links,"for graphs", true, [Graphs],0,
function(G)
  return List([1..Order(G)],x->Link(G,x));
end);

############################################################################
##
#M  DominatedVertices( <G> )
##
InstallMethod(DominatedVertices,"for graphs", true, [Graphs],0,
function(G) 
  local G1,D,E,V,x,y,Adj;
  D:=[];
  Adj:=Adjacencies(G);
  for x in Vertices(G) do
    if x in D then continue; fi;
    E:=Filtered(Adj[x],z-> z>x and not z in D);
    for y in E do
      if First(Adj[y],z-> z<>x and not z in Adj[x])=fail then AddSet(D,y);
      elif First(Adj[x],z-> z<>y and not z in Adj[y])=fail then AddSet(D,x);
      fi;
    od;
  od;
  return D;
end);

############################################################################
##
#F  GraphAttributeStatistics( <OrderList>, <ProbList>, <Attribute> )
##
InstallGlobalFunction(GraphAttributeStatistics,
function(N,P,prop)
   local L;
   if IsFloat(P) then P:=Rat(P); fi;
   if IsList(P) and ForAll(P,x-> IsFloat(x) or IsRat(x) ) then 
      P:=List(P,function(x) if IsRat(x) then return x; else return Rat(x); fi; end); 
   fi;
   if not (IsPosInt(N) or (IsList(N) and ForAll(N,IsPosInt))) then
     Error("<OrderList> must be a positive integer or a list of positive integers in \
GraphAttributeStatistics( <OrderList>, <ProbList>, <Attribute> ).\n");
   fi;
   if not ( (IsRat(P) and 0<=P and P<=1) or 
            (IsList(P) and ForAll(P,x-> IsRat(x) and 0<=x and x<=1 )) ) then 
     Error("<ProbList> must be a rational or a list of rationals between 0 and 1 in \
GraphAttributeStatistics( <OrderList>, <ProbList>, <Attribute> ).\n");
   fi;
   if not IsFunction(prop) then 
     Error("<Attribute> must be a function evaluable on graphs in \
GraphAttributeStatistics( <OrderList>, <ProbList>, <Attribute> ).\n");
   fi;
   if IsList(N) then 
     return List(N,n->GraphAttributeStatistics(n,P,prop));
   fi;
   if IsList(P) then 
     return List(P,p->GraphAttributeStatistics(N,p,prop));
   fi;
   L:=List([1..100],x->prop(RandomGraph(N,P)));
   if IsBlist(L) then 
     return SizeBlist(L);
   fi;
   return Collected(L);
end);

#E
