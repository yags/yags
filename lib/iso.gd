
############################################################################
##
#O  IsoMorphism( <G>, <H> )
##
##  Returns one isomorphism from <G> to <H> or `fail' if none exists. If <G> has <n> vertices, 
##  an isomorphisms $f : G\rightarrow H$ is represented as the list `<F>=[f(1), f(2), ..., f(n)]'.
##  
##  \beginexample
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=IsoMorphism(g,h);
##  [ 1, 3, 2, 4 ]
##  \endexample
##  
##  See `NextIsoMorphism( <G>, <H>, <F> )'.
##
DeclareOperation("IsoMorphism",[Graphs,Graphs]);


############################################################################
##
#O  NextIsoMorphism( <G>, <H>, <F> )
##
##  Returns the next isomorphism (after <F>) from <G> to <H> in the lexicographic 
##  order; returns `fail' if there are no more isomorphisms. If <G> has <n> vertices, 
##  an isomorphisms $f : G\rightarrow H$ is represented as the list `<F>=[f(1), f(2), ..., f(n)]'.
##  
##  \beginexample
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> f:=IsoMorphism(g,h);
##  [ 1, 3, 2, 4 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 1, 4, 2, 3 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 2, 3, 1, 4 ]
##  gap> NextIsoMorphism(g,h,f);
##  [ 2, 4, 1, 3 ]
##  \endexample
##  
DeclareOperation("NextIsoMorphism",[Graphs,Graphs,IsList]);

############################################################################
##
#O  IsoMorphisms( <G>, <H> )
##  
##  Returns the list of all isomorphism from <G> to <H>. If <G> has <n> vertices, 
##  an isomorphisms $f : G\rightarrow H$ is represented as the list `<F>=[f(1), f(2), ..., f(n)]'.
##  
##  \beginexample
##  gap> g:=CycleGraph(4);;h:=CompleteBipartiteGraph(2,2);;
##  gap> IsoMorphisms(g,h);
##  [ [ 1, 3, 2, 4 ], [ 1, 4, 2, 3 ], [ 2, 3, 1, 4 ], [ 2, 4, 1, 3 ], 
##    [ 3, 1, 4, 2 ], [ 3, 2, 4, 1 ], [ 4, 1, 3, 2 ], [ 4, 2, 3, 1 ] ]
##  \endexample
##
DeclareOperation("IsoMorphisms",[Graphs,Graphs]);

############################################################################
##
#O  IsIsomorphicGraph( <G>, <H> )
##
##  Returns `true' when <G> is isomorphic to <H> and `false' otherwise.
##
##  \beginexample
##  gap> g:=PowerGraph(CycleGraph(6),2);;h:=Octahedron;;
##  gap> IsIsomorphicGraph(g,h);
##  true
##  \endexample
##
DeclareOperation("IsIsomorphicGraph",[Graphs,Graphs]);

############################################################################
##
#A  AutGroupGraph( <G> )
##
##  \indextt{AutomorphismGroup}
##  Returns the group of automorphisms of the graph <G>. 
##  There is also a synonym for this attribute which 
##  is `AutomorphismGroup( <G> )'.
##  
##  \beginexample
##  gap> AutGroupGraph(Icosahedron);
##  Group([ (1,3,2,10,9,12,8,7,5,4)(6,11), (1,7,9)(2,4,12)(3,11,10)(5,8,6) ])
##  gap> AutomorphismGroup(Icosahedron);
##  Group([ (1,3,2,10,9,12,8,7,5,4)(6,11), (1,7,9)(2,4,12)(3,11,10)(5,8,6) ])
##  \endexample
##  
DeclareAttribute("AutGroupGraph",Graphs);

## #FIXME  Operation already declared in Gap:
############################################################################
##
##  AutomorphismGroup( <G> )
##
##  Returns the group of automorphisms of the graph <G>.
##
##DeclareAttribute("AutomorphismGroup",[Graphs]);###  Operation already declared in Gap

#E

