
##FIXME Gap did not accept 'operation' declarations for this operators.
############################################################################
##
##  \=( <G>, <H> )
##
DeclareOperation(\=,[Graphs,Graphs]);

############################################################################
##
##  \{\}( <G>, <V> )
##
DeclareOperation(\{\},[Graphs,IsList]);

############################################################################
##
##  \+( <G>, <E> )
##
DeclareOperation(\+,[Graphs,IsList]);

############################################################################
##
##  \-( <G>, <VE> )
##
DeclareOperation(\-,[Graphs,IsList]);

############################################################################
##
##  \^( <G>, <N> )
##  \^( <G>, <L> )
##
DeclareOperation(\^,[Graphs,IsInt]);
DeclareOperation(\^,[Graphs,IsList]);

#E
