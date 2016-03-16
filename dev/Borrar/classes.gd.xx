
############################################################################
##
#P  IsDiamondFree( <G> )
##  
##  <#GAPDoc Label="IsDiamondFree">
##  <ManSection>
##  <Prop Name="IsDiamondFree" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if <A>G</A> is free from induced diamonds, <C>false</C> otherwise.
##  
##  <Example>
##  gap> IsDiamondFree(Cube);
##  true
##  gap> IsDiamondFree(Octahedron);
##  false
##  </Example>
##                                      
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareQtfyProperty("IsDiamondFree",SimpleGraphs);

############################################################################
##
#O  IsLocallyH( <G>, <H> )
##  
##  <#GAPDoc Label="IsLocallyH">
##  <ManSection>
##  <Oper Name="IsLocallyH" Arg="G, H"/>
##  <Description>
##
##  Returns <C>true</C> if all the links of <A>G</A> are isomorphic to <A>H</A>; <C>false</C> otherwise.
##
##  <Example>
##  gap> IsLocallyH(Octahedron,CycleGraph(4));
##  true
##  gap> IsLocallyH(Octahedron,CycleGraph(5));
##  false
##  gap> IsLocallyH(Icosahedron,CycleGraph(5));
##  true
##  gap> IsLocallyH(TorusGraph(4,4),CycleGraph(6));
##  true
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("IsLocallyH",[Graphs,Graphs]);

############################################################################
##
#P  IsLocallyConstant( <G> )
##  
##  <#GAPDoc Label="IsLocallyConstant">
##  <ManSection>
##  <Prop Name="IsLocallyConstant" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if all the links of <A>G</A> are isomorphic to each other;
##  <C>false</C> otherwise.
##
##  <Example>
##  gap> IsLocallyConstant(PathGraph(2));
##  true
##  gap> IsLocallyConstant(PathGraph(3));
##  false
##  gap> IsLocallyConstant(CompleteGraph(3));
##  true
##  gap> IsLocallyConstant(CycleGraph(4));   
##  true
##  gap> IsLocallyConstant(Icosahedron);  
##  true
##  gap> IsLocallyConstant(TorusGraph(5,4));
##  true
##  gap> IsLocallyConstant(WheelGraph(4,2));
##  false
##  gap> IsLocallyConstant(SnubDisphenoid); 
##  false
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareProperty("IsLocallyConstant",Graphs);

############################################################################
##
#P  IsSurface( <G> )
##  
##  <#GAPDoc Label="IsSurface">
##  <ManSection>
##  <Prop Name="IsSurface" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if every link of <A>G</A> is an <A>n</A>-cycle, for $n\geq 4$ 
##  (not necessarily the same <A>n</A> for all vertices); <C>false</C> otherwise.
##  
##  This notion correspond to Whitney triangulations of (closed) surfaces <Cite Key="LNP02"/>
##  in which the (maximal) cliques of the graph are exactly the triangles of the 
##  triangulation.
##
##  <Example>
##  gap> IsSurface(SnubDisphenoid);
##  true
##  gap> IsSurface(Icosahedron);   
##  true
##  gap> IsSurface(RemoveVertices(Icosahedron,[1]));       
##  false
##  gap> IsSurface(TorusGraph(4,5));
##  true
##  gap> IsSurface(WheelGraph(4,2));
##  false
##  gap> IsSurface(Tetrahedron);    
##  false
##  </Example>
##  
##  Topologically, the difference between a (closed) surface and a compact surface is that 
##  the points of a surface always have a open neighborhood homeomorphic to an open disk, 
##  whereas a compact surface may also contain points with open neighborhoods 
##  homeomorphic to a closed half-plane.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareProperty("IsSurface",Graphs);

############################################################################
##
#P  IsCompactSurface( <G> )
##  
##  <#GAPDoc Label="IsCompactSurface">
##  <ManSection>
##  <Prop Name="IsCompactSurface" Arg="G"/>
##  <Description>
##
##  Returns <C>true</C> if every link of <A>G</A> is either an <A>n</A>-cycle, for $n\geq 4$ or 
##  an <A>m</A>-path, for $m\geq 2$. (not necessarily the same <A>n</A>/<A>m</A> for all 
##  vertices); it returns <C>false</C> otherwise.
##  
##  This notion correspond to Whitney triangulations of compact surfaces <Cite Key="LNP02"/> 
##  in which the (maximal) cliques of the graph are exactly the triangles of the 
##  triangulation.
##  
##  <Example>
##  gap> IsCompactSurface(Icosahedron);                             
##  true
##  gap> IsCompactSurface(RemoveVertices(Icosahedron,[1]));
##  true
##  gap> IsCompactSurface(WheelGraph(4,2));
##  true
##  gap> IsCompactSurface(Tetrahedron);    
##  false
##  gap> IsCompactSurface(CompleteGraph(2));
##  false
##  gap> IsCompactSurface(CompleteGraph(3));
##  true
##  gap> IsCompactSurface(CompleteGraph(4));
##  false
##  </Example>
##  
##  Topologically, the difference between a surface and a compact surface is that 
##  the points of a surface always have a open neighborhood homeomorphic to an open disk, 
##  whereas a compact surface may also contain points with open neighborhoods 
##  homeomorphic to a closed half-plane.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareProperty("IsCompactSurface",Graphs);

############################################################################
##
#A  BoundaryVertices( <G> )
##  
##  <#GAPDoc Label="BoundaryVertices">
##  <ManSection>
##  <Attr Name="BoundaryVertices" Arg="G"/>
##  <Description>
##
##  When <A>G</A> is a compact surface, it returns the list of vertices in the 
##  boundary (of the triangulation) of the surface. That is, the list of vertices 
##  of <A>G</A> that have links isomorphic to a path. It returns <C>fail</C> if <A>G</A> is 
##  not a compact surface.
##
##  <Example>
##  gap> BoundaryVertices(WheelGraph(4,2));
##  [ 6, 7, 8, 9 ]
##  gap> BoundaryVertices(Octahedron);     
##  [  ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("BoundaryVertices",Graphs);

############################################################################
##
#A  InteriorVertices( <G> )
##  
##  <#GAPDoc Label="InteriorVertices">
##  <ManSection>
##  <Attr Name="InteriorVertices" Arg="G"/>
##  <Description>
##
##  When <A>G</A> is a compact surface, it returns the list of vertices in the 
##  interior (of the triangulation) of the surface. That is, the list of vertices 
##  of <A>G</A> that have links isomorphic to a cycle. It returns <C>fail</C> if <A>G</A> is 
##  not a compact surface.
##
##  <Example>
##  gap> InteriorVertices(WheelGraph(4,2));
##  [ 1, 2, 3, 4, 5 ]
##  gap> InteriorVertices(Octahedron);     
##  [ 1, 2, 3, 4, 5, 6 ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareAttribute("InteriorVertices",Graphs);

#E
