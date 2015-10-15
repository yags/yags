
############################################################################
##
#P  IsDiamondFree( <G> )
##
##  Returns `true' if <G> is free from induced diamonds, `false' otherwise.
##  
##  \beginexample
##  gap> IsDiamondFree(Cube);
##  true
##  gap> IsDiamondFree(Octahedron);
##  false
##  \endexample
##                                      
DeclareQtfyProperty("IsDiamondFree",SimpleGraphs);

############################################################################
##
#O  IsLocallyH( <G>, <H> )
##
##  Returns `true' if all the links of <G> are isomorphic to <H>; `false' otherwise.
##
##  \beginexample
##  gap> IsLocallyH(Octahedron,CycleGraph(4));
##  true
##  gap> IsLocallyH(Octahedron,CycleGraph(5));
##  false
##  gap> IsLocallyH(Icosahedron,CycleGraph(5));
##  true
##  gap> IsLocallyH(TorusGraph(4,4),CycleGraph(6));
##  true
##  \endexample
##  
DeclareOperation("IsLocallyH",[Graphs,Graphs]);

############################################################################
##
#P  IsLocallyConstant( <G> )
##
##  Returns `true' if all the links of <G> are isomorphic to each other;
##  `false' otherwise.
##
##  \beginexample
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
##  \endexample
##  
DeclareProperty("IsLocallyConstant",Graphs);

############################################################################
##
#P  IsSurface( <G> )
##
##  Returns `true' if every link of <G> is an <n>-cycle, for $n\geq 4$ 
##  (not necessarily the same <n> for all vertices); `false' otherwise.
##  
##  This notion correspond to Whitney triangulations of (closed) surfaces \cite{LNP02}
##  in which the (maximal) cliques of the graph are exactly the triangles of the 
##  triangulation.
##
##  \beginexample
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
##  \endexample
##  
##  Topologically, the difference between a (closed) surface and a compact surface is that 
##  the points of a surface always have a open neighborhood homeomorphic to an open disk, 
##  whereas a compact surface may also contain points with open neighborhoods 
##  homeomorphic to a closed half-plane.
##  
DeclareProperty("IsSurface",Graphs);

############################################################################
##
#P  IsCompactSurface( <G> )
##
##  Returns `true' if every link of <G> is either an <n>-cycle, for $n\geq 4$ or 
##  an <m>-path, for $m\geq 2$. (not necessarily the same <n>/<m> for all 
##  vertices); it returns `false' otherwise.
##  
##  This notion correspond to Whitney triangulations of compact surfaces \cite{LNP02} 
##  in which the (maximal) cliques of the graph are exactly the triangles of the 
##  triangulation.
##  
##  \beginexample
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
##  \endexample
##  
##  Topologically, the difference between a surface and a compact surface is that 
##  the points of a surface always have a open neighborhood homeomorphic to an open disk, 
##  whereas a compact surface may also contain points with open neighborhoods 
##  homeomorphic to a closed half-plane.
##  
DeclareProperty("IsCompactSurface",Graphs);

############################################################################
##
#A  BoundaryVertices( <G> )
##
##  When <G> is a compact surface, it returns the list of vertices in the 
##  boundary (of the triangulation) of the surface. That is, the list of vertices 
##  of <G> that have links isomorphic to a path. It returns `fail' if <G> is 
##  not a compact surface.
##
##  \beginexample
##  gap> BoundaryVertices(WheelGraph(4,2));
##  [ 6, 7, 8, 9 ]
##  gap> BoundaryVertices(Octahedron);     
##  [  ]
##  \endexample
##  
DeclareAttribute("BoundaryVertices",Graphs);

############################################################################
##
#A  InteriorVertices( <G> )
##
##  When <G> is a compact surface, it returns the list of vertices in the 
##  interior (of the triangulation) of the surface. That is, the list of vertices 
##  of <G> that have links isomorphic to a cycle. It returns `fail' if <G> is 
##  not a compact surface.
##
##  \beginexample
##  gap> InteriorVertices(WheelGraph(4,2));
##  [ 1, 2, 3, 4, 5 ]
##  gap> InteriorVertices(Octahedron);     
##  [ 1, 2, 3, 4, 5, 6 ]
##  \endexample
##  
DeclareAttribute("InteriorVertices",Graphs);

#E
