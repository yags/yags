

############################################################################
##
#M  \=( <G>, <H> )
##
InstallMethod(\=,"for graph",true,[Graphs,Graphs],0,
function(G,H)
   return (AdjMatrix(G)=AdjMatrix(H));
end);

############################################################################
##
#M  \{\}( <G>, <V> )
##
InstallOtherMethod(\{\},"for graph",true,[Graphs,IsList],0,
function(G,V)
   return InducedSubgraph(G,V);
end);

############################################################################
##
#M  \+( <G>, <E> )
##
InstallOtherMethod(\+,"for graph",true,[Graphs,IsList],9,
function(G,E)
    return AddEdges(G,E);
end);

############################################################################
##
#M  \-( <G>, <VE> )
##
InstallOtherMethod(\-,"for graph",true,[Graphs,IsList],0,
function(G,VE)
   local V,E,G1;
   E:=Filtered(VE,x->IsList(x) and Length(x)=2);
   V:=Filtered(VE,x->IsInt(x));
   G1:=G;
   if E<>[] then
     G1:=RemoveEdges(G1,E);
   fi;
   if V<>[] then
     G1:=RemoveVertices(G1,V);
   fi;
   return G1;
end);

############################################################################
##
#M  \^( <G>, <N> )
#M  \^( <G>, <L> )
##
InstallOtherMethod(\^,"for graph",true,[Graphs,IsInt],0,
function(G,N)
   return PowerGraph(G,N);
end);

InstallOtherMethod(\^,"for graph",true,[Graphs,IsList],0,
function(G,L)
   return DistanceGraph(G,L);
end);

#E
