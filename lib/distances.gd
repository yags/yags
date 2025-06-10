
############################################################################
##  
#A  DistanceMatrix( <G> )
##  
##  <#GAPDoc Label="DistanceMatrix">
##  <ManSection>
##  <Attr Name="DistanceMatrix" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the distance matrix <C>D</C> of a graph <A>G</A>:
##  <C>D[x][y]</C> is the distance in <A>G</A> from vertex <C>x</C> to
##  vertex <C>y</C>. The matrix may be asymmetric if the graph is not
##  simple.  An infinite entry in the matrix means that there is no
##  path between the vertices.  Floyd's algorithm is used to compute
##  the matrix.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(4);
##  Graph( rec( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] ) )
##  gap> Display(DistanceMatrix(g));
##  [ [  0,  1,  2,  3 ],
##    [  1,  0,  1,  2 ],
##    [  2,  1,  0,  1 ],
##    [  3,  2,  1,  0 ] ]
##  gap> g:=PathGraph(4:GraphCategory:=OrientedGraphs);
##  Graph( rec( Category := OrientedGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 3 ], [ 4 ], [  ] ] ) )
##  gap> Display(DistanceMatrix(g));                   
##  [ [         0,         1,         2,         3 ],
##    [  infinity,         0,         1,         2 ],
##    [  infinity,  infinity,         0,         1 ],
##    [  infinity,  infinity,  infinity,         0 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("DistanceMatrix",Graphs);
    
############################################################################
##  
#A  Diameter( <G> )
##  
##  <#GAPDoc Label="Diameter">
##  <ManSection>
##  <Attr Name="Diameter" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the maximum among the distances between pairs of
##  vertices of <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(5);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] 
##   ] ) )
##  gap> Diameter(g);
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("YAGSDiameter",Graphs); #this is to avoid name clashes with GAP4.9.1.
DeclareOperation("Diameter",[Graphs]);
    
############################################################################
##  
#A  Radius( <G> )
##  
##  <#GAPDoc Label="Radius">
##  <ManSection>
##  <Attr Name="Radius" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the minimal eccentricity among the vertices of the graph
##  <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> Radius(PathGraph(5)); 
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("Radius",Graphs);
    
############################################################################
##  
#O  Distance( <G>, <x>, <y> )
##  
##  <#GAPDoc Label="Distance">
##  <ManSection>
##  <Oper Name="Distance" Arg="G, x, y"/>
##  <Description>
##  
##  <P/>Returns the minimum length of a path connecting <A>x</A> to
##  <A>y</A> in <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> Distance(CycleGraph(5),1,3);
##  2
##  gap> Distance(CycleGraph(5),1,5);
##  1
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Distance",[Graphs,IsInt,IsInt]);
    
############################################################################
##  
#O  Distances( <G>, <A>, <B> )
##  
##  <#GAPDoc Label="Distances">
##  <ManSection>
##  <Oper Name="Distances" Arg="G, A, B"/>
##  <Description>
##  
##  <P/>Given two lists of vertices <A>A</A>, <A>B</A> of a graph
##  <A>G</A>, <C>Distances</C> returns the list of distances for every
##  pair in the Cartesian product of <A>A</A> and <A>B</A>. The order
##  of the vertices in lists <A>A</A> and <A>B</A> affects the order
##  of the list of distances returned.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(5);;
##  gap> Distances(g, [1,3], [2,4]);
##  [ 1, 2, 1, 1 ]
##  gap> Distances(g, [3,1], [2,4]);
##  [ 1, 1, 1, 2 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Distances",[Graphs,IsList,IsList]);
    
############################################################################
##  
#O  DistanceSet( <G>, <A>, <B> )
##  
##  <#GAPDoc Label="DistanceSet">
##  <ManSection>
##  <Oper Name="DistanceSet" Arg="G, A, B"/>
##  <Description>
##  
##  <P/>Given two subsets of vertices <A>A</A>, <A>B</A> of a graph
##  <A>G</A>, <C>DistanceSet</C> returns the set of distances for
##  every pair in the Cartesian product of <A>A</A> and <A>B</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(5);;         
##  gap> DistanceSet(g, [1,3], [2,4]);
##  [ 1, 2 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("DistanceSet",[Graphs,IsList,IsList]);
    
############################################################################
##  
#O  DistanceGraph( <G>, <Dist> )
##  
##  <#GAPDoc Label="DistanceGraph">
##  <ManSection>
##  <Oper Name="DistanceGraph" Arg="G, Dist"/>
##  <Description>
##  
##  <P/>Given a graph <A>G</A> and a list of distances <A>Dist</A>,
##  <C>DistanceGraph</C> returns the new graph constructed on the
##  vertices of <A>G</A> where two vertices are adjacent iff the
##  distance (in <A>G</A>) between them belongs to the list
##  <A>Dist</A>.
##  <Index Subkey="distance">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> g:=CycleGraph(5);            
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 2, 5 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 1, 4 ] 
##   ] ) )
##  gap> DistanceGraph(g,[2]);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  5, Adjacencies := [ [ 3, 4 ], [ 4, 5 ], [ 1, 5 ], [ 1, 2 ], [ 2, 3 ] 
##   ] ) )
##  gap> DistanceGraph(g,[1,2]);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  10, Adjacencies := [ [ 2, 3, 4, 5 ], [ 1, 3, 4, 5 ], [ 1, 2, 4, 5 ], 
##    [ 1, 2, 3, 5 ], [ 1, 2, 3, 4 ] ] ) )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("DistanceGraph",[Graphs,IsList]);
    
############################################################################
##  
#O  PowerGraph( <G>, <exp> )
##  
##  <#GAPDoc Label="PowerGraph">
##  <ManSection>
##  <Oper Name="PowerGraph" Arg="G, exp"/>
##  <Description>
##  
##  <P/>Returns the <Ref Func="DistanceGraph"/> of <A>G</A> using <C>[0, 1,
##  ..., <A>exp</A>]</C> as the list of distances.  Note that the
##  distance <C>0</C> in the list produces loops in the new graph only
##  when the <C>TargetGraphCategory</C> admits loops.
##  <Index Subkey="power">graph</Index>
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(5);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] ) )
##  gap> PowerGraph(g,1);                      
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] ) )
##  gap> PowerGraph(g,1:GraphCategory:=Graphs);
##  Graph( rec( Category := Graphs, Order := 5, Size := 
##  13, Adjacencies := [ [ 1, 2 ], [ 1, 2, 3 ], [ 2, 3, 4 ], [ 3, 4, 5 ], 
##    [ 4, 5 ] ] ) )
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("PowerGraph",[Graphs,IsInt]);
    
############################################################################
##  
#F  Eccentricity( <G>, <x> )
##  
##  <#GAPDoc Label="Eccentricity">
##  <ManSection>
##  <Func Name="Eccentricity" Arg="G, x"/>
##  <Description>
##  
##  <P/>Returns the distance from a vertex <A>x</A> in graph <A>G</A>
##  to its most distant vertex in <A>G</A>.
##  
##  <P/>
##  <Example>
##  gap> g:=PathGraph(5);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] ) )
##  gap> Eccentricity(g,1);           
##  4
##  gap> Eccentricity(g,3);
##  2
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction("Eccentricity");
    
############################################################################
##  
#A  Girth( <G> )
##  
##  <#GAPDoc Label="Girth">
##  <ManSection>
##  <Attr Name="Girth" Arg="G"/>
##  <Description>
##  
##  <P/>Returns the length of a minimum cycle in <A>G</A>. At this
##  time, <C>Girth</C> is defined only for <Ref Func="SimpleGraphs"/> and
##  <Ref Func="UndirectedGraphs"/>. If <A>G</A> has loops, its girth is 1 by
##  definition.
##  
##  <P/>
##  <Example>
##  gap> Girth(Octahedron);
##  3
##  gap> Girth(PetersenGraph);         
##  5
##  gap> Girth(Cube);
##  4
##  gap> Girth(PathGraph(5));
##  infinity
##  gap> g:=AddEdges(CycleGraph(4),[[3,3]]:GraphCategory:=UndirectedGraphs);
##  Graph( rec( Category := UndirectedGraphs, Order := 4, Size := 
##  5, Adjacencies := [ [ 2, 4 ], [ 1, 3 ], [ 2, 3, 4 ], [ 1, 3 ] ] ) )
##  gap> Girth(g);            
##  1
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Girth",[Graphs]);

#E
