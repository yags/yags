############################################################################
############################################################################
##
##
##  Yags: Yet another graph system
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.1
##  2003/May/23
##
##  backtrack.gi contains methods to easily
##  implement backtracking algorithms
##


############################################################################
##
#M  BackTrackBag( <opts>, <chk>, <done>, <extra> )
##
##
InstallMethod(BackTrackBag,"backtrackbag",true,
[IsObject,IsFunction,IsObject,IsObject],0,
function(opts,chk,done,extra) 
    local Bag,L;
    Bag:=[];
    L:=[];
    repeat
       BackTrack(L,opts,chk,done,extra);
       Add(Bag,ShallowCopy(L));
    until L=[fail];
    Unbind(Bag[Length(Bag)]);
    return Bag;
end);

############################################################################
##
#M  BackTrack( <L>, <opts>, <chk>, <done>, <extra> )
##
##   
InstallOtherMethod(BackTrack,"backtrack: <done> is int",true, 
[IsList,IsFunction,IsFunction,IsInt,IsObject],0,
function(L,opts,chk,done,extra)
   local chk1,done1; 
   chk1:=function(list,extr) return Length(list)<=done and chk(list,extr); end;
   done1:=function(list,extr) return Length(list)=done; end;
   return BackTrack(L,opts,chk1,done1,extra);
end);
 ##
 ##Here is the one that does all the job:
 ##
InstallMethod(BackTrack,"backtrack: generic",true,
[IsList,IsFunction,IsFunction,IsFunction,IsObject],0,
function(L,opts,chk,done,extra)
   local len,opts1,x,i,j;

   repeat
     if L=[fail] then 
         Unbind(L[1]);continue;
     fi;
     len:=Length(L);
     if len>=2 and L[len]=fail then #### go back!
        Unbind(L[len]);
        x:=L[len-1];
        Unbind(L[len-1]);
        opts1:=opts(L,extra);
        i:=Position(opts1,x);
        if i=fail then Error("Invalid value ",x," in search path\n");fi;
        len:=len-1;
     else                         ##### go forth!
        PrintTo(YAGSInfo.AuxInfo,L,"\n");
        opts1:=opts(L,extra);
        i:=0;
        len:=len+1;
     fi;
     L[len]:=fail;
     for j in [i+1..Length(opts1)] do
        L[len]:=opts1[j];
        #Print(L," ",chk(L,extra),"\n"); 
        if chk(L,extra) then 
           break;
        fi;
        L[len]:=fail;
     od;
   until L=[fail] or ((L=[] or L[Length(L)]<>fail ) and done(L,extra));
   if L=[fail] then 
      return fail; 
   else 
     return L; 
   fi;
end);

 #InstallOtherMethod(BackTrack,"backtrack: <opts> is list",true, 
 #[IsList,IsList,IsFunction,IsObject,IsObject],0,
 #function(L,opts,chk,done,extra)
 #   local opts1; 
 #   opts1:=function(list,extr) return opts; end;
 #   return BackTrack(L,opts1,chk,done,extra);
 #end); 

 #This is a more efficient method when opts is a list.
InstallOtherMethod(BackTrack,"backtrack: generic",true,
[IsList,IsList,IsFunction,IsFunction,IsObject],0,
function(L,opts,chk,done,extra)
   local len,x,i,j;

   repeat
     if L=[fail] then 
         Unbind(L[1]);continue;
     fi;
     len:=Length(L);
     if len>=2 and L[len]=fail then #### go back!
        Unbind(L[len]);
        x:=L[len-1];
        Unbind(L[len-1]);
        #opts1:=opts(L,extra);
        i:=Position(opts,x);
        if i=fail then Error("Invalid value ",x," in search path\n");fi;
        len:=len-1;
     else                         ##### go forth!
        PrintTo(YAGSInfo.AuxInfo,L,"\n");
        #opts1:=opts(L,extra);
        i:=0;
        len:=len+1;
     fi;
     L[len]:=fail;
     for j in [i+1..Length(opts)] do
        L[len]:=opts[j];
        #Print(L," ",chk(L,extra),"\n"); 
        if chk(L,extra) then 
           break;
        fi;
        L[len]:=fail;
     od;
   until L=[fail] or ((L=[] or L[Length(L)]<>fail ) and done(L,extra));
   if L=[fail] then 
      return fail; 
   else 
     return L; 
   fi;
end);

 #This is an even more efficient method when opts is a list and 
 # done is an int!!
InstallOtherMethod(BackTrack,"backtrack: generic",true,
[IsList,IsList,IsFunction,IsInt,IsObject],0,
function(L,opts,chk,done,extra)
   local len,x,i,j;

   repeat
     if L=[fail] then 
         Unbind(L[1]);continue;
     fi;
     len:=Length(L);
     if len>=2 and L[len]=fail then #### go back!
        Unbind(L[len]);
        x:=L[len-1];
        Unbind(L[len-1]);
        #opts1:=opts(L,extra);
        i:=Position(opts,x);
        if i=fail then Error("Invalid value ",x," in search path\n");fi;
        len:=len-1;
     else                         ##### go forth!
        PrintTo(YAGSInfo.AuxInfo,L,"\n");
        #opts1:=opts(L,extra);
        i:=0;
        len:=len+1;
     fi;
     L[len]:=fail;
     for j in [i+1..Length(opts)] do
        L[len]:=opts[j];
        #Print(L," ",chk(L,extra),"\n"); 
        if Length(L)<= done and chk(L,extra) then 
           break;
        fi;
        L[len]:=fail;
     od;
   until L=[fail] or ((L=[] or L[Length(L)]<>fail ) and Length(L)>=done);
   if L=[fail] then 
      return fail; 
   else 
     return L; 
   fi;
end);
#E
