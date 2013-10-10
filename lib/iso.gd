

############################################################################
##
#O  NextIsoMorphism( <G>, <H>, <morph> );
#O  IsoMorphism( <G>, <H> )
#O  IsoMorphisms( <G>, <H> )
##
DeclareOperation("NextIsoMorphism",[Graphs,Graphs,IsList]);
DeclareOperation("IsoMorphism",[Graphs,Graphs]);
DeclareOperation("IsoMorphisms",[Graphs,Graphs]);

############################################################################
##
#O  IsIsomorphicGraph( <G>, <H> )
##
DeclareOperation("IsIsomorphicGraph",[Graphs,Graphs]);


###  Operation already declared in Gap:
############################################################################
##
#O  AutomorphismGroup( <G> )
##
