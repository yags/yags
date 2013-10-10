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
##  cliques.gi contains the methods and 
##  and functions to compute cliques of graphs
##


############################################################################
##
#M  CliqueNumber( <G> )
##
##  FIXME there are better way to do this, should we code them?
##
InstallMethod(CliqueNumber,"for graphs",true,[Graphs],0,
function(G)
   return Maximum(List(Cliques(G),Length)); 
end);


############################################################################
##
#M  IsCliqueHelly( <G>, <qtfy> )
##
##  Szwarcfiter's algorithm.
##
##  FIXME: Make it faster, by means of a better implementation?
##  FIXME: What does this mean in other categories?
##
InstallMethod(IsCliqueHelly,"for graphs",true,[Graphs,IsBool],0,
function(G,qtfy)  
  local t1,t2,t3,aux1,aux2,ext,univ, count,M;
  count:=0;
  M:=AdjMatrix(G);
  for t1 in [1..Order(G)] do
     aux1:=Filtered(PositionsTrueBlist(M[t1]),x->x>t1);
    for t2 in aux1 do
       aux2:=Filtered(PositionsTrueBlist(M[t2]),x->(x>t2 and x in aux1));
      for t3 in aux2 do
         ext:=UnionBlist(IntersectionBlist(M[t1],M[t2]),
                    IntersectionBlist(M[t1],M[t3]),
                    IntersectionBlist(M[t2],M[t3]));
         univ:=First(PositionsTrueBlist(ext),
                    x->PositionsTrueBlist(DifferenceBlist(ext,M[x]))=[x]);
         if univ=fail then
            if qtfy then
               count:=count+1;
            else
	       return false;
            fi; 
        fi;
      od;
    od;
  od;
  if qtfy then
    return count;
  else
    return true;
  fi; 
end);


############################################################################
##
#M  CliqueGraph( <G> )
#M  CliqueGraph( <G>, <MaxNumCli> )
##
InstallMethod(CliqueGraph,"for graphs",true,[Graphs],0,
function(G)
   return IntersectionGraph(Cliques(G));
end);

InstallMethod(CliqueGraph,"for graphs",true,[Graphs,IsCyclotomic],0,
function(G, MaxNumCli)
   local Clis;
   Clis:=Cliques(G,MaxNumCli);
   if Length(Clis)>=MaxNumCli then 
     return fail;
   else
     return IntersectionGraph(Clis);
   fi;
end);


############################################################################
##
#M  Cliques( <G> )
#M  Cliques( <G>, <MaxNumCli> )
##
##  FIXME: What does this mean in other categories?
##
InstallMethod(Cliques,"for graphs",true,[Graphs],0,
function(G)
  return Cliques(G,infinity);
end);

InstallMethod(Cliques,"for graphs",true,[Graphs,IsCyclotomic],0,
function(G,MaxNumCli) 
  local conn,N,ALL,compsub,c,extend,Res,newne, newce,i,j,
           count,pos,p,s,sel,minnod,NumCli,NumVert,DONE;
  if not (IsInt(MaxNumCli) or MaxNumCli=infinity) then
  	Error("MaxNumCli must be an integer or 'infinity' in\n\
	 Cliques( <G>, <MaxNumCli> )\n"); 
  fi;
  if not IsSimple(G) then
  	Error("G must be a simple graph in Cliques( <G>, <MaxNumCli> )\n"); 
  fi;
  N:=Order(G);Res:=[]; NumCli:=0;NumVert:=0;DONE:=false;

  ######FIXME: replace by 'DeepCopy' or something.
  conn:=List(AdjMatrix(G),ShallowCopy); 

  for c in [1..N] do conn[c][c]:=true; od;
  ALL:=[1..N];
  compsub:=[1..N];
  c:=0;
  extend:=function(old,ne,ce)
     local new,nod, fixp;
     new:=[1..ce];
     minnod:=ce; nod:=0;

  #Determine counter value

     for i in  [1..ce] do
       if minnod=0 then break; fi;
       p:=old[i];count:=0;

  #Count disconnections

       for j in [ne+1..ce] do
         if count>=minnod then break; fi;
         if not conn[p][old[j]] then
                count:=count+1;

  #Save position of potential candidate

                pos:=j; fi;
       od;

  #test minimum

       if count<minnod then
         fixp:=p; minnod:=count;
         if i<=ne then s:=pos; else s:=i; nod:=1; fi;
       fi;
     od;

  #backtrack cycle

     for nod in [minnod+nod,minnod+nod-1..1] do

  #interchange

         p:=old[s]; old[s]:=old[ne+1];
         sel:=p; old[ne+1]:=p;

  #fill new set not

         newne:=0;
         for i in [1..ne] do
             if conn[sel][old[i]] then
                newne:=newne+1; new[newne]:=old[i];
             fi;
         od;

  #fill new set cand

         newce:=newne;
         for i in [ne+2..ce] do
            if conn[sel][old[i]] then
               newce:=newce+1; new[newce]:=old[i];
            fi;
         od;

  #add to compsub

         c:=c+1; compsub[c]:=sel;
  # report
         if c=1 then
                NumVert:=NumVert+1;
           #  PrintTo(AuxInfo,"i:=",NumVert," Clanes:=",NumCli,"     \r");
         fi;
         if newce=0 then
            Add(Res,Set(compsub{[1..c]}));
  #count cliques.
            NumCli:=NumCli+1;
            if IsInt(NumCli/30) then 
              PrintTo(AuxInfo,"i:=",NumVert," Clanes:=",NumCli,"     \r");
            fi;
            if(NumCli>=MaxNumCli)then
                DONE:=true; return;
            fi;
         else
            if newne<newce then
                 extend(new,newne,newce);
                 if DONE then return; fi;
            fi;
         fi;

  # remove from compsub

         c:=c-1;

  #add to not

         ne:=ne+1;
         if nod>1 then

  #selecting a candidate diconnected to fixed point

            s:=ne;
            repeat
               s:=s+1;
            until not conn[fixp][old[s]];
         fi;
     od;
  end;
 extend(ALL,0,N);
  PrintTo(AuxInfo,"i:=",N," Clanes:=",NumCli,"     \r");
  PrintTo(AuxInfo,"\n");
  return Res;
end);

############################################################################
##
#M  NumberOfCliques( <G> )
#M  NumberOfCliques( <G>, <MaxNumCli> )
##
##  FIXME: What does this mean in other categories?
##
InstallMethod(NumberOfCliques,"for graphs",true,[Graphs],0,
function(G)
  return NumberOfCliques(G,infinity);
end);

InstallMethod(NumberOfCliques,"for graphs",true,[Graphs,IsCyclotomic],0,
function(G,MaxNumCli)
  local conn,N,ALL,compsub,c,extend,newne, newce,i,j,
           count,pos,p,s,sel,minnod,NumCli,NumVert,DONE;
  if not (IsInt(MaxNumCli) or MaxNumCli=infinity) then
        Error("MaxNumCli must be an integer or 'infinity' in\n\
         Cliques( <G>, <MaxNumCli> )\n");
  fi;
  if not IsSimple(G) then
        Error("G must be a simple graph in Cliques( <G>, <MaxNumCli> )\n");
  fi;
  N:=Order(G); NumCli:=0;NumVert:=0;DONE:=false;

  ######FIXME: replace by 'DeepCopy' or something.
  conn:=List(AdjMatrix(G),ShallowCopy);

  for c in [1..N] do conn[c][c]:=true; od;
  ALL:=[1..N];
  compsub:=[1..N];
  c:=0;
  extend:=function(old,ne,ce)
     local new,nod, fixp;
     new:=[1..ce];
     minnod:=ce; nod:=0;

  #Determine counter value

     for i in  [1..ce] do
       if minnod=0 then break; fi;
       p:=old[i];count:=0;

  #Count disconnections

       for j in [ne+1..ce] do
         if count>=minnod then break; fi;
         if not conn[p][old[j]] then
                count:=count+1;

  #Save position of potential candidate

                pos:=j; fi;
       od;

    #test minimum

       if count<minnod then
         fixp:=p; minnod:=count;
         if i<=ne then s:=pos; else s:=i; nod:=1; fi;
       fi;
     od;

  #backtrack cycle

     for nod in [minnod+nod,minnod+nod-1..1] do

  #interchange

         p:=old[s]; old[s]:=old[ne+1];
         sel:=p; old[ne+1]:=p;

  #fill new set not

         newne:=0;
         for i in [1..ne] do
             if conn[sel][old[i]] then
                newne:=newne+1; new[newne]:=old[i];
             fi;
         od;

  #fill new set cand

         newce:=newne;
         for i in [ne+2..ce] do
            if conn[sel][old[i]] then
               newce:=newce+1; new[newce]:=old[i];
            fi;
         od;

  #add to compsub

         c:=c+1; compsub[c]:=sel;
  # report
         if c=1 then
                NumVert:=NumVert+1;
           #  PrintTo(AuxInfo,"i:=",NumVert," Clanes:=",NumCli,"     \r");
         fi;
         if newce=0 then
            #Do not store: 
            #Add(Res,compsub{[1..c]});
  #count cliques.
            NumCli:=NumCli+1;
            if IsInt(NumCli/30) then
              PrintTo(AuxInfo,"i:=",NumVert," Clanes:=",NumCli,"     \r");
            fi;
            if(NumCli>=MaxNumCli)then
                DONE:=true; return;
            fi;
         else
            if newne<newce then
                 extend(new,newne,newce);
                 if DONE then return; fi;
            fi;
         fi;

  # remove from compsub

         c:=c-1;

  #add to not

         ne:=ne+1;
         if nod>1 then

  #selecting a candidate diconnected to fixed point

            s:=ne;
            repeat
               s:=s+1;
            until not conn[fixp][old[s]];
         fi;
     od;
  end;
 extend(ALL,0,N);
  PrintTo(AuxInfo,"i:=",N," Clanes:=",NumCli,"     \r");
  PrintTo(AuxInfo,"\n");
  return NumCli;
end);



############################################################################
##
#M  Basement( <G>, <KnG>, <x> )
#M  Basement( <G>, <KnG>, <V> )
##
InstallMethod(Basement,"for clique graphs",true,[Graphs,Graphs,IsInt],0,
function(G,KnG,x)
   if IsIdenticalObj(G,KnG) then
     return x;
   fi;
   return Basement(G,KnG,[x]);
end);

InstallMethod(Basement,"for clique graphs",true,[Graphs,Graphs,IsList],0,
function(G,KnG,V)
   local Bsmnt;
   if IsIdenticalObj(G,KnG) then
      return V;
   fi;
   if not HasCliqueGraph(G) then
     Error("KnG must be an iterated clique graph \
of G in Basement(G,KnG,V)\n");
   fi;
   Bsmnt:=Basement(CliqueGraph(G),KnG,V);
   Bsmnt:=Union(List(Bsmnt,x->Cliques(G)[x]));
   return Bsmnt;
end);


############################################################################
##
#M  CompletesOfGivenOrder( <G>, <Ord> )
##
##  FIXME: Preliminary version, make it more eficient.
##  FIXME: What does this mean in other categories?
##
InstallMethod(CompletesOfGivenOrder,"for graphs",true,[Graphs,IsPosInt],0,
function(G,Ord) 
   local chk;
   chk:=function(L,G)
      local x,L1;
      x:=L[Length(L)]; L1:=L{[1..Length(L)-1]};
      return (L1=[] or L1[Length(L1)]<x) and IsSubset(Adjacency(G,x),L1);
   end;
   return BackTrackBag([1..Order(G)],chk,Ord,G); 	
end);


############################################################################
##
#M  IsCliqueGated( <G>, <qtfy> )
##
InstallMethod(IsCliqueGated,"for graph",true, [SimpleGraphs,IsBool],0,
function(G,qtfy)
    local count,clis,pairs,c,x,MinDistRep;
    count:=QtfyIsDiamondFree(G);
    if count<>0 then
       if qtfy then
          return Size(G)*Order(G)*count;
       else
          return false;
       fi;
    fi;
    clis:=Cliques(G);
    count:=0;
    for c in clis do
      for x in Vertices(G) do
        MinDistRep:=Collected(Distances(G,c,[x]))[1];
        if MinDistRep[2]<>1 then
           if qtfy then
              count:=count+1;
           else
              return false;
           fi;
        fi;
      od;
    od;
    if qtfy then
       return count;
    else
       return true;
    fi;
end);

#E
