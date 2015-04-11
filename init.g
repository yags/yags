#############################################################################
##
#W    init.g               share package `yags'     R. MacKinney, M.A. Pizana
##
##    @(#)$Id: init.g,v 0.01 2003/05/08 11:52:34 gap Exp $
##
DeclarePackage("yags", "0.01",
  function() return true; end);

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
ReadPkg("yags","lib/draw.gd");

ReadPkg("yags","lib/operators.g");

#E
