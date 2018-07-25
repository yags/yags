#############################################################################
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##  
##  Version 0.0.4 
##  2003/05/08
##
##  init.g: Initialization file for YAGS.
##
DeclarePackage("yags", "0.0.4", function() return true; end);

DeclarePackageAutoDocumentation( "yags", "doc" );

ReadPkg("yags","lib/basics.gd");
ReadPkg("yags","lib/exec.gd");
ReadPkg("yags","lib/backtrack.gd");
ReadPkg("yags","lib/kernel.gd");
ReadPkg("yags","lib/digraphs.gd");
ReadPkg("yags","lib/algebraic.gd");
ReadPkg("yags","lib/unaryop.gd");
ReadPkg("yags","lib/binaryop.gd");
ReadPkg("yags","lib/families.gd");
ReadPkg("yags","lib/iso.gd");
ReadPkg("yags","lib/morph.gd");
ReadPkg("yags","lib/classes.gd");
ReadPkg("yags","lib/distances.gd");
ReadPkg("yags","lib/cliques.gd");
ReadPkg("yags","lib/atlas.gd");
ReadPkg("yags","lib/draw.gd");

ReadPkg("yags","lib/operators.g");

#E
