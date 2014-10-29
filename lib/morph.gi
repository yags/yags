############################################################################
############################################################################
##
##
##  Yags: Yet another graph system
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.01
##  2003/May/08
##  Graphs, Genetic Algorihms and Groups
##
##  morph.gi contains the methods
##  to compute morphisms of graphs.
##

ReadPkg("yags","lib/morph_chk.g");

##################################################################
##
#M  NextPropertyMorphism( <G1>, <G2>, <morph>, <chks> )
#M  PropertyMorphism( <G1>, <G2>, <chks> )
#M  PropertyMorphisms( <G1>, <G2>, <chks> )
##
InstallMethod(NextPropertyMorphism,"for graphs",true,
[Graphs,Graphs,IsList,IsList],0,
function(G1,G2,morph,chks)
    local chk;
    chk:=function(morph,extra)
      local g1,g2,test;
      g1:=extra[1];
      g2:=extra[2];
      for test in chks do
         if not test(g1,g2,morph) then return false; fi;
      od;   
      return true;
    end;
    return BackTrack(morph, Vertices(G2), chk, Order(G1),[G1,G2]);
end);

InstallMethod(PropertyMorphism,"for graphs",true,
[Graphs,Graphs,IsList],0,
function(G1,G2,chks)
    return NextPropertyMorphism(G1,G2,[],chks);
end);

InstallMethod(PropertyMorphisms,"for graphs",true,
[Graphs,Graphs,IsList],0,
function(G1,G2,chks)
    local L,Bag;
    L:=[];Bag:=[];
    while NextPropertyMorphism(G1,G2,L,chks)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

####################################################################
#### The following was (almost) automatically generated:

InstallMethod(NextMetricMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)=Order(G2) then
       return NextIsoMorphism(G1,G2,morph);
    elif Order(G1)>Order(G2) then
       return fail;
    else
       return NextPropertyMorphism(G1,G2,morph,[CHK_METRIC]);
    fi;
end);

InstallMethod(NextEpiMetricMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)=Order(G2) then
       return NextIsoMorphism(G1,G2,morph);
    else
       return fail;
    fi;
end);

InstallMethod(NextMonoMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)  
     if Order(G1)>Order(G2) then
       return fail;
    else
      return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH]);
    fi;
end);

InstallMethod(NextFullMonoMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph) 
    if Order(G1)> Order(G2) then
       return fail;
    else
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH,CHK_CMPLT]);
    fi;
end);

InstallMethod(NextBiMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)<> Order(G2) then
       return fail;
    else
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH]);
    fi;
end);

InstallMethod(NextFullBiMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)<> Order(G2) then
       return fail;
    else
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH,CHK_CMPLT]);
    fi;
end);

############################################################
InstallMethod(NextCompleteEpiWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_WEAK,CHK_CMPLT]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK,CHK_CMPLT,CHK_EPI]);
end);

InstallMethod(NextCompleteEpiMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH,CHK_CMPLT]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH,CHK_CMPLT,CHK_EPI]);
end);

InstallMethod(NextCompleteWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK,CHK_CMPLT]);
end);

InstallMethod(NextCompleteMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH,CHK_CMPLT]);
end);

InstallMethod(NextFullEpiWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH,CHK_CMPLT]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK,CHK_EPI,CHK_FULL]);
end);

InstallMethod(NextFullEpiMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH,CHK_CMPLT]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH,CHK_EPI,CHK_FULL]);
end);

InstallMethod(NextFullWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK,CHK_FULL]);
end);

InstallMethod(NextFullMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH,CHK_FULL]);
end);

InstallMethod(NextEpiWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK,CHK_EPI]);
end);

InstallMethod(NextEpiMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    if Order(G1)< Order(G2) then
       return fail;
    fi;
    if Order(G1)= Order(G2) then
       return NextPropertyMorphism(G1,G2,morph,
           [CHK_MONO,CHK_MORPH]);
    fi;
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH,CHK_EPI]);
end);

InstallMethod(NextWeakMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_WEAK]);
end);

InstallMethod(NextMorphism,[Graphs,Graphs,IsList],
function(G1,G2,morph)
    return NextPropertyMorphism(G1,G2,morph,
           [CHK_MORPH]);
end);
#####################################################
InstallMethod(MetricMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextMetricMorphism(G1,G2,[]);
end);

InstallMethod(EpiMetricMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextEpiMetricMorphism(G1,G2,[]);
end);

InstallMethod(MonoMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextMonoMorphism(G1,G2,[]);
end);

InstallMethod(FullMonoMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullMonoMorphism(G1,G2,[]);
end);

InstallMethod(BiMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextBiMorphism(G1,G2,[]);
end);

InstallMethod(FullBiMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullBiMorphism(G1,G2,[]);
end);

InstallMethod(CompleteEpiWeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextCompleteEpiWeakMorphism(G1,G2,[]);
end);

InstallMethod(CompleteEpiMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextCompleteEpiMorphism(G1,G2,[]);
end);

InstallMethod(CompleteWeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextCompleteWeakMorphism(G1,G2,[]);
end);

InstallMethod(CompleteMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextCompleteMorphism(G1,G2,[]);
end);

InstallMethod(FullEpiWeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullEpiWeakMorphism(G1,G2,[]);
end);

InstallMethod(FullEpiMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullEpiMorphism(G1,G2,[]);
end);

InstallMethod(FullWeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullWeakMorphism(G1,G2,[]);
end);

InstallMethod(FullMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextFullMorphism(G1,G2,[]);
end);

InstallMethod(EpiWeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextEpiWeakMorphism(G1,G2,[]);
end);

InstallMethod(EpiMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextEpiMorphism(G1,G2,[]);
end);

InstallMethod(WeakMorphism,[Graphs,Graphs],
function(G1,G2)
    return NextWeakMorphism(G1,G2,[]);
end);

InstallMethod(Morphism,[Graphs,Graphs],
function(G1,G2)
    return NextMorphism(G1,G2,[]);
end);
#################################################
InstallMethod(MetricMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextMetricMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(EpiMetricMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextEpiMetricMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(MonoMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextMonoMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullMonoMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullMonoMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(BiMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextBiMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullBiMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullBiMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(CompleteEpiWeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextCompleteEpiWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(CompleteEpiMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextCompleteEpiMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(CompleteWeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextCompleteWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(CompleteMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextCompleteMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullEpiWeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullEpiWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullEpiMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullEpiMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullWeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(FullMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextFullMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(EpiWeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextEpiWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(EpiMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextEpiMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(WeakMorphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextWeakMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);

InstallMethod(Morphisms,[Graphs,Graphs],
function(G1,G2)
    local L,Bag;
    L:=[];Bag:=[];
    while NextMorphism(G1,G2,L)<>fail do
        Add(Bag,StructuralCopy(L));
    od;
    return Bag;
end);



