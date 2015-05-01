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
##  kernel.gi contains the basic methods and 
##  data definitions to operate with graphs
##


#########################
##  Basic Operations:  ##
#########################

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
#F  GraphCategory( [, <Graph>, ... ] );
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
#F  TargetGraphCategory( [, <Graph>, ... ] );
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
  Print("Graph( Category := ", NamesFilter(GraphCategory(G))[1] ); 
  Print(", Order := ",Order(G),", Size := ",Size(G));
  Print(", Adjacencies := ");
  Print(Adjacencies(G));
  Print(" )");
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
   return true; #FIXME: Check something!
end);


##################################
##  Attributes and Properties:  ##
##################################


############################################################################
##
#M  Order( <G> )
##
InstallMethod(Order,"for graphs",true,[Graphs],0,
function(G)
  return(Length(AdjMatrix(G)));
end);

############################################################################
##
#M  Size( <G> )
##
InstallMethod(Size,"for graphs",true,[Graphs],0,
function(G)
  local m,l,i;
  m:=Sum(List(AdjMatrix(G),SizeBlist));
  l:=0;
  for i in [1..Order(G)] do
      if AdjMatrix(G)[i][i] then 
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
     if AdjMatrix(G)[i][i] then
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
       if AdjMatrix(G)[i][j]<>AdjMatrix(G)[j][i] then
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
       if AdjMatrix(G)[i][j] and AdjMatrix(G)[j][i] then
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


##############################
##  Get Info about graphs:  ##
##############################


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
    IndSize:=Sum(List(L0,x->SizeBlist(AdjMatrix(G)[x]{L0})));
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
#M  IsEdge( <G>, <e> )
##
InstallMethod(IsEdge,"for graphs", true,[Graphs,IsList],0,
function(G,e)
    if Length(e)<>2 then
       return false;
    fi;
    if IsSubset(Vertices(G),e) then
      return AdjMatrix(G)[e[1]][e[2]];
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
  return ListBlist([1..Order(G)],AdjMatrix(G)[x]);
end);

############################################################################
##
#M  Adjacencies( <G> )
##
InstallMethod(Adjacencies,"for graphs", true, [Graphs],0,
function(G)
   return List(AdjMatrix(G),x->ListBlist([1..Order(G)],x));
end);

############################################################################
##
#M  VertexDegree( <G>, <x> )
##
InstallMethod(VertexDegree,"for graphs", true, [Graphs,IsInt],0,
function(G,x)
  if not x in [1..Order(G)] then 
     Error("usage: VertexDegree( <graph>, <vertex> )\n");
  fi;
  if HasVertexDegrees(G) then
     return VertexDegrees(G)[x];
  else
     return SizeBlist(AdjMatrix(G)[x]);
  fi;
end);

############################################################################
##
#M  VertexDegrees( <G> )
##
InstallMethod(VertexDegrees,"for graphs", true, [Graphs],0,
function(G)
  return List(AdjMatrix(G),SizeBlist);
end);

############################################################################
##
#M  MaxDegree( <G> )
##
InstallMethod(MaxDegree,"for graphs", true, [Graphs],0,
function(G)
  return Maximum(VertexDegrees(G));
end);

############################################################################
##
#M  MinDegree( <G> )
##
InstallMethod(MinDegree,"for graphs", true, [Graphs],0,
function(G)
  return Minimum(VertexDegrees(G));
end);

############################################################################
##
#M  Edges( <G> )
##
InstallMethod(Edges,"for graphs", true, [Graphs],0,
function(G)
 local Edg,i,j,M;
 M:=AdjMatrix(G);
 Edg:=[];
 if G in UndirectedGraphs then
    for i in [1..Order(G)] do 
       for j in [i..Order(G)] do
          if M[i][j] then Add(Edg,[i,j]); fi;
       od; 
    od;  
 else 
    for i in [1..Order(G)] do 
       for j in [1..Order(G)] do
          if M[i][j] then Add(Edg,[i,j]); fi;
       od; 
    od;  
 fi;
 return Edg;
end);

###################################  
##  Functions to create graphs:  ##
###################################

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
  #FIXME: to copy M or not to copy M?
  #FIXME: Currently M is modified!
  n:=Length(M);
  for x in M do
     if not (IsList(x) and Length(x)= n and IsBlist(x)) then
       Error("'AdjMatrix' must be a square Boolean Matrix in GraphByAdjMatrix( <AdjMatrix> )\n"); 
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
  local M;
  if not IsList(Adj) then
        Error("usage: GraphByAdjacencies( <adjacency list> )\n");
    fi;
    M:=List(Adj,x-> BlistList([1..Length(Adj)],x));
    return(GraphByAdjMatrix(M));
end
);

############################################################################
##
#F  GraphByCompleteCover( <Cover> )
##
InstallGlobalFunction(GraphByCompleteCover,
function(Cover) 
  local M,N,len,i,j,complete;
    if not IsList(Cover) or ForAny(Cover,x-> not IsList(x)) then
        Error("usage: CompCoverGraph( <complete cover> )\n");
    fi;
    N:=Maximum(List(Cover,Maximum));
    M:=List([1..N],x->BlistList([1..N],[]));
    for complete in Cover do
      len:=Length(complete);
      for i in [1..len] do
        M[complete[i]][complete[i]]:=true;
        for j in [i+1..len]do
          M[complete[i]][complete[j]]:=true;
          M[complete[j]][complete[i]]:=true;
        od;
      od;
    od;
  return(GraphByAdjMatrix(M));
end);

############################################################################
##
#F  GraphByRelation( <V>, <rel> )
#F  GraphByRelation( <N>, <rel> )
##
InstallGlobalFunction(GraphByRelation,
function(V,rel) 
   local M,i,j,G,setnames;
   if not (IsFunction(rel) and (IsPosInt(V) or  (IsList(V) and not IsEmpty(V))))then
         Error("usage: GraphByRelation( <vertex-set or positive-integer>, <function> )\n");
   fi;
   setnames:=true;
   if IsInt(V) then V:=[1..V];setnames:=false; fi;
   M:=List(V,x->BlistList(V,[]));
   for i in [1..Length(V)] do
     for j in [1..Length(V)] do
       M[i][j]:=rel(V[i],V[j]);
     od;
   od;
   G:=GraphByAdjMatrix(M);
   if setnames then SetVertexNames(G,V); fi;
   return(G);
end);

############################################################################
##
#F  GraphByWalks( <walk1>, <walk2>,... )
##
InstallGlobalFunction(GraphByWalks,
function(arg) 
  local i,Vertices,Arrows,rel,interpret;
    interpret:=function(list) #FIXME: write this better, more readable.
    local n;
    if not IsList(list) then return [list]; fi;
    n:=Length(list);
    if n=0 then return []; fi;
    if n=1 then return interpret(list[1]); fi;
    if n=2 then return
      Union(
        [interpret(list[1]),
         interpret(list[2]),
         Cartesian(Flat([list[1]]),Flat([list[2]]))]
      );
    fi;

    return Union(
      interpret(  [list[1],list[2]]  ),
      interpret( list{[2..Length(list)]}));
    end;
    # end interpret
  rel:=function(x,y) return [x,y] in Arrows; end;
  Vertices:=[1..Maximum(Set(Flat(arg)))];
  Arrows:=[];
  for i in arg do
    UniteSet(Arrows,interpret(i));
  od;
  Arrows:=Set(Arrows);
  return GraphByRelation(Vertices,rel);
end); 

############################################################################
##
#F  GraphByEdges( <L> )
##
InstallGlobalFunction(GraphByEdges,
function(L) 
  local rel, Vertices;
  rel:=function(x,y) return [x,y] in L; end;
  Vertices:=[1..Maximum(Set(Flat(L)))];
  return GraphByRelation(Vertices,rel);
end);

############################################################################
##
#F  IntersectionGraph( <L> )
##
InstallGlobalFunction(IntersectionGraph,
function(L)
   local func,G;
   if not IsList(L) or ForAny(L,x-> not IsList(x)) then 
      Error("usage: IntersectionGraph( <List> )\n");
   fi;
   func:=function(x,y)
      return ( Intersection(x,y)<>[]); 
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
   local M,G1,coords;
   M:=List(AdjMatrix(G),ShallowCopy); #FIXME DeepCopy?
   G1:=GraphByAdjMatrix(M);
   coords:=Coordinates(G);
   if coords<> fail then SetCoordinates(G1,coords); fi;
   return G1;
end);

############################################################################
##
#M  InducedSubgraph( <G>, <V> )
##
InstallMethod(InducedSubgraph,"for graphs",true,[Graphs,IsList],0,
function(G,V)
  local n1,G1,i,j,M,M1,coords;
    if not IsSubset([1..Order(G)],V) or V=[]# or  Maximum(List(Collected(V),x->x[2]))<>1 
      then
       Error("'vertex-list' must be a non-empty list of elements in [1..Order(G)]\
       without repeated elements in InducedSubgraph( <graph>, <vertex list> )\n");
  fi;
  M:=AdjMatrix(G);
  n1:=Length(V);
  M1:=List([1..n1],x->BlistList([1..n1],[]));
  for i in [1..n1] do
    for j in [1..n1] do
      M1[i][j]:=M[V[i]][V[j]];
    od;
  od;
  G1:=GraphByAdjMatrix(M1:GraphCategory:=TargetGraphCategory(G));
  G1!.ParentGraph:=G;
  SetVertexNames(G1,V);
  coords:=Coordinates(G);
  if coords<> fail then SetCoordinates(G1,List(V,z->coords[z])); fi;
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
    coords:=Coordinates(G);
    if(coords<>fail) then 
       newcoords:=[];
       for z in new do 
           vec:=Intersection(L[z],Vertices(G));
           numvec:=Length(vec);
           if numvec=0 then newcoords[z]:=[5,5]; continue; fi;
           veccoord:=Sum(List(vec,v->coords[v]));
           veccoord:=List(veccoord,w->Int(w/numvec));
           newcoords[z]:=veccoord;
       od;
       coords:=Concatenation(coords,newcoords);
       SetCoordinates(G1,coords);
    fi;
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
   local M,M0,e,n,G1,coords;
   if(Length(Edgs)=2 and IsInt(Edgs[1]) and IsInt(Edgs[2])) then 
      Edgs:=[Edgs];
   fi;
   n:=Order(G);
   M0:=AdjMatrix(G);
   M:=List(M0,ShallowCopy); #FIXME: replace with DeepCopy or something.
   for e in Edgs do 
      if IsList(e) and Length(e)=2 and 
         e[1] in [1..n] and e[2] in [1..n] then
            M[e[1]][e[2]]:=true;
            if TargetGraphCategory(G)=OrientedGraphs  then
               M[e[2]][e[1]]:=false;
            fi;
      fi;
   od; 
   G1:=GraphByAdjMatrix(M:GraphCategory:=TargetGraphCategory(G));
   coords:=Coordinates(G);
   if coords<> fail then SetCoordinates(G1,coords); fi;
   return G1;
end);

############################################################################
##
#M  RemoveEdges( <G>, <Edgs> )
##
InstallMethod(RemoveEdges,"for graphs", true, [Graphs,IsList],0,
function(G,Edgs)
   local M,e,M0,n,G1,coords;
   if(Length(Edgs)=2 and IsInt(Edgs[1]) and IsInt(Edgs[2])) then 
      Edgs:=[Edgs];
   fi;
   n:=Order(G);
   M0:=AdjMatrix(G);
   M:=List(M0,ShallowCopy); #FIXME: replace with DeepCopy or something.
   for e in Edgs do
      if IsList(e) and Length(e)=2 and
         e[1] in [1..n] and e[2] in [1..n] then
            M[e[1]][e[2]]:=false;
            if G in UndirectedGraphs then
               M[e[2]][e[1]]:=false;
            fi;
      fi;
   od;
   G1:=GraphByAdjMatrix(M:GraphCategory:=TargetGraphCategory(G));
   coords:=Coordinates(G);
   if coords<> fail then SetCoordinates(G1,coords); fi;
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
   return AddEdges(DiscreteGraph(Order(G)),SpanningForestEdges(G)); ##FIXME
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
  local G1,D,E,V,i,j,M;
  D:=[];
  M:=List(AdjMatrix(G),ShallowCopy);
  for i in [1..Order(G)] do M[i][i]:=true; od;
  for i in [1..Order(G)] do
   if not i in D then
   E:=ListBlist([1..Order(G)],M[i]);
   IntersectSet(E,[i+1..Order(G)]);
   SubtractSet(E,D);
    for j in E do
      if IsSubsetBlist(M[i],M[j]) then Add(D,j);
      elif IsSubsetBlist(M[j],M[i]) then Add(D,i);
      fi;
    od;
   fi;
  od;
  return Set(D);
end);

#E
