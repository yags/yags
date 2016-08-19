
##  
##  Some families of graphs:
##  
############################################################################
##  
#F  DiscreteGraph( <n> )
##  
##  <#GAPDoc Label="DiscreteGraph">
##  <ManSection>
##  <Func Name="DiscreteGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the discrete graph of order <A>n</A>. A discrete graph
##  is a graph without edges.
##  <Index Subkey="discrete">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> DiscreteGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  0, Adjacencies := [ [  ], [  ], [  ], [  ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("DiscreteGraph");

############################################################################
##  
#F  CompleteGraph( <n> )
##  
##  <#GAPDoc Label="CompleteGraph">
##  <ManSection>
##  <Func Name="CompleteGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the complete graph of order <A>n</A>. A complete graph
##  is a graph where all vertices are connected to each other.
##  <Index Subkey="complete">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> CompleteGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CompleteGraph");

############################################################################
##  
#F  PathGraph( <n> )
##  
##  <#GAPDoc Label="PathGraph">
##  <ManSection>
##  <Func Name="PathGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the path graph on <A>n</A> vertices.
##  <Index Subkey="path">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> PathGraph(4);
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("PathGraph");

############################################################################
##  
#F  CycleGraph( <n> )
##  
##  <#GAPDoc Label="CycleGraph">
##  <ManSection>
##  <Func Name="CycleGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the cyclic graph on <A>n</A> vertices.
##  <Index Subkey="cycle">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> CycleGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] 
##   ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CycleGraph");

############################################################################
##  
#F  CubeGraph( <n> )
##  
##  <#GAPDoc Label="CubeGraph">
##  <ManSection>
##  <Func Name="CubeGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the hypercube<Index>hypercube</Index> of dimension
##  <A>n</A>. This is the box product (Cartesian product) of <A>n</A>
##  copies of <M>K_2</M> (an edge).
##  <Index Subkey="cube">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> CubeGraph(3);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  12, Adjacencies := [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], 
##    [ 2, 3, 8 ], [ 1, 6, 7 ], [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CubeGraph");

############################################################################
##  
#F  OctahedralGraph( <n> )
##  
##  <#GAPDoc Label="OctahedralGraph">
##  <ManSection>
##  <Func Name="OctahedralGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Return the <A>n</A>-dimensional octahedron. This is the
##  complement of <A>n</A> copies of <M>K_2</M> (an edge). It is also
##  the <A>(2n-2)</A>-regular graph on <M>2n</M> vertices.
##  <Index Subkey="octahedral">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> OctahedralGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("OctahedralGraph");

############################################################################
##  
#F  JohnsonGraph( <n>, <r> )
##  
##  <#GAPDoc Label="JohnsonGraph">
##  <ManSection>
##  <Func Name="JohnsonGraph" Arg="n, r"/>
##  <Description>
##  
##  <P/>Returns the <E>Johnson graph</E> <M>J(n,r)</M>. The Johnson graph is
##  the graph whose vertices are <A>r</A>-subset of the set <M>\{1, 2,
##  \ldots, n\}</M>, two of them being adjacent iff they intersect in
##  exactly <C><A>r</A>-1</C> elements.
##  <Index Subkey="Johnson">graph</Index>
##  <Index>Johnson graph</Index>
##  
##  <P/>
##  <Example>
##  gap> g:=JohnsonGraph(4,2);                                            
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 1, 3, 4, 6 ], [ 2, 3, 4, 5 ] ] )
##  gap> VertexNames(g);
##  [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 2, 4 ], [ 3, 4 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("JohnsonGraph");

############################################################################
##  
#F  CompleteBipartiteGraph( <n>, <m> )
##  
##  <#GAPDoc Label="CompleteBipartiteGraph">
##  <ManSection>
##  <Func Name="CompleteBipartiteGraph" Arg="n, m"/>
##  <Description>
##  
##  <P/>Returns the complete bipartite whose parts have order <A>n</A>
##  and <A>m</A> respectively.  This is the joint (Zykov sum) of two
##  discrete graphs of order <A>n</A> and <A>m</A>.
##  <Index Subkey="complete bipartite">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> CompleteBipartiteGraph(2,3);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  6, Adjacencies := [ [ 3, 4, 5 ], [ 3, 4, 5 ], [ 1, 2 ], [ 1, 2 ], 
##    [ 1, 2 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CompleteBipartiteGraph");

############################################################################
##  
#F  CompleteMultipartiteGraph( <n1>, <n2> [, <n3> ...] )
##  
##  <#GAPDoc Label="CompleteMultipartiteGraph">
##  <ManSection>
##  <Func Name="CompleteMultipartiteGraph" Arg="n1, n2 [, n3 ...]"/>
##  <Description>
##  
##  <P/>Returns the complete multipartite graph where the orders of
##  the parts are <A>n1</A>, <A>n2</A>, ... It is also the Zykov sum
##  of discrete graphs of order <A>n1</A>, <A>n2</A>, ...
##  <Index Subkey="complete multipartite">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> CompleteMultipartiteGraph(2,2,2);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CompleteMultipartiteGraph");

############################################################################
##  
#F  RandomGraph( <n>, <p> )
#F  RandomGraph( <n> )
##  
##  <#GAPDoc Label="RandomGraph">
##  <ManSection>
##  <Func Name="RandomGraph" Arg="n, p"/>
##  <Func Name="RandomGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns a random graph of order <A>n</A> taking the rational
##  <M>p\in [0,1]</M> as the edge probability.
##  <Index Subkey="random">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> RandomGraph(5,1/3);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 3, 5 ], [ 1, 5 ], [ 1, 4 ], [ 3 ], [ 1, 2 ] 
##   ] )
##  gap> RandomGraph(5,2/3);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  7, Adjacencies := [ [ 2, 3 ], [ 1, 3, 4, 5 ], [ 1, 2, 4, 5 ], 
##    [ 2, 3 ], [ 2, 3 ] ] )
##  gap> RandomGraph(5,1/2);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 5 ], [ 1, 2 ], 
##    [ 3 ] ] )
##  </Example>
##   
##  <P/>If <A>p</A> is omitted, the edge probability is taken to be
##  1/2.
##  
##  <P/>
##  <Example>
##  gap> RandomGraph(5);    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  9, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 5 ], [ 1, 2, 4, 5 ], 
##    [ 1, 3, 5 ], [ 1, 2, 3, 4 ] ] )
##  gap> RandomGraph(5);
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2 ], [ 1, 3, 5 ], [ 2, 4 ], [ 3, 5 ], [ 2, 4 ] 
##   ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("RandomGraph");

############################################################################
##  
#F  CylinderGraph( <b>, <h> )
##  
##  <#GAPDoc Label="CylinderGraph">
##  <ManSection>
##  <Func Name="CylinderGraph" Arg="b, h"/>
##  <Description>
##  
##  <P/>Returns a cylinder of base <A>b</A> and height <A>h</A>.  The
##  order of this graph is <A>b</A>(<A>h</A>+1) and it is constructed
##  by taking <A>h</A>+1 copies of the cyclic graph on <A>b</A>
##  vertices, ordering these cycles linearly and then joining
##  consecutive cycles by a zigzagging (2<A>b</A>)-cycle. This graph
##  is a triangulation of the cylinder where all internal vertices are
##  of degree 6 and the boundary vertices are of degree 4.
##  <Index Subkey="Cylinder">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> g:=CylinderGraph(4,1);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  16, Adjacencies := [ [ 2, 4, 5, 6 ], [ 1, 3, 6, 7 ], [ 2, 4, 7, 8 ], 
##    [ 1, 3, 5, 8 ], [ 1, 4, 6, 8 ], [ 1, 2, 5, 7 ], [ 2, 3, 6, 8 ], 
##    [ 3, 4, 5, 7 ] ] )
##  gap> g:=CylinderGraph(4,2);
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  28, Adjacencies := [ [ 2, 4, 5, 6 ], [ 1, 3, 6, 7 ], [ 2, 4, 7, 8 ], 
##    [ 1, 3, 5, 8 ], [ 1, 4, 6, 8, 9, 10 ], [ 1, 2, 5, 7, 10, 11 ], 
##    [ 2, 3, 6, 8, 11, 12 ], [ 3, 4, 5, 7, 9, 12 ], [ 5, 8, 10, 12 ], 
##    [ 5, 6, 9, 11 ], [ 6, 7, 10, 12 ], [ 7, 8, 9, 11 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("CylinderGraph");

############################################################################
##  
#O  WheelGraph( <n> )
#O  WheelGraph( <n>, <r> )
##  
##  <#GAPDoc Label="WheelGraph">
##  <ManSection>
##  <Oper Name="WheelGraph" Arg="n"/>
##  <Oper Name="WheelGraph" Arg="n, r"/>
##  <Description>
##  
##  <P/>In its first form <C>WheelGraph</C> returns the wheel graph on
##  <A>n</A>+1 vertices. This is the cone of a cycle: a central vertex
##  adjacent to all the vertices of an <A>n</A>-cycle.
##  <Index Subkey="wheel">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> WheelGraph(5);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4, 6 ], [ 1, 2, 5 ] ] )
##  </Example>
##  
##  <P/>In its second form, <C>WheelGraph</C> returns returns the
##  wheel graph, but adding <A>r</A>-1 layers, each layer is a new
##  <A>n</A>-cycle joined to the previous layer by a zigzagging
##  2<A>n</A>-cycle. This graph is a triangulation of the disk.
##  
##  <P/>
##  <Example>
##  gap> WheelGraph(5,2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  25, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 7, 8 ], 
##    [ 1, 2, 4, 8, 9 ], [ 1, 3, 5, 9, 10 ], [ 1, 4, 6, 10, 11 ], 
##    [ 1, 2, 5, 7, 11 ], [ 2, 6, 8, 11 ], [ 2, 3, 7, 9 ], 
##    [ 3, 4, 8, 10 ], [ 4, 5, 9, 11 ], [ 5, 6, 7, 10 ] ] )
##  gap> WheelGraph(5,3);
##  Graph( Category := SimpleGraphs, Order := 16, Size := 
##  40, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 7, 8 ], 
##    [ 1, 2, 4, 8, 9 ], [ 1, 3, 5, 9, 10 ], [ 1, 4, 6, 10, 11 ], 
##    [ 1, 2, 5, 7, 11 ], [ 2, 6, 8, 11, 12, 13 ], [ 2, 3, 7, 9, 13, 14 ],
##    [ 3, 4, 8, 10, 14, 15 ], [ 4, 5, 9, 11, 15, 16 ], 
##    [ 5, 6, 7, 10, 12, 16 ], [ 7, 11, 13, 16 ], [ 7, 8, 12, 14 ], 
##    [ 8, 9, 13, 15 ], [ 9, 10, 14, 16 ], [ 10, 11, 12, 15 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("WheelGraph",[IsInt]);

############################################################################
##  
#F  FanGraph( <n> )
##  
##  <#GAPDoc Label="FanGraph">
##  <ManSection>
##  <Func Name="FanGraph" Arg="n"/>
##  <Description>
##   
##  <P/>Returns the <A>n</A>-fan: The join of a vertex and a
##  <A>(n+1)</A>-path.
##  <Index Subkey="fan">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> FanGraph(4);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4, 6 ], [ 1, 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("FanGraph");

############################################################################
##  
#F  SunGraph( <n> )
##  
##  <#GAPDoc Label="SunGraph">
##  <ManSection>
##  <Func Name="SunGraph" Arg="n"/>
##  <Description>
##  
##  <P/>Returns the <A>n</A>-Sun: A complete graph on <A>n</A>
##  vertices, <M>K_N</M>, with a corona made with a zigzagging
##  2<A>n</A>-cycle glued to a <A>n</A>-cycle of the <M>K_N</M>.
##  <Index Subkey="sun">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> SunGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 2, 6 ], [ 1, 3, 4, 6 ], [ 2, 4 ], 
##    [ 2, 3, 5, 6 ], [ 4, 6 ], [ 1, 2, 4, 5 ] ] )
##  gap> SunGraph(4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  14, Adjacencies := [ [ 2, 8 ], [ 1, 3, 4, 6, 8 ], [ 2, 4 ], 
##    [ 2, 3, 5, 6, 8 ], [ 4, 6 ], [ 2, 4, 5, 7, 8 ], [ 6, 8 ], 
##    [ 1, 2, 4, 6, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("SunGraph");

############################################################################
##  
#F  SpikyGraph( <n> )
##  
##  <#GAPDoc Label="SpikyGraph">
##  <ManSection>
##  <Func Name="SpikyGraph" Arg="n"/>
##  <Description>
##   
##  <P/>The spiky graph is constructed as follows: Take complete graph
##  on <A>n</A> vertices, <M>K_N</M>, and then, for each the <A>n</A>
##  subsets of <M>Vertices(K_n)</M> of order <A>n</A>-1, add an
##  additional vertex which is adjacent precisely to this subset of
##  <M>Vertices(K_n)</M>.
##  <Index Subkey="spiky">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> SpikyGraph(3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  9, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("SpikyGraph");

############################################################################
##  
#F  TorusGraph( <n>, <m> )
##  
##  <#GAPDoc Label="TorusGraph">
##  <ManSection>
##  <Func Name="TorusGraph" Arg="n, m"/>
##  <Description>
##   
##  <P/>Returns (the underlying graph of) a triangulation of the torus
##  on <M>n.m</M> vertices. This graph is constructed using
##  <M>\{1,2,\ldots, n\}\times\{1,2,\ldots, m\}</M> as the vertex set;
##  two of them being adjacent if their difference belongs to
##  <M>\{(1,0),(0,1),(1,1)\}</M> module
##  <M>&ZZ;_n\times&ZZ;_m</M>. Hence, in the category of simple
##  graphs, TorusGraph is a 6-regular graph when <M>n,m\geq 3</M>.
##  <Index Subkey="torus">graph</Index>
##   
##  <P/>
##  <Example>
##  TorusGraph(4,4);
##  Graph( Category := SimpleGraphs, Order := 16, Size := 48, Adjacencies := 
##  [ [ 2, 4, 5, 6, 13, 16 ], [ 1, 3, 6, 7, 13, 14 ], [ 2, 4, 7, 8, 14, 15 ], 
##    [ 1, 3, 5, 8, 15, 16 ], [ 1, 4, 6, 8, 9, 10 ], [ 1, 2, 5, 7, 10, 11 ], 
##    [ 2, 3, 6, 8, 11, 12 ], [ 3, 4, 5, 7, 9, 12 ], [ 5, 8, 10, 12, 13, 14 ], 
##    [ 5, 6, 9, 11, 14, 15 ], [ 6, 7, 10, 12, 15, 16 ], [ 7, 8, 9, 11, 13, 16 ], 
##    [ 1, 2, 9, 12, 14, 16 ], [ 2, 3, 9, 10, 13, 15 ], [ 3, 4, 10, 11, 14, 16 ], 
##    [ 1, 4, 11, 12, 13, 15 ] ] )
##  </Example>
##   
##  <P/>When <M>n,m\geq 4</M>, <C>TorusGraph( <A>n</A>, <A>m</A> )</C>
##  is actually a Whitney triangulation: Every triangle of the graph
##  is a face of the triangulation. The clique behavior of these graphs
##  were extensively studied in <Cite Key="LN99"/>. However, this
##  operation constructs the described graph for all <M>n,m \geq
##  1</M>.
##  
##  <P/>
##  <Example>
##  gap> TorusGraph(2,4);
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  20, Adjacencies := [ [ 2, 4, 5, 6, 8 ], [ 1, 3, 5, 6, 7 ], 
##    [ 2, 4, 6, 7, 8 ], [ 1, 3, 5, 7, 8 ], [ 1, 2, 4, 6, 8 ], 
##    [ 1, 2, 3, 5, 7 ], [ 2, 3, 4, 6, 8 ], [ 1, 3, 4, 5, 7 ] ] )
##  gap> TorusGraph(2,3);
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  15, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 4, 5, 6 ], 
##    [ 1, 2, 4, 5, 6 ], [ 1, 2, 3, 5, 6 ], [ 1, 2, 3, 4, 6 ], 
##    [ 1, 2, 3, 4, 5 ] ] )
##  </Example>
##   
##  <P/>Note that in these cases, <C>TorusGraph( <A>n</A>, <A>m</A>
##  )</C> is not 6-regular nor a Whitney triangulation.
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("TorusGraph");

############################################################################
##  
#O  TreeGraph( <arity>, <depth> ) 
#O  TreeGraph( <ArityList> )
##  
##  <#GAPDoc Label="TreeGraph">
##  <ManSection>
##  <Oper Name="TreeGraph" Arg="arity, depth"/>
##  <Oper Name="TreeGraph" Arg="ArityList"/>
##  <Description>
##  
##  <P/>Returns a tree, a connected cycle-free graph. In its second
##  form, the vertices at height <A>k</A> (the root vertex has height
##  1 here) have <C>ArityList[<A>k</A>]</C> children.  In its first
##  form, all vertices, but the leaves, have <A>arity</A> children and
##  the height of the leaves is <A>depth</A>+1.
##  <Index Subkey="tree">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> TreeGraph(2,3);                                                  
##  Graph( Category := SimpleGraphs, Order := 15, Size := 
##  14, Adjacencies := [ [ 2, 3 ], [ 1, 4, 5 ], [ 1, 6, 7 ], [ 2, 8, 9 ], 
##    [ 2, 10, 11 ], [ 3, 12, 13 ], [ 3, 14, 15 ], [ 4 ], [ 4 ], [ 5 ], 
##    [ 5 ], [ 6 ], [ 6 ], [ 7 ], [ 7 ] ] )
##  gap> TreeGraph([3,2,2]);
##  Graph( Category := SimpleGraphs, Order := 22, Size := 
##  21, Adjacencies := [ [ 2, 3, 4 ], [ 1, 5, 6 ], [ 1, 7, 8 ], 
##    [ 1, 9, 10 ], [ 2, 11, 12 ], [ 2, 13, 14 ], [ 3, 15, 16 ], 
##    [ 3, 17, 18 ], [ 4, 19, 20 ], [ 4, 21, 22 ], [ 5 ], [ 5 ], [ 6 ], 
##    [ 6 ], [ 7 ], [ 7 ], [ 8 ], [ 8 ], [ 9 ], [ 9 ], [ 10 ], [ 10 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("TreeGraph",[IsList]);

############################################################################
##  
#O  RandomCirculant( <n> )
#O  RandomCirculant( <n>, <k>)
#O  RandomCirculant( <n>, <p>)
##  
##  <#GAPDoc Label="RandomCirculant">
##  <ManSection>
##  <Oper Name="RandomCirculant" Arg="n"/>
##  <Oper Name="RandomCirculant" Arg="n, k"/>
##  <Oper Name="RandomCirculant" Arg="n, p"/>
##  <Description>
##   
##  <P/>Returns a circulant on <A>n</A> vertices with its <A>jumps</A>
##  selected randomly.  In its third form, each possible jump has
##  probability <A>p</A> of being selected.  In its second form, when
##  <A>k</A> is a positive integer, exactly <A>k</A> jumps are
##  selected (provided there are at least <A>k</A> possible jumps to
##  select from).  The first form is equivalent to specifying
##  <A>p</A>=1/2.
##  <Index Subkey="random">circulant</Index>
##   
##  <P/>
##  <Example>
##  gap> RandomCirculant(11,2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  22, Adjacencies := [ [ 5, 6, 7, 8 ], [ 6, 7, 8, 9 ], [ 7, 8, 9, 10 ], 
##    [ 8, 9, 10, 11 ], [ 1, 9, 10, 11 ], [ 1, 2, 10, 11 ], 
##    [ 1, 2, 3, 11 ], [ 1, 2, 3, 4 ], [ 2, 3, 4, 5 ], [ 3, 4, 5, 6 ], 
##    [ 4, 5, 6, 7 ] ] )
##  gap> RandomCirculant(11,2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  22, Adjacencies := [ [ 2, 3, 10, 11 ], [ 1, 3, 4, 11 ], 
##    [ 1, 2, 4, 5 ], [ 2, 3, 5, 6 ], [ 3, 4, 6, 7 ], [ 4, 5, 7, 8 ], 
##    [ 5, 6, 8, 9 ], [ 6, 7, 9, 10 ], [ 7, 8, 10, 11 ], [ 1, 8, 9, 11 ], 
##    [ 1, 2, 9, 10 ] ] )
##  gap> RandomCirculant(11,1/2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  44, Adjacencies := 
##  [ [ 2, 4, 5, 6, 7, 8, 9, 11 ], [ 1, 3, 5, 6, 7, 8, 9, 10 ], 
##    [ 2, 4, 6, 7, 8, 9, 10, 11 ], [ 1, 3, 5, 7, 8, 9, 10, 11 ], 
##    [ 1, 2, 4, 6, 8, 9, 10, 11 ], [ 1, 2, 3, 5, 7, 9, 10, 11 ], 
##    [ 1, 2, 3, 4, 6, 8, 10, 11 ], [ 1, 2, 3, 4, 5, 7, 9, 11 ], 
##    [ 1, 2, 3, 4, 5, 6, 8, 10 ], [ 2, 3, 4, 5, 6, 7, 9, 11 ], 
##    [ 1, 3, 4, 5, 6, 7, 8, 10 ] ] )
##  gap> RandomCirculant(11,1/2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  11, Adjacencies := [ [ 5, 8 ], [ 6, 9 ], [ 7, 10 ], [ 8, 11 ], 
##    [ 1, 9 ], [ 2, 10 ], [ 3, 11 ], [ 1, 4 ], [ 2, 5 ], [ 3, 6 ], 
##    [ 4, 7 ] ] )
##  gap> RandomCirculant(11,1/2);
##  Graph( Category := SimpleGraphs, Order := 11, Size := 
##  33, Adjacencies := [ [ 2, 3, 6, 7, 10, 11 ], [ 1, 3, 4, 7, 8, 11 ], 
##    [ 1, 2, 4, 5, 8, 9 ], [ 2, 3, 5, 6, 9, 10 ], [ 3, 4, 6, 7, 10, 11 ],
##    [ 1, 4, 5, 7, 8, 11 ], [ 1, 2, 5, 6, 8, 9 ], [ 2, 3, 6, 7, 9, 10 ], 
##    [ 3, 4, 7, 8, 10, 11 ], [ 1, 4, 5, 8, 9, 11 ], 
##    [ 1, 2, 5, 6, 9, 10 ] ] )
##  </Example>
## 
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("RandomCirculant",[IsInt,IsRat]);

############################################################################
##   
#O  ClockworkGraph( <NNFSList> )
#O  ClockworkGraph( <NNFSList>, <rank> )
#O  ClockworkGraph( <NNFSList>, <Perm> )
#O  ClockworkGraph( <NNFSList>, <rank>, <Perm> )
##  
##  <#GAPDoc Label="ClockworkGraph">
##  <ManSection>
##  <Oper Name="ClockworkGraph" Arg="NNFSList"/>
##  <Oper Name="ClockworkGraph" Arg="NNFSList, rank"/>
##  <Oper Name="ClockworkGraph" Arg="NNFSList, Perm"/>
##  <Oper Name="ClockworkGraph" Arg="NNFSList, rank, Perm"/>
##  <Description>
##   
##  <P/>Returns the clockwork graph <Cite Key="LN02"/><Cite
##  Key="LNP04"/> specified by its parameters.
##  <Index Subkey="clockwork">graph</Index>
##   
##  <P/>Clockwork graphs have been very useful in constructing
##  examples and counter-examples in clique graph theory. In
##  particular, they have been used to construct examples of
##  clique-periodic graphs of all possible periods <Cite
##  Key="Esc73"/>, clique-divergent graphs of linear and polynomial
##  growth rate <Cite Key="LN97"/><Cite Key="LN02"/>,
##  clique-convergent graphs whose period is not invariant under
##  removal of dominated vertices <Cite Key="FNP04"/>,
##  clique-convergent graphs which become clique-divergent by just
##  gluing a 4-cycle to a vertex <Cite Key="FLNP13"/>, rank-divergent
##  graphs <Cite Key="LNP06"/>, etc.
##  
##  <P/>A clockwork graph consists of two parts: the crown and the
##  core, both of them are <E>cyclically segmented</E>. When not
##  specified, the <A>rank</A> is assumed to be 2 and the <E>return
##  permutation</E>, <A>Perm</A>, is assumed to be trivial, let us
##  assume this is our case.  Consider the following examples:
##  
##  <P/>
##  <Example>
##  gap> ClockworkGraph([[0],[0],[0],[0]]);
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  28, Adjacencies := [ [ 2, 3, 4, 10, 12 ], [ 1, 3, 5, 11, 12 ], 
##    [ 1, 2, 4, 5 ], [ 1, 3, 5, 6, 7 ], [ 2, 3, 4, 6, 8 ], 
##    [ 4, 5, 7, 8 ], [ 4, 6, 8, 9, 10 ], [ 5, 6, 7, 9, 11 ], 
##    [ 7, 8, 10, 11 ], [ 1, 7, 9, 11, 12 ], [ 2, 8, 9, 10, 12 ], 
##    [ 1, 2, 10, 11 ] ] )
##  gap> ClockworkGraph([[1],[1],[1],[1]]);
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  32, Adjacencies := [ [ 2, 3, 4, 10, 12 ], [ 1, 3, 5, 11, 12 ], 
##    [ 1, 2, 4, 5, 6, 12 ], [ 1, 3, 5, 6, 7 ], [ 2, 3, 4, 6, 8 ], 
##    [ 3, 4, 5, 7, 8, 9 ], [ 4, 6, 8, 9, 10 ], [ 5, 6, 7, 9, 11 ], 
##    [ 6, 7, 8, 10, 11, 12 ], [ 1, 7, 9, 11, 12 ], [ 2, 8, 9, 10, 12 ], 
##    [ 1, 2, 3, 9, 10, 11 ] ] )
##  </Example>
##  
##  <P/>In both cases, the crown is the subgraph induced by the
##  vertices <M>\{1,2,4,5,7,8,10,11\}</M> and the core is induced by
##  <M>\{3,6,9,12\}</M>. Also in both cases the cyclic segmentations
##  (partitions) of the crown and the core are
##  <M>\{\{1,2\},\{4,5\},\{7,8\},\{10,11\}\}</M> and
##  <M>\{\{3\},\{6\},\{9\},\{12\}\}</M> respectively. The number of
##  segments <A>s</A> is specified by
##  <C><A>s</A>:=Length(<A>NNFSList</A>)</C> which is 4 in these
##  cases. The crown is isomorphic to
##  <C>BoxProduct(CycleGraph(<A>s</A>),Completegraph(<A>rank</A>))</C>:
##  All the crown segments are complete subgraphs and the vertices of
##  cyclically consecutive segments are joined by a perfect matching.
##  The adjacencies between crown and core vertices are simple to
##  describe: Cyclically intercalate crown and core segments, making
##  each core vertex adjacent to the vertices in the previous and the
##  following crown segments. Hence in our examples vertex 3 is
##  adjacent to vertices 1 and 2 (previous segment), but also 4 and 5
##  (following segment).  Note that since the segmentations and
##  intercalations are <A>cyclic</A>, we have that vertex 12 is
##  adjacent to 10 and 11, but also to 1 and 2. Finally the edges
##  between core vertices are as follows: first each core segment is a
##  complete subgraph; the vertices within each core segment are
##  linearly ordered and for vertex number <A>t</A> in segment number
##  <A>s</A> there is a non-negative integer
##  <C><A>NNFSList</A>[s][t]</C> which specifies, the <A>Number of
##  Neighbors in the Following core Segment</A> for that vertex (hence
##  the name <A>NNFSList</A>) (Since the vertices in core segments are
##  linearly ordered, it is enough to specify the <A>number</A> of
##  neighbors in the following segment and the <A>first</A> ones of
##  those are selected as the neighbors). Hence in our two examples
##  above, each core segment consists of exactly one vertex. In the
##  first example each core segment is adjacent to no vertex in the
##  following segment (e.g. 3 is not adjacent to 6) but in the second
##  one, each core segment is adjacent to exactly one vertex in the
##  following segment (e.g. 3 is adjacent to 6).
##  
##  <P/>A more complicated example should be now mostly
##  self-explanatory:
##   
##  <P/>
##  <Example>
##  gap> ClockworkGraph([[2],[0,1,3],[0,1,1],[1]]);
##  Graph( Category := SimpleGraphs, Order := 16, Size := 
##  59, Adjacencies := [ [ 2, 3, 4, 14, 16 ], [ 1, 3, 5, 15, 16 ], 
##    [ 1, 2, 4, 5, 6, 7, 16 ], [ 1, 3, 5, 6, 7, 8, 9 ], 
##    [ 2, 3, 4, 6, 7, 8, 10 ], [ 3, 4, 5, 7, 8, 9, 10 ], 
##    [ 3, 4, 5, 6, 8, 9, 10, 11 ], [ 4, 5, 6, 7, 9, 10, 11, 12, 13 ], 
##    [ 4, 6, 7, 8, 10, 11, 12, 13, 14 ], 
##    [ 5, 6, 7, 8, 9, 11, 12, 13, 15 ], [ 7, 8, 9, 10, 12, 13, 14, 15 ], 
##    [ 8, 9, 10, 11, 13, 14, 15, 16 ], [ 8, 9, 10, 11, 12, 14, 15, 16 ], 
##    [ 1, 9, 11, 12, 13, 15, 16 ], [ 2, 10, 11, 12, 13, 14, 16 ], 
##    [ 1, 2, 3, 12, 13, 14, 15 ] ] )
##  </Example>
##  
##  <P/>The crown and core segmentations are
##  <M>\{\{1,2\},\{4,5\},\{9,10\},\{14,15\}\}</M> and
##  <M>\{\{3\},\{6,7,8\},\{11,12,13\},\{16\}\}</M> respectively and
##  the adjacencies specified by the <A>NNFSList</A> are: 3 is
##  adjacent to 6 and 7; 6 is adjacent to none (in the following core
##  segment); 7 is adjacent to 11; 8 to 11, 12 and 13; 11 to none; 12
##  to 16; 13 to 16 and 16 to 3.
##   
##  <P/>When <A>rank</A> and/or <A>Perm</A> are specified, they have
##  the following effects: <A>rank</A> (which must be at least 2) is
##  the number of vertices in each crown segment, and <A>Perm</A>
##  (which must belong to SymmetricGroup( <A>rank</A> )) specifies the
##  perfect matching joining the vertices in the last crown segment
##  with the vertices in the first crown segment: The <A>k</A>-th
##  vertex in the last crown segment <M>k\in \{1,2,\ldots,rank\}</M>
##  is made adjacent to the <M>Perm(k)</M>-th vertex of the first
##  crown segment.
##   
##  <P/>A number of requisites are put forward in the literature for a
##  graph to be a clockwork graph but this operation does not enforce
##  those conditions, on the contrary, it tries to make sense of the
##  data provided as much as possible.  For instance
##  <C><A>NNFSList</A>:=[[2],[2],[2],[2]]</C> would be inconsistent
##  since there are not enough vertices in each core segment to
##  provide for the required 2 neighbors. However, the result is just
##  the same as with <C><A>NNFSList</A>:=[[1],[1],[1],[1]]</C>. The
##  requisites that are mandatory are exactly these: the <A>rank</A>
##  must be at least 2, <A>Perm</A> must belong to
##  SymmetricGroup(<A>rank</A>), <A>NNFSList</A> must be a list of
##  lists of non-negative integers, and the number of segments (=
##  Length(<A>NNFSList</A>)) must be at least 3. A call to
##  ClockworkGraph which fails to conform to these requisites will
##  produce an error.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("ClockworkGraph",[IsList,IsInt,IsPerm]);

############################################################################
##  
#V  TrivialGraph
##  
##  <#GAPDoc Label="TrivialGraph">
##  <ManSection>
##  <Var Name="TrivialGraph"/>
##  <Description>
##  
##  <P/>The one vertex graph.
##  <Index Subkey="trivial">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> TrivialGraph;
##  Graph( Category := SimpleGraphs, Order := 1, Size := 
##  0, Adjacencies := [ [  ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("TrivialGraph");

############################################################################
##  
#V  DiamondGraph
##  
##  <#GAPDoc Label="DiamondGraph">
##  <ManSection>
##  <Var Name="DiamondGraph"/>
##  <Description>
##  
##  <P/>The graph on 4 vertices and 5 edges.
##  <Index Subkey="diamond">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> DiamondGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  5, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3 ], [ 1, 2, 4 ], [ 1, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("DiamondGraph");

############################################################################
##  
#V  ClawGraph
##  
##  <#GAPDoc Label="ClawGraph">
##  <ManSection>
##  <Var Name="ClawGraph"/>
##  <Description>
##  
##  <P/>The graph on 4 vertices, 3 edges, and maximum degree 3.
##  <Index Subkey="claw">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> ClawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2, 3, 4 ], [ 1 ], [ 1 ], [ 1 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("ClawGraph");

############################################################################
##  
#V  PawGraph
##  
##  <#GAPDoc Label="PawGraph">
##  <ManSection>
##  <Var Name="PawGraph"/>
##  <Description>
##  
##  <P/>The graph on 4 vertices, 4 edges and maximum degree 3: A
##  triangle with a pendant vertex.
##  <Index Subkey="paw">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> PawGraph;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3, 4 ], [ 2, 4 ], [ 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("PawGraph");

############################################################################
##  
#V  HouseGraph
##  
##  <#GAPDoc Label="HouseGraph">
##  <ManSection>
##  <Var Name="HouseGraph"/>
##  <Description>
##  
##  <P/>A 4-cycle and a triangle glued by an edge.
##  <Index Subkey="house">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> HouseGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  6, Adjacencies := [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], 
##    [ 1, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("HouseGraph");

############################################################################
##  
#V  BullGraph
##  
##  <#GAPDoc Label="BullGraph">
##  <ManSection>
##  <Var Name="BullGraph"/>
##  <Description>
##  
##  <P/>A triangle with two pendant vertices (horns).
##  <Index Subkey="bull">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> BullGraph;    
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2 ], [ 1, 3, 4 ], [ 2, 4 ], [ 2, 3, 5 ], [ 4 ] 
##   ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("BullGraph");

############################################################################
##  
#V  AntennaGraph
##  
##  <#GAPDoc Label="AntennaGraph">
##  <ManSection>
##  <Var Name="AntennaGraph"/>
##  <Description>
##  
##  <P/>A <C>HouseGraph</C> with a pendant vertex (antenna) on the
##  roof.
##  <Index Subkey="antenna">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> AntennaGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 5 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], 
##    [ 1, 4, 6 ], [ 5 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("AntennaGraph");

############################################################################
##  
#V  KiteGraph
##  
##  <#GAPDoc Label="KiteGraph">
##  <ManSection>
##  <Var Name="KiteGraph"/>
##  <Description>
##   
##  <P/>A diamond (see <Ref Var="DiamondGraph"/>) with a pendant vertex and maximum degree 3.
##  <Index Subkey="kite">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> KiteGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  6, Adjacencies := [ [ 2 ], [ 1, 3, 4 ], [ 2, 4, 5 ], [ 2, 3, 5 ], 
##    [ 3, 4 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("KiteGraph");

############################################################################
##  
#V  DartGraph
##  
##  <#GAPDoc Label="DartGraph">
##  <ManSection>
##  <Var Name="DartGraph"/>
##  <Description>
##   
##  <P/>A diamond with a pendant vertex and maximum degree 4.
##  <Index Subkey="dart">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> DartGraph; 
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  6, Adjacencies := [ [ 2 ], [ 1, 3, 4, 5 ], [ 2, 4, 5 ], [ 2, 3 ], 
##    [ 2, 3 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("DartGraph");

############################################################################
##  
#V  ChairGraph
##  
##  <#GAPDoc Label="ChairGraph">
##  <ManSection>
##  <Var Name="ChairGraph"/>
##  <Description>
##   
##  <P/>The tree with degree sequence 3,2,1,1,1.
##  <Index Subkey="chair">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> ChairGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3, 4 ], [ 2 ], [ 2, 5 ], [ 4 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("ChairGraph");

############################################################################
##  
#V  GemGraph
##  
##  <#GAPDoc Label="GemGraph">
##  <ManSection>
##  <Var Name="GemGraph"/>
##  <Description>
##   
##  <P/>The 3-fan graph.
##  <Index Subkey="gem">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> GemGraph;
##  Graph( Category := SimpleGraphs, Order := 5, Size := 
##  7, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3 ], [ 1, 2, 4 ], 
##    [ 1, 3, 5 ], [ 1, 4 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("GemGraph");

############################################################################
##  
#V  AGraph
##  
##  <#GAPDoc Label="AGraph">
##  <ManSection>
##  <Var Name="AGraph"/>
##  <Description>
##   
##  <P/>A 4-cycle with two pendant vertices on consecutive vertices of
##  the cycle.
##  <Index Subkey="A">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> AGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  6, Adjacencies := [ [ 2 ], [ 1, 3, 5 ], [ 2, 4 ], [ 3, 5 ], 
##    [ 2, 4, 6 ], [ 5 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("AGraph");

############################################################################
##  
#V  DominoGraph
##  
##  <#GAPDoc Label="DominoGraph">
##  <ManSection>
##  <Var Name="DominoGraph"/>
##  <Description>
##   
##  <P/>Two squares glued by an edge.
##  <Index Subkey="domino">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> DominoGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 4, 6 ], [ 1, 3 ], [ 2, 4 ], [ 1, 3, 5 ], 
##    [ 4, 6 ], [ 1, 5 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("DominoGraph");

############################################################################
##  
#V  ParapluieGraph
##  
##  <#GAPDoc Label="ParapluieGraph">
##  <ManSection>
##  <Var Name="ParapluieGraph"/>
##  <Description>
##   
##  <P/>A 3-fan graph with a 3-path attached to the universal vertex.
##  <Index Subkey="parapluie">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> ParapluieGraph;
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  9, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4, 5, 6, 7 ], [ 3, 5 ], 
##    [ 3, 4, 6 ], [ 3, 5, 7 ], [ 3, 6 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("ParapluieGraph");

############################################################################
##  
#V  ParachuteGraph
##  
##  <#GAPDoc Label="ParachuteGraph">
##  <ManSection>
##  <Var Name="ParachuteGraph"/>
##  <Description>
##   
##  <P/>The complement of a <C>ParapluieGraph</C>; The suspension of a
##  4-path with a pendant vertex attached to the south pole.
##  <Index Subkey="parachute">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> ParachuteGraph;
##  Graph( Category := SimpleGraphs, Order := 7, Size := 
##  12, Adjacencies := [ [ 2 ], [ 1, 3, 4, 5, 6 ], [ 2, 4, 7 ], 
##    [ 2, 3, 5, 7 ], [ 2, 4, 6, 7 ], [ 2, 5, 7 ], [ 3, 4, 5, 6 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("ParachuteGraph");

############################################################################
##  
#V  FishGraph
##  
##  <#GAPDoc Label="FishGraph">
##  <ManSection>
##  <Var Name="FishGraph"/>
##  <Description>
##   
##  <P/>A square and a triangle glued by a vertex.
##  <Index Subkey="fish">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> FishGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  7, Adjacencies := [ [ 2, 3, 4, 6 ], [ 1, 3 ], [ 1, 2 ], [ 1, 5 ], 
##    [ 4, 6 ], [ 1, 5 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("FishGraph");

############################################################################
##  
#V  RGraph
##  
##  <#GAPDoc Label="RGraph">
##  <ManSection>
##  <Var Name="RGraph"/>
##  <Description>
##   
##  <P/>A square with two pendant vertices attached to the same vertex
##  of the square.
##  <Index Subkey="R">graph</Index>
##   
##  <P/>
##  <Example>
##  gap> RGraph;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  6, Adjacencies := [ [ 2 ], [ 1, 3, 5, 6 ], [ 2, 4 ], [ 3, 5 ], 
##    [ 2, 4 ], [ 2 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("RGraph");


############################################################################
##  
#V  Tetrahedron
##  
##  <#GAPDoc Label="Tetrahedron">
##  <ManSection>
##  <Var Name="Tetrahedron"/>
##  <Description>
##  
##  <P/>The 1-skeleton of Plato's tetrahedron.
##  
##  <P/>
##  <Example>
##  gap> Tetrahedron;
##  Graph( Category := SimpleGraphs, Order := 4, Size := 
##  6, Adjacencies := [ [ 2, 3, 4 ], [ 1, 3, 4 ], [ 1, 2, 4 ], 
##    [ 1, 2, 3 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("Tetrahedron");

############################################################################
##  
#V  Octahedron
##  
##  <#GAPDoc Label="Octahedron">
##  <ManSection>
##  <Var Name="Octahedron"/>
##  <Description>
##  
##  <P/>The 1-skeleton of Plato's octahedron.
##  
##  <P/>
##  <Example>
##  gap> Octahedron;
##  Graph( Category := SimpleGraphs, Order := 6, Size := 
##  12, Adjacencies := [ [ 3, 4, 5, 6 ], [ 3, 4, 5, 6 ], [ 1, 2, 5, 6 ], 
##    [ 1, 2, 5, 6 ], [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("Octahedron");

############################################################################
##  
#V  Cube
##  
##  <#GAPDoc Label="Cube">
##  <ManSection>
##  <Var Name="Cube"/>
##  <Description>
##  
##  <P/>The 1-skeleton of Plato's cube.
##  
##  <P/>
##  <Example>
##  gap> Cube;
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  12, Adjacencies := [ [ 2, 3, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], 
##    [ 2, 3, 8 ], [ 1, 6, 7 ], [ 2, 5, 8 ], [ 3, 5, 8 ], [ 4, 6, 7 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("Cube");

############################################################################
##  
#V  Icosahedron
##  
##  <#GAPDoc Label="Icosahedron">
##  <ManSection>
##  <Var Name="Icosahedron"/>
##  <Description>
##  
##  <P/>The 1-skeleton of Plato's icosahedron.
##  
##  <P/>
##  <Example>
##  gap> Icosahedron;
##  Graph( Category := SimpleGraphs, Order := 12, Size := 
##  30, Adjacencies := [ [ 2, 3, 4, 5, 6 ], [ 1, 3, 6, 9, 10 ], 
##    [ 1, 2, 4, 10, 11 ], [ 1, 3, 5, 7, 11 ], [ 1, 4, 6, 7, 8 ], 
##    [ 1, 2, 5, 8, 9 ], [ 4, 5, 8, 11, 12 ], [ 5, 6, 7, 9, 12 ], 
##    [ 2, 6, 8, 10, 12 ], [ 2, 3, 9, 11, 12 ], [ 3, 4, 7, 10, 12 ], 
##    [ 7, 8, 9, 10, 11 ] ] )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("Icosahedron");

############################################################################
##  
#V  Dodecahedron
##  
##  <#GAPDoc Label="Dodecahedron">
##  <ManSection>
##  <Var Name="Dodecahedron"/>
##  <Description>
##   
##  <P/>The 1-skeleton of Plato's Dodecahedron.
##  
##  <P/>
##  <Example>
##  gap> Dodecahedron;
##  Graph( Category := SimpleGraphs, Order := 20, Size := 
##  30, Adjacencies := [ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], 
##    [ 3, 5, 9 ], [ 1, 4, 10 ], [ 1, 11, 15 ], [ 2, 11, 12 ], 
##    [ 3, 12, 13 ], [ 4, 13, 14 ], [ 5, 14, 15 ], [ 6, 7, 16 ], 
##    [ 7, 8, 17 ], [ 8, 9, 18 ], [ 9, 10, 19 ], [ 6, 10, 20 ], 
##    [ 11, 17, 20 ], [ 12, 16, 18 ], [ 13, 17, 19 ], [ 14, 18, 20 ], 
##    [ 15, 16, 19 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("Dodecahedron");

############################################################################
##  
#V  SnubDisphenoid
##  
##  <#GAPDoc Label="SnubDisphenoid">
##  <ManSection>
##  <Var Name="SnubDisphenoid"/>
##  <Description>
##  
##  <P/>The 1-skeleton of the 84th Johnson solid.
##  
##  <P/>
##  <Example>
##  gap> SnubDisphenoid;
##  Graph( Category := SimpleGraphs, Order := 8, Size := 
##  18, Adjacencies := [ [ 2, 3, 4, 5, 8 ], [ 1, 3, 6, 7, 8 ], 
##    [ 1, 2, 4, 6 ], [ 1, 3, 5, 6 ], [ 1, 4, 6, 7, 8 ], 
##    [ 2, 3, 4, 5, 7 ], [ 2, 5, 6, 8 ], [ 1, 2, 5, 7 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("SnubDisphenoid");

############################################################################
##  
#V  PetersenGraph
##  
##  <#GAPDoc Label="PetersenGraph">
##  <ManSection>
##  <Var Name="PetersenGraph"/>
##  <Description>
##  
##  <P/>The 3-regular graph on 10 vertices having girth 5.
##  <Index Subkey="Petersen's">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> PetersenGraph;  
##  Graph( Category := SimpleGraphs, Order := 10, Size := 
##  15, Adjacencies := [ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], 
##    [ 3, 5, 9 ], [ 1, 4, 10 ], [ 1, 8, 9 ], [ 2, 9, 10 ], [ 3, 6, 10 ], 
##    [ 4, 6, 7 ], [ 5, 7, 8 ] ] )
##  </Example>
##   
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable("PetersenGraph");
#E
