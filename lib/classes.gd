
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
