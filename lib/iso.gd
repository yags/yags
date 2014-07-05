

############################################################################
##
#O  NextIsoMorphism( <G>, <H>, <morph> );
##

DeclareOperation("NextIsoMorphism",[Graphs,Graphs,IsList]);

############################################################################
##
#O  IsoMorphism( <G>, <H> )
##

DeclareOperation("IsoMorphism",[Graphs,Graphs]);

############################################################################
##
#O  IsoMorphisms( <G>, <H> )
##

DeclareOperation("IsoMorphisms",[Graphs,Graphs]);

############################################################################
##
#O  IsIsomorphicGraph( <G>, <H> )
##
DeclareOperation("IsIsomorphicGraph",[Graphs,Graphs]);


###  Operation already declared in Gap:
############################################################################
##
##  AutomorphismGroup( <G> )
##
#DeclareAttribute("AutomorphismGroup",[Graphs]);
