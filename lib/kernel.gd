#1
##  Categories and data Types:

##  #FIXME: Next Version should allow to define new categories
##  dynamically.  each category then should come with a name, a
##  tester, a functor and lattice info.

#########################################################################
##
#C  Graphs( <G> )
##  
##  <#GAPDoc Label="Graphs">
##  <ManSection>
##  <Func Name="Graphs" Arg="G"/>
##  <Description>
##  
##  <C>Graphs</C> is the most general graph category in &YAGS;. This
##  category contains all graphs that can be represented in &YAGS;. A
##  graph in this category may contain loops, arrows and edges (which
##  in &YAGS; are exactly the same as two opposite arrows between some
##  pair of vertices). This graph category has no parent category.
##
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareCategory("Graphs",IsObject);

##########################################################################
##
#C  LooplessGraphs( <G> )
##  
##  <#GAPDoc Label="LooplessGraphs">
##  <ManSection>
##  <Func Name="LooplessGraphs" Arg="G"/>
##  <Description>
##  
##  <C>LooplessGraphs</C> is a graph category in &YAGS;. A graph in
##  this category may contain arrows and edges but no loops. The
##  parent of this category is <C>Graphs</C>.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=LooplessGraphs);
##  Graph( Category := LooplessGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareCategory("LooplessGraphs",Graphs);

###########################################################################
##
#C  UndirectedGraphs( <G> )
##  
##  <#GAPDoc Label="UndirectedGraphs">
##  <ManSection>
##  <Func Name="UndirectedGraphs" Arg="G"/>
##  <Description>
##  
##  <C>UndirectedGraphs</C> is a graph category in &YAGS;. A graph in
##  this category may contain edges and loops, but no arrows. The
##  parent of this category is <C>Graphs</C>.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 1, 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareCategory("UndirectedGraphs",Graphs);

###############################################################################
##  
#C  OrientedGraphs( <G> )
##  
##  <#GAPDoc Label="OrientedGraphs">
##  <ManSection>
##  <Func Name="OrientedGraphs" Arg="G"/>
##  <Description>
##  
##  <C>OrientedGraphs</C> is a graph category in &YAGS;. A graph in
##  this category may contain arrows, but no loops or edges. The
##  parent of this category is <C>LooplessGraphs</C>.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [  ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareCategory("OrientedGraphs",LooplessGraphs);

###############################################################################
##  
#C  SimpleGraphs( <G> )
##  
##  <#GAPDoc Label="SimpleGraphs">
##  <ManSection>
##  <Func Name="SimpleGraphs" Arg="G"/>
##  <Description>
##  
##  <C>SimpleGraphs</C> is a graph category in &YAGS;. A graph in this
##  category may contain edges, but no loops or arrows. The category
##  has two parents: <C>LooplessGraphs</C> and
##  <C>UndirectedGraphs</C>.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=Graphs);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareCategory("SimpleGraphs",LooplessGraphs and UndirectedGraphs);
InstallTrueMethod(SimpleGraphs,LooplessGraphs and UndirectedGraphs);

BindGlobal("DefaultGraphCategory",SimpleGraphs);
###############################################################################
##  
#F  SetDefaultGraphCategory( <Catgy> )
##  
##  <#GAPDoc Label="SetDefaultGraphCategory">
##  <ManSection>
##  <Func Name="SetDefaultGraphCategory" Arg="Catgy"/>
##  <Description>
##  
##  <P/>Sets the default graph category to <A>Catgy</A>. The default
##  graph category is used when constructing new graphs when no other
##  graph category is indicated. New graphs are always forced to
##  comply with the <C>TargetGraphCategory</C>, so loops may be
##  removed, and arrows may replaced by edges or vice versa, depending
##  on the category that the new graph belongs to.
##  
##  <P/>The available graph categories are: <C>SimpleGraphs</C>,
##  <C>OrientedGraphs</C>, <C>UndirectedGraphs</C>,
##  <C>LooplessGraphs</C>, and <C>Graphs</C>.
##  
##  <P/>
##  <Example>
##  gap> SetDefaultGraphCategory(Graphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);
##  Graph( Category := Graphs, Order := 3, Size := 4, Adjacencies := 
##  [ [ 1, 2 ], [ 1 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(LooplessGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);  
##  Graph( Category := LooplessGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(UndirectedGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);    
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 1, 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(OrientedGraphs);
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);  
##  Graph( Category := OrientedGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [  ], [ 2 ] ] )
##  gap> SetDefaultGraphCategory(SimpleGraphs);    
##  gap> GraphByWalks([1,1],[1,2],[2,1],[3,2]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("SetDefaultGraphCategory");
BindGlobal("AvailableGraphCategories",
   [SimpleGraphs,OrientedGraphs,UndirectedGraphs,LooplessGraphs,Graphs]);

############################################################################
##
#F  GraphCategory( [ <G>, ... ] );
##  
##  <#GAPDoc Label="GraphCategory">
##  <ManSection>
##  <Func Name="GraphCategory" Arg="[ G, ...]"/>
##  <Description>
##  
##  <P/>For internal use. Returns the minimal common category to a
##  list of graphs.  If the list of graphs is empty, the default
##  category is returned.  The partial order (by inclusion) among
##  graph categories is as follows:
##  
##  <P/><#Include SYSTEM "catPO.xml">
##   
##  <P/>
##  <Example>
##  gap> g1:=CompleteGraph(2:GraphCategory:=SimpleGraphs);  
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> g2:=CompleteGraph(2:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [  ] ] )
##  gap> g3:=CompleteGraph(2:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 2, Size := 
##  3, Adjacencies := [ [ 1, 2 ], [ 1, 2 ] ] )
##  gap> GraphCategory([g1,g2,g3]);
##  &lt;Category "Graphs">
##  gap> GraphCategory([g1,g2]);   
##  &lt;Category "LooplessGraphs">
##  gap> GraphCategory([g1,g3]);
##  &lt;Category "UndirectedGraphs">
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphCategory"); 

############################################################################
##
#F  TargetGraphCategory( [ <G>, ... ] );
##  
##  <#GAPDoc Label="TargetGraphCategory">
##  <ManSection>
##  <Func Name="TargetGraphCategory" Arg="[ G, ... ]"/>
##  <Description>
##  
##  <P/>For internal use. Returns the graph category indicated in the
##  <A>options stack</A> if any, otherwise if the list of graphs
##  provided is not empty, returns the minimal common graph category
##  for the graphs in the list, else returns the default graph
##  category.  The partial order (by inclusion) among graph categories
##  is as follows:
##
##  <P/><#Include SYSTEM "catPO.xml">
##   
##  <P/>This function is internally called by all graph constructing
##  operations in &YAGS; to decide the graph category that the newly
##  constructed graph is going to belong. New graphs are always forced
##  to comply with the <C>TargetGraphCategory</C>, so loops may be
##  removed, and arrows may replaced by edges or vice versa, depending
##  on the category that the new graph belongs to.
##  
##  <P/>The <A>options stack</A> is a mechanism provided by &GAP; to
##  pass implicit parameters and is used by <C>TargetGraphCategory</C>
##  so that the user may indicate the graph category she/he wants for
##  the new graph.
##
##  <P/>
##  <Example>
##  gap> SetDefaultGraphCategory(SimpleGraphs);             
##  gap> g1:=CompleteGraph(2);                              
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> g2:=CompleteGraph(2:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [  ] ] )
##  gap> DisjointUnion(g1,g2);
##  Graph( Category := LooplessGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1 ], [ 4 ], [  ] ] )
##  gap> DisjointUnion(g1,g2:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 4, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1 ], [ 4 ], [ 3 ] ] )
##  </Example>
##  
##  <P/>In the previous examples, <C>TargetGraphCategory</C> was
##  called internally exactly once for each new graph constructed with
##  the following parameters:
##  
##  <P/>
##  <Example>
##  gap> TargetGraphCategory();
##  &lt;Category "SimpleGraphs">
##  gap> TargetGraphCategory(:GraphCategory:=OrientedGraphs);
##  &lt;Category "OrientedGraphs">
##  gap> TargetGraphCategory([g1,g2]);                       
##  &lt;Category "LooplessGraphs">
##  gap> TargetGraphCategory([g1,g2]:GraphCategory:=UndirectedGraphs);
##  &lt;Category "UndirectedGraphs">
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("TargetGraphCategory");

###############################################################################
##
#O  in( <G>, <Catgy> )
##  
##  <#GAPDoc Label="in">
##  <ManSection>
##  <Oper Name="in" Arg="G, Catgy"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> belongs to category
##  <A>Catgy</A> and <C>false</C> otherwise.
##
##  <P/>
##  <Example>
##  gap> g:=WheelGraph(4);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  8, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 5 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 2, 4 ] ] )
##  gap> g in SimpleGraphs;
##  true
##  gap> g in Graphs;
##  true
##  gap> g in OrientedGraphs;
##  false
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod(\in,"for graph categories", true, [Graphs,IsOperation],0, 
function(x,f)
  if f in AvailableGraphCategories then
    return f(x); 
  else
    TryNextMethod();
  fi;
end);
DeclareRepresentation( "IsGraphStdRep",IsAttributeStoringRep , ["GraphCategory","AdjMatrix"] );
GraphFamily:=NewFamily("GraphFamily");
GraphType:=NewType(GraphFamily,Graphs and IsGraphStdRep);

##
##  Attributes and Properties:
##
###########################################################################
##
#A  AdjMatrix( <G> )
##  
##  <#GAPDoc Label="AdjMatrix">
##  <ManSection>
##  <Attr Name="AdjMatrix" Arg="G"/>
##  <Description>
##
##  <P/>Returns the adjacency matrix of graph <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> AdjMatrix(CycleGraph(4));
##  [ [ false, true, false, true ], [ true, false, true, false ], 
##    [ false, true, false, true ], [ true, false, true, false ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("AdjMatrix",Graphs);

############################################################################
##
#A  Order(<G>)
##  
##  <#GAPDoc Label="Order">
##  <ManSection>
##  <Attr Name="Order" Arg="G"/>
##  <Description>
##
##  <P/>Returns the number of vertices, of graph <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> Order(Icosahedron);
##  12
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("Order",Graphs);

############################################################################
##
#A  Size(<G>)
##  
##  <#GAPDoc Label="Size">
##  <ManSection>
##  <Attr Name="Size" Arg="G"/>
##  <Description>
##
##  <P/>Returns the number of edges of graph <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> Size(Icosahedron);
##  30
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("Size",Graphs);

############################################################################
##
#A  VertexNames(<G>)
##  
##  <#GAPDoc Label="VertexNames">
##  <ManSection>
##  <Attr Name="VertexNames" Arg="G"/>
##  <Description>
##  
##  <P/>Return the list of names of the vertices of <A>G</A>. The
##  vertices of a graph in &YAGS; are always <M>\{1,2, \ldots,
##  Order(G)\}</M>, but depending on how the graph was constructed,
##  its vertices may have also some <A>names</A>, that help us
##  identify the origin of the vertices. &YAGS; will always try to
##  store meaningful names for the vertices. For example, in the case
##  of the LineGraph, the vertex names of the new graph are the edges
##  of the old graph.
##
##  <P/>
##  <Example>
##  gap> g:=LineGraph(DiamondGraph);          
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  8, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4, 5 ], [ 1, 2, 5 ], 
##    [ 1, 2, 5 ], [ 2, 3, 4 ] ] )
##  gap> VertexNames(g);
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 3, 4 ] ]
##  gap> Edges(DiamondGraph);
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 3, 4 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("VertexNames",Graphs);

############################################################################
##
#P  IsCompleteGraph( <G> )
##  
##  <#GAPDoc Label="IsCompleteGraph">
##  <ManSection>
##  <Prop Name="IsCompleteGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> is a complete graph,
##  <C>false</C> otherwise.  In a complete graph every pair of
##  vertices is an edge.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsCompleteGraph",Graphs);

############################################################################
##
#P  IsLoopless( <G> )
##  
##  <#GAPDoc Label="IsLoopless">
##  <ManSection>
##  <Prop Name="IsLoopless" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> have no loops,
##  <C>false</C> otherwise. Loops are edges from a vertex to itself.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsLoopless",Graphs);

############################################################################
##
#P  IsUndirected(<G>)
##  
##  <#GAPDoc Label="IsUndirected">
##  <ManSection>
##  <Prop Name="IsUndirected" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> is an undirected graph,
##  <C>false</C> otherwise.  Regardless of the categories that
##  <A>G</A> belongs to, <A>G</A> is undirected if whenever
##  <C>[x,y]</C> is an edge of <A>G</A>, <C>[y,x]</C> is also an edge
##  of <A>G</A>.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsUndirected",Graphs);

############################################################################
##
#P  IsOriented(<G>)
##  
##  <#GAPDoc Label="IsOriented">
##  <ManSection>
##  <Prop Name="IsOriented" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> is an oriented graph,
##  <C>false</C> otherwise.  Regardless of the categories that
##  <A>G</A> belongs to, <A>G</A> is oriented if whenever <C>[x,y]</C>
##  is an edge of <A>G</A>, <C>[y,x]</C> is not.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsOriented",Graphs);

##  Gap already declares "IsSimple" as an operation. 
##  Hence it may not be redefined as a property
############################################################################
##  
#P  IsSimple(<G>)
##  
##  <#GAPDoc Label="IsSimple">
##  <ManSection>
##  <Prop Name="IsSimple" Arg="G"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if graph <A>G</A> is a simple graph,
##  <C>false</C> otherwise.  Regardless of the categories that
##  <A>G</A> belongs to, <A>G</A> is simple if and only if <A>G</A> is
##  undirected and loopless.
##  
##  <P/>Returns <C>true</C> if the graph <A>G</A> is simple regardless
##  of its category.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsSimple",[Graphs]);

############################################################################
##
#A  QtfyIsSimple( <G> )
##  
##  <#GAPDoc Label="QtfyIsSimple">
##  <ManSection>
##  <Attr Name="QtfyIsSimple" Arg="G"/>
##  <Description>
##  
##  <P/>For internal use. Returns how far is graph <A>G</A> from being
##  simple.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("QtfyIsSimple",Graphs);

############################################################################
##
#O  IsComplete( <G>, <L> )
##  
##  <#GAPDoc Label="IsComplete">
##  <ManSection>
##  <Oper Name="IsComplete" Arg="G, L"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if <A>L</A> induces a complete subgraph of
##  <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> IsComplete(DiamondGraph,[1,2,3]);
##  true
##  gap> IsComplete(DiamondGraph,[1,2,4]);
##  false
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsComplete",[Graphs,IsList]);

############################################################################
##
#O  Vertices( <G> )
##  
##  <#GAPDoc Label="Vertices">
##  <ManSection>
##  <Oper Name="Vertices" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the list [1..Order( <A>G</A> )].
##  
##  <P/>
##  <Example>
##  gap> Vertices(Icosahedron);
##  [ 1 .. 12 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Vertices",[Graphs]);

############################################################################
##
#O  IsEdge( <G>, <x>, <y>)
#O  IsEdge( <G>, [<x>,<y>])
##  
##  <#GAPDoc Label="IsEdge">
##  <ManSection>
##  <Oper Name="IsEdge" Arg="G, x, y"/>
##  <Oper Name="IsEdge" Arg="G, [x,y>]"/>
##  <Description>
##  
##  <P/>Returns <C>true</C> if [<A>x</A>,<A>y</A>] is an edge of
##  <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> IsEdge(PathGraph(3),1,2);
##  true
##  gap> IsEdge(PathGraph(3),[1,2]);
##  true
##  gap> IsEdge(PathGraph(3),1,3);
##  false
##  gap> IsEdge(PathGraph(3),[1,3]);
##  false
##  </Example>
##  
##  <P/>The first form, IsEdge(<A>G</A>, <A>x</A>, <A>y</A>), is a bit
##  faster and hence more suitable for use in algorithms which make
##  extensive use of this operation.  On the other hand, the first
##  form does no error checking at all, and hence, it may produce an
##  error where the second form returns false (for instance when
##  <A>x</A> is not a vertex of <A>G</A>). The second form is
##  therefore a bit slower, but more robust.
##  
##  <P/>
##  <Example>
##  gap> IsEdge(PathGraph(3),[7,3]);
##  false
##  gap> IsEdge(PathGraph(3),7,3);  
##  Error, List Element: &lt;list>[7] must have an assigned value
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsEdge",[Graphs,IsInt,IsInt]);

############################################################################
##
#O  Adjacency( <G>, <x> )
##  
##  <#GAPDoc Label="Adjacency">
##  <ManSection>
##  <Oper Name="Adjacency" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the adjacency list of vertex <A>x</A> in <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> Adjacency(g,1);           
##  [ 2 ]
##  gap> Adjacency(g,2);
##  [ 1, 3 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Adjacency",[Graphs,IsInt]);

############################################################################
##  
#O  Adjacencies( <G> )
##  
##  <#GAPDoc Label="Adjacencies">
##  <ManSection>
##  <Oper Name="Adjacencies" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the adjacency lists of graph <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> Adjacencies(g);  
##  [ [ 2 ], [ 1, 3 ], [ 2 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Adjacencies",[Graphs]);

############################################################################
##
#O  VertexDegree( <G>, <x> )
##  
##  <#GAPDoc Label="VertexDegree">
##  <ManSection>
##  <Oper Name="VertexDegree" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the degree of vertex <A>x</A> in Graph <A>G</A>. 
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(3);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> VertexDegree(g,1);
##  1
##  gap> VertexDegree(g,2);
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("VertexDegree",[Graphs,IsInt]);

############################################################################
##  
#O  VertexDegrees( <G> )
##  
##  <#GAPDoc Label="VertexDegrees">
##  <ManSection>
##  <Oper Name="VertexDegrees" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the list of degrees of the vertices in graph <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  7, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> VertexDegrees(g);
##  [ 4, 2, 3, 3, 2 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("VertexDegrees",Graphs);

############################################################################
##  
#O  MaxDegree( <G> )
##  
##  <#GAPDoc Label="MaxDegree">
##  <ManSection>
##  <Oper Name="MaxDegree" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the maximum degree in graph <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  7, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> MaxDegree(g);
##  4
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MaxDegree",[Graphs]);

############################################################################
##  
#O  MinDegree( <G> )
##  
##  <#GAPDoc Label="MinDegree">
##  <ManSection>
##  <Oper Name="MinDegree" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the minimum degree in graph <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  7, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4 ] ] )
##  gap> MinDegree(g);
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("MinDegree",[Graphs]);

############################################################################
##  
#O  Edges( <G> )
##  
##  <#GAPDoc Label="Edges">
##  <ManSection>
##  <Oper Name="Edges" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the list of edges of graph <A>G</A> in the case of
##  <C>SimpleGraphs</C>.
##  
##  <P/>
##  <Example>
##  gap> g1:=CompleteGraph(3);     
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  3, Adjacencies := [ [ 2, 3 ], [ 1, 3 ], [ 1, 2 ] ] )
##  gap> Edges(g1);
##  [ [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
##  </Example>
##  
##  <P/>In the case of <C>UndirectedGraphs</C>, it also returns the
##  loops. While in the other categories, <C>Edges</C> actually does
##  not return the edges, but the loops and arrows of <A>G</A>.
##
##  <P/>
##  <Example>
##  gap> g2:=CompleteGraph(3:GraphCategory:=UndirectedGraphs);
##  Graph( Category := UndirectedGraphs, Order := 3, Size := 
##  6, Adjacencies := [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 1, 2, 3 ] ] )
##  gap> Edges(g2);
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 2 ], [ 2, 3 ], [ 3, 3 ] ]
##  gap> g3:=CompleteGraph(3:GraphCategory:=Graphs);          
##  Graph( Category := Graphs, Order := 3, Size := 9, Adjacencies := 
##  [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 1, 2, 3 ] ] )
##  gap> Edges(g3);                                 
##  [ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], 
##    [ 3, 1 ], [ 3, 2 ], [ 3, 3 ] ]
##  </Example>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Edges",[Graphs]);

##  
##  Functions to create graphs:
##
############################################################################
##
#O  Graph( <Rec> )
##  
##  <#GAPDoc Label="Graph">
##  <ManSection>
##  <Oper Name="Graph" Arg="Rec"/>
##  <Description>
##  
##  <P/>Returns a new graph created from the record <A>Rec</A>. The
##  record must provide the field <A>Category</A> and either the field
##  <A>Adjacencies</A> or the field <A>AdjMatrix</A>.
##  
##  <P/>
##  <Example>
##  gap> Graph(rec(Category:=SimpleGraphs,Adjacencies:=[[2],[1]]));
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> Graph(rec(Category:=SimpleGraphs,AdjMatrix:=[[false, true],[true, false]]));
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  </Example>
##  
##  <P/>Its main purpose is to import graphs from files, which could
##  have been previously exported using <C>PrintTo</C>.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> PrintTo("aux.g","h1:=",g,";");
##  gap> Read("aux.g");
##  gap> h1;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Graph",[IsRecord]);

############################################################################
##  
#F  GraphByAdjMatrix( <Mat> )
##  
##  <#GAPDoc Label="GraphByAdjMatrix">
##  <ManSection>
##  <Func Name="GraphByAdjMatrix" Arg="Mat"/>
##  <Description>
##  
##  <P/>Returns a new graph created from an adjacency matrix
##  <A>Mat</A>. The matrix <A>Mat</A> must be a square boolean matrix.
##  
##  <P/>
##  <Example>
##  gap> m:=[ [ false, true, false ], [ true, false, true ], [ false, true, false ] ];;
##  gap> g:=GraphByAdjMatrix(m);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> AdjMatrix(g);
##  [ [ false, true, false ], [ true, false, true ], 
##    [ false, true, false ] ]
##  </Example>
##  
##  <P/>Note, however, that the graph is forced to comply with the
##  <C>TargetGraphCategory</C>.
##  
##  <P/>
##  <Example>
##  gap> m:=[ [ true, true], [ false, false ] ];;
##  gap> g:=GraphByAdjMatrix(m);                
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> AdjMatrix(g);                          
##  [ [ false, true ], [ true, false ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByAdjMatrix");

############################################################################
##  
#F  GraphByAdjacencies( <AdjList> )
##  
##  <#GAPDoc Label="GraphByAdjacencies">
##  <ManSection>
##  <Func Name="GraphByAdjacencies" Arg="AdjList"/>
##  <Description>
##  
##  <P/>Returns a new graph having <A>AdjList</A> as its list of
##  adjacencies. The order of the created graph is <C>Length(A)</C>,
##  and the set of neighbors of vertex <A>x</A> is <M>A[x]</M>.
##  
##  <P/>
##  <Example>
##  gap> GraphByAdjacencies([[2],[1,3],[2]]);      
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##  
##  <P/>Note, however, that the graph is forced to comply with the
##  <C>TargetGraphCategory</C>.
##  
##  <P/>
##  <Example>
##  gap> GraphByAdjacencies([[1,2,3],[],[]]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2, 3 ], [ 1 ], [ 1 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByAdjacencies");

############################################################################
##
#F  GraphByCompleteCover( <Cover> )
##  
##  <#GAPDoc Label="GraphByCompleteCover">
##  <ManSection>
##  <Func Name="GraphByCompleteCover" Arg="Cover"/>
##  <Description>
##  
##  <P/>Returns the minimal graph where the elements of <A>Cover</A>
##  are (the vertex sets of) complete subgraphs.
##
##  <P/>
##  <Example>
##  gap> GraphByCompleteCover([[1,2,3,4],[4,6,7]]); 
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  9, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3, 6, 7 ], [  ], [ 4, 7 ], [ 4, 6 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByCompleteCover");

############################################################################
##
#F  GraphByRelation( <V>, <Rel> )
#F  GraphByRelation( <n>, <Rel> )
##  
##  <#GAPDoc Label="GraphByRelation">
##  <ManSection>
##  <Func Name="GraphByRelation" Arg="V, Rel"/>
##  <Func Name="GraphByRelation" Arg="n, Rel"/>
##  <Description>
##  
##  <P/>Returns a new graph created from a set of vertices <A>V</A>
##  and a binary relation <A>Rel</A>, where <M>x\sim y</M> iff
##  <C><A>Rel</A>(x,y)=true</C>. In the second form, <A>n</A> is an
##  integer and <M>V</M> is assumed to be <M>\{1, 2, \ldots, n\}</M>.
##  
##  <P/>
##  <Example>
##  gap> Rel:=function(x,y) return Intersection(x,y)&lt;>[]; end;;          
##  gap> GraphByRelation([[1,2,3],[3,4,5],[5,6,7]],Rel);               
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> GraphByRelation(8,function(x,y) return AbsInt(x-y)&lt;=2; end); 
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  13, Adjacencies := [ [ 2, 3 ], [ 1, 3, 4 ], [ 1, 2, 4, 5 ], 
##    [ 2, 3, 5, 6 ], [ 3, 4, 6, 7 ], [ 4, 5, 7, 8 ], [ 5, 6, 8 ], 
##    [ 6, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByRelation");

############################################################################
##  
#F  GraphByWalks( <Walk1>, <Walk2>,...)
##  
##  <#GAPDoc Label="GraphByWalks">
##  <ManSection>
##  <Func Name="GraphByWalks" Arg="Walk1, Walk2,..."/>
##  <Description>
##  
##  <P/>Returns the minimal graph such that <A>Walk1</A>,
##  <A>Walk2</A>, etc are Walks.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,2,3,4,1],[1,5,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  6, Adjacencies := [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ], 
##    [ 1, 6 ], [ 5 ] ] )
##  </Example>
##  
##  <P/>Walks can be <A>nested</A>, which greatly improves the
##  versatility of this function.
##   
##  <P/>
##  <Example>
##  gap> GraphByWalks([1,[2,3,4],5],[5,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 5 ], [ 1, 2, 4, 5 ], 
##    [ 1, 3, 5 ], [ 2, 3, 4, 6 ], [ 5 ] ] )
##  </Example>
##  
##  <P/>The vertices in the constructed graph range from 1 to the
##  maximum of the numbers appearing in <A>Walk1</A>, <A>Walk2</A>,
##  ... etc.
##  
##  <P/>
##  <Example>
##  gap> GraphByWalks([4,2],[3,6]);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  2, Adjacencies := [ [  ], [ 4 ], [ 6 ], [ 2 ], [  ], [ 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByWalks");

############################################################################
##  
#F  GraphByEdges( <L> )
##  
##  <#GAPDoc Label="GraphByEdges">
##  <ManSection>
##  <Func Name="GraphByEdges" Arg="L"/>
##  <Description>
##  
##  <P/>Returns the minimal graph such that the pairs in <A>L</A> are
##  edges.
##  
##  <P/>
##  <Example>
##  gap> GraphByEdges([[1,2],[1,3],[1,4],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1, 5 ], [ 4 ] ] )
##  </Example>
##  
##  <P/>The vertices of the constructed graph range from 1 to the
##  maximum of the numbers appearing in <A>L</A>.
##  
##  <P/>
##  <Example>
##  gap> GraphByEdges([[4,3],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  2, Adjacencies := [ [  ], [  ], [ 4 ], [ 3, 5 ], [ 4 ] ] )
##  </Example>
##  
##  <P/>Note that <C>GraphByWalks</C> has an even greater
##  functionality.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphByEdges");

############################################################################
##  
#F  IntersectionGraph( <L> )
##  
##  <#GAPDoc Label="IntersectionGraph">
##  <ManSection>
##  <Func Name="IntersectionGraph" Arg="L"/>
##  <Description>
##  
##  <P/>Returns the intersection graph of the family of sets
##  <A>L</A>. This graph has a vertex for every set in <A>L</A>, and
##  two such vertices are adjacent iff the corresponding sets have
##  non-empty intersection.
##  
##  <P/>
##  <Example>
##  gap> IntersectionGraph([[1,2,3],[3,4,5],[5,6,7]]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("IntersectionGraph");

##
##  New graphs from old graphs:
##
############################################################################
##  
#O  CopyGraph( <G> ) 
##  
##  <#GAPDoc Label="CopyGraph">
##  <ManSection>
##  <Oper Name="CopyGraph" Arg="G"/>
##  <Description>
##  
##  <P/>Returns a fresh copy of graph <A>G</A>. Only the order and
##  adjacency information is copied, all other known attributes of
##  <A>G</A> are not. Mainly used to transform a graph from one
##  category to another. The new graph will be forced to comply with
##  the <C>TargetGraphCategory</C>.
##  
##  <P/>
##  <Example>
##  gap> g:=CompleteGraph(4);                         
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  gap> g1:=CopyGraph(g:GraphCategory:=OrientedGraphs);
##  Graph( Category := OrientedGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 3, 4 ], [ 4 ], [  ] ] )
##  gap> CopyGraph(g1:GraphCategory:=SimpleGraphs);     
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CopyGraph",[Graphs]); 

############################################################################
##  
#O  InducedSubgraph( <G>, <V> )
##  
##  <#GAPDoc Label="InducedSubgraph">
##  <ManSection>
##  <Oper Name="InducedSubgraph" Arg="G, V"/>
##  <Description>
##  
##  <P/>Returns the subgraph of graph <A>G</A> induced by the vertex
##  set <A>V</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(6);          
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  6, Adjacencies := [ [ 2, 6 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4, 6 ], 
##    [ 1, 5 ] ] )
##  gap> InducedSubgraph(g,[3,4,6]);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ], [  ] ] )
##  </Example>
##  
##  <P/>The order of the elements in <A>V</A> does matter.
##  
##  <P/>
##  <Example>
##  gap> InducedSubgraph(g,[6,3,4]);  
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  1, Adjacencies := [ [  ], [ 3 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("InducedSubgraph",[Graphs,IsList]);

############################################################################
##  
#O  AddVerticesByAdjacencies( <G>, <NewAdjList> )
##  
##  <#GAPDoc Label="AddVerticesByAdjacencies">
##  <ManSection>
##  <Oper Name="AddVerticesByAdjacencies" Arg="G, NewAdjList"/>
##  <Description>
##  
##  <P/>Returns a new graph created from graph <A>G</A> by adding as
##  many new vertices as <C>Length(<A>NewAdjList</A>)</C>. Each entry
##  in <A>NewAdjList</A> is also a list: the list of neighbors of the
##  corresponding new vertex.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> AddVerticesByAdjacencies(g,[[1,2],[4,5]]); 
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  8, Adjacencies := [ [ 2, 6 ], [ 1, 3, 6 ], [ 2, 4 ], [ 3, 5, 7 ], 
##    [ 4, 7 ], [ 1, 2 ], [ 4, 5 ] ] )
##  gap> AddVerticesByAdjacencies(g,[[1,2,7],[4,5]]);
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  9, Adjacencies := [ [ 2, 6 ], [ 1, 3, 6 ], [ 2, 4 ], [ 3, 5, 7 ], 
##    [ 4, 7 ], [ 1, 2, 7 ], [ 4, 5, 6 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("AddVerticesByAdjacencies",[Graphs,IsList]);

############################################################################
##  
#O  RemoveVertices( <G>, <V> )
##  
##  <#GAPDoc Label="RemoveVertices">
##  <ManSection>
##  <Oper Name="RemoveVertices" Arg="G, V"/>
##  <Description>
##  
##  <P/>Returns a new graph created from graph <A>G</A> by removing
##  the vertices in list <A>V</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] )
##  gap> RemoveVertices(g,[3]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1 ], [ 4 ], [ 3 ] ] )
##  gap> RemoveVertices(g,[1,3]);
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  1, Adjacencies := [ [  ], [ 3 ], [ 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RemoveVertices",[Graphs,IsList]);

############################################################################
##  
#O  AddEdges( <G>, <E> )
##  
##  <#GAPDoc Label="AddEdges">
##  <ManSection>
##  <Oper Name="AddEdges" Arg="G, E"/>
##  <Description>
##  
##  <P/>Returns a new graph created from graph <A>G</A> by adding the
##  edges in list <A>E</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(4);   
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3 ] ] )
##  gap> AddEdges(g,[[1,3]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  5, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3 ] ] )
##  gap> AddEdges(g,[[1,3],[2,4]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("AddEdges",[Graphs,IsList]);

############################################################################
##  
#O  RemoveEdges( <G>, <E> )
##  
##  <#GAPDoc Label="RemoveEdges">
##  <ManSection>
##  <Oper Name="RemoveEdges" Arg="G, E"/>
##  <Description>
##  
##  <P/>Returns a new graph created from graph <A>G</A> by removing
##  the edges in list <A>E</A>.
##
##  <P/>
##  <Example>
##  gap> g:=CompleteGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  gap> RemoveEdges(g,[[1,2]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  5, Adjacencies := [ [ 3, 4 ], [ 3, 4 ], [ 1, 2, 4 ], [ 1, 2, 3 ] ] )
##  gap> RemoveEdges(g,[[1,2],[3,4]]);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 3, 4 ], [ 3, 4 ], [ 1, 2 ], [ 1, 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RemoveEdges",[Graphs,IsList]);

## #FIXME: Include AddComplete, AddAdjacencies?

## FIXME: Be more explicit.
############################################################################
##  
#A  ConnectedComponents( <G> )
##  
##  <#GAPDoc Label="ConnectedComponents">
##  <ManSection>
##  <Attr Name="ConnectedComponents" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the connected components of <A>G</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("ConnectedComponents",Graphs);

## FIXME: Be more explicit.
############################################################################
##  
#A  NumberOfConnectedComponents( <G> )
##  
##  <#GAPDoc Label="NumberOfConnectedComponents">
##  <ManSection>
##  <Attr Name="NumberOfConnectedComponents" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the number of connected components of <A>G</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("NumberOfConnectedComponents",Graphs);

## FIXME: Be more explicit.
############################################################################
##  
#O  SpanningForestEdges( <G> )
##  
##  <#GAPDoc Label="SpanningForestEdges">
##  <ManSection>
##  <Oper Name="SpanningForestEdges" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the edges of a spanning forest of <A>G</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("SpanningForestEdges",[Graphs]);

## FIXME: Be more explicit.
############################################################################
##  
#O  SpanningForest( <G> )
##  
##  <#GAPDoc Label="SpanningForest">
##  <ManSection>
##  <Oper Name="SpanningForest" Arg="G"/>
##  <Description>
##  
##  <P/>Returns a spanning forest of <A>G</A>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("SpanningForest",[Graphs]);

############################################################################
##  
#O  Link( <G>, <x> )
##  
##  <#GAPDoc Label="Link">
##  <ManSection>
##  <Oper Name="Link" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the subgraph of <A>G</A> induced by the neighbors of
##  <A>x</A>.
##  
##  <P/>
##  <Example>
##  gap> Link(SnubDisphenoid,1);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] 
##   ] )
##  gap> Link(SnubDisphenoid,3);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], [ 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Link",[Graphs, IsInt]);

############################################################################
##  
#A  Links( <G> )
##  
##  <#GAPDoc Label="Links">
##  <ManSection>
##  <Attr Name="Links" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the list of subgraphs of <A>G</A> induced by the
##  neighbors of each vertex of <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> Links(SnubDisphenoid); 
##  [ Graph( Category := SimpleGraphs, Order := 5, Size := 
##      5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], 
##        [ 1, 4 ] ] ), Graph( Category := SimpleGraphs, Order := 
##      5, Size := 5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], 
##        [ 3, 5 ], [ 1, 4 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], [ 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], [ 2, 3 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 5, Size := 
##      5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], 
##        [ 1, 4 ] ] ), Graph( Category := SimpleGraphs, Order := 
##      5, Size := 5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], 
##        [ 3, 5 ], [ 1, 4 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 3, 4 ], [ 3, 4 ], [ 1, 2 ], [ 1, 2 ] ] ), 
##    Graph( Category := SimpleGraphs, Order := 4, Size := 
##      4, Adjacencies := [ [ 2, 3 ], [ 1, 4 ], [ 1, 4 ], [ 2, 3 ] ] ) ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("Links",Graphs);

############################################################################
##  
#A  DominatedVertices( <G> )
##  
##  <#GAPDoc Label="DominatedVertices">
##  <ManSection>
##  <Attr Name="DominatedVertices" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the set of dominated vertices of <A>G</A>. 
##  
##  <P/>A vertex <A>x</A> is dominated by another vertex <A>y</A> when
##  the closed neighborhood of <A>x</A> is contained in that of
##  <A>y</A>. However, when there are twin vertices (mutually
##  dominated vertices), exactly one of them (in each equivalent class
##  of mutually dominated vertices) does not appear in the returned
##  set.
##  
##  <P/>
##  <Example>
##  gap> g1:=PathGraph(3);     
##  Graph( Category := SimpleGraphs, Order := 3, Size := 
##  2, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2 ] ] )
##  gap> DominatedVertices(g1);
##  [ 1, 3 ]
##  gap> g2:=PathGraph(2);
##  Graph( Category := SimpleGraphs, Order := 2, Size := 
##  1, Adjacencies := [ [ 2 ], [ 1 ] ] )
##  gap> DominatedVertices(g2);
##  [ 2 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("DominatedVertices",Graphs);
  
############################################################################
##  
#F  GraphAttributeStatistics( <OrderList>, <ProbList>, <Attribute> )
##  
##  <#GAPDoc Label="GraphAttributeStatistics">
##  <ManSection>
##  <Func Name="GraphAttributeStatistics" Arg="OrderList, ProbList, Attribute"/>
##  <Description>
##  
##  <P/>Returns statistics for graph attribute <A>Attribute</A>.  For
##  each of the orders <A>n</A> in <A>OrderList</A> and for each of
##  the probabilities <A>p</A> in <A>ProbList</A> this function
##  generates 100 random graphs of order <A>n</A> and edge probability
##  <A>p</A> and then evaluates the graph attribute <A>Attribute</A>
##  on each of them. The function then returns statistical data on
##  these experiments. The form in which the statistical data is
##  reported depend on a number of issues and is best explained by
##  examples.
##  
##  <P/>First let us consider the case where <A>Attribute</A> is a
##  Boolean attribute (always returns <C>true</C> or <C>false</C>) and
##  where <A>OrderList</A> and <A>ProbList</A> consist of a unique
##  value. In this case, the respective lists may be replaced by the
##  corresponding unique values on invocation:
##  
##  <P/>
##  <Example>
##  gap> GraphAttributeStatistics(10,1/2,IsCliqueHelly);
##  32
##  </Example>
##  
##  <P/>This tells us that 43 of the 100 examined random graphs
##  resulted to be clique-Helly; The random sample was constructed
##  using graphs of order 10 and edge probability 1/2.
##  
##  <P/>Now we can specify a list of probabilities to be examined:
##  
##  <P/>
##  <Example>
##  gap> GraphAttributeStatistics(10,1/10*[1..9],IsCliqueHelly);
##  [ 100, 100, 97, 70, 36, 14, 26, 76, 95 ]
##  </Example>
##  
##  <P/>The last example tells us that, for graphs on 10 vertices, the
##  property IsCliqueHelly is least probable to be true for graphs
##  with edge probabilities 5/10 6/10 and 7/10, being 6/10 the
##  probability that reaches the minimum in the random sample. Note
##  that the 36 in the previous example does not match the 43 in the
##  first one, this is to be expected as the statistics are compiled
##  from a random sample of graphs. Also, note that in the previous
##  example, 900 random graphs where generated and examined.
##   
##  <P/>We can also specify a list of orders to consider:
##  
##  <P/>
##  <Example>
##  gap> GraphAttributeStatistics([10,12..20],1/10*[1..9],IsCliqueHelly);
##  [ [ 100, 100, 97, 70, 36, 14, 26, 76, 95 ], 
##    [ 100, 98, 78, 24, 8, 4, 19, 62, 98 ], 
##    [ 100, 97, 61, 13, 0, 3, 6, 47, 96 ], 
##    [ 100, 91, 36, 2, 0, 0, 8, 43, 99 ], 
##    [ 100, 77, 10, 0, 0, 0, 4, 32, 95 ], 
##    [ 100, 68, 6, 0, 0, 0, 1, 27, 95 ] ]
##  gap> Display(last);
##  [ [  100,  100,   97,   70,   36,   14,   26,   76,   95 ],
##    [  100,   98,   78,   24,    8,    4,   19,   62,   98 ],
##    [  100,   97,   61,   13,    0,    3,    6,   47,   96 ],
##    [  100,   91,   36,    2,    0,    0,    8,   43,   99 ],
##    [  100,   77,   10,    0,    0,    0,    4,   32,   95 ],
##    [  100,   68,    6,    0,    0,    0,    1,   27,   95 ] ]
##  </Example>
##  
##  <P/>Which tell us that the observed bimodal distribution is even
##  more pronounced when the order of the graphs considered grows.
##  
##  <P/>In the case of a non-Boolean attribute
##  <C>GraphAttributeStatistics()</C> reports the values that
##  <A>Attribute</A> took on the sample as well as the number of times
##  that each of these values where obtained:
##  
##  <P/>
##  <Example>
##  gap> GraphAttributeStatistics(10,1/2,Diameter);     
##  [ [ 2, 34 ], [ 3, 64 ], [ 4, 2 ] ]
##  </Example>
##  
##  <P/>The returned statistics mean that among the 100 generated
##  random graphs on 10 vertices with edge probability 1/2, there were
##  26 graphs with diameter 2, 60 graphs of diameter 3, 8 of 4, 1 of 6
##  and 5 graphs which were not connected.
##  
##  <P/>Now it should be evident the format of the returned statistics
##  when we specify a list of probabilities and/or a list of orders to be 
##  considered for a non-Boolean Attribute:
##  
##  <P/>
##  <Example>
##  gap> GraphAttributeStatistics(10,1/5*[1..4],Diameter);         
##  [ [ [ 3, 2 ], [ 4, 3 ], [ 5, 9 ], [ 6, 4 ], [ 7, 1 ], 
##        [ infinity, 81 ] ], 
##    [ [ 2, 5 ], [ 3, 61 ], [ 4, 18 ], [ 5, 3 ], [ infinity, 13 ] ], 
##    [ [ 2, 75 ], [ 3, 24 ], [ infinity, 1 ] ], [ [ 2, 99 ], [ 3, 1 ] ] ]
##  gap> GraphAttributeStatistics([10,12,14],1/5*[1..4],Diameter);
##  [ [ [ [ 3, 3 ], [ 4, 8 ], [ 5, 9 ], [ 6, 4 ], [ 8, 1 ], 
##            [ infinity, 75 ] ], 
##        [ [ 2, 4 ], [ 3, 59 ], [ 4, 24 ], [ 5, 1 ], [ infinity, 12 ] ], 
##        [ [ 2, 71 ], [ 3, 27 ], [ 4, 1 ], [ infinity, 1 ] ], 
##        [ [ 2, 100 ] ] ], 
##    [ 
##        [ [ 4, 11 ], [ 5, 13 ], [ 6, 7 ], [ 7, 2 ], [ 8, 2 ], 
##            [ infinity, 65 ] ], 
##        [ [ 2, 6 ], [ 3, 72 ], [ 4, 16 ], [ 5, 1 ], [ infinity, 5 ] ], 
##        [ [ 2, 77 ], [ 3, 23 ] ], [ [ 2, 100 ] ] ], 
##    [ 
##        [ [ 3, 3 ], [ 4, 13 ], [ 5, 11 ], [ 6, 10 ], [ 7, 2 ], 
##            [ infinity, 61 ] ], 
##        [ [ 2, 5 ], [ 3, 82 ], [ 4, 9 ], [ 5, 1 ], [ infinity, 3 ] ], 
##        [ [ 2, 93 ], [ 3, 7 ] ], [ [ 2, 100 ] ] ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("GraphAttributeStatistics");

#E





