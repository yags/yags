
#### All these "CHK_SOMETHING" functions are intended for internal use only
#### This file is read from 'morph.gi'.
#### List: CHK_WEAK, CHK_MORPH, CHK_METRIC, CHK_CMPLT, CHK_MONO, CHK_EPI, CHK_FULL

BindGlobal("CHK_WEAK",function(g1,g2,morph)
   local x,x1,y,y1;
   x:=Length(morph);
   y:=morph[x];
   for x1 in [1..x] do
      y1:=morph[x1];
      if IsEdge(g1,[x,x1]) then 
         if x<>x1 then
            if not (y=y1 or IsEdge(g2,[y,y1])) then
              return false;
            fi;
         else
            if not IsEdge(g2,[y,y1]) then
              return false;
            fi;
         fi;
      fi; 
      if IsEdge(g1,[x1,x]) and x<>x1 then 
         if not (y=y1 or IsEdge(g2,[y1,y])) then
           return false;
         fi;
      fi;
   od;
   return true;
end);

BindGlobal("CHK_MORPH",function(g1,g2,morph)
   local x,x1,y,y1;
   x:=Length(morph);
   y:=morph[x];
   for x1 in [1..x] do 
      y1:=morph[x1]; 
     if IsEdge(g1,[x,x1]) and not IsEdge(g2,[y,y1]) then 
       return false;
     fi;
     if IsEdge(g1,[x1,x]) and not IsEdge(g2,[y1,y]) then 
       return false;
     fi;
   od;
   return true;
end);

BindGlobal("CHK_METRIC",function(g1,g2,morph)
   local x,x1,y,y1;
   x:=Length(morph);
   y:=morph[x];
   if IsEdge(g1,[x,x]) and not IsEdge(g2,[y,y]) then
      return false;
   fi;
   for x1 in [1..x] do 
      y1:=morph[x1]; 
     if Distance(g1,x,x1)<>Distance(g2,y,y1) then 
       return false;
     fi;
     if Distance(g1,x1,x)<>Distance(g2,y1,y) then 
       return false;
     fi;
   od;
   return true;
end);

BindGlobal("CHK_CMPLT",function(g1,g2,morph)
   local x,x1,y,y1;
   x:=Length(morph);
   y:=morph[x];
   for x1 in [1..x] do 
     y1:=morph[x1]; 
     if y=y1 then
        if IsEdge(g2,[y,y1]) then
          if not (IsEdge(g1,[x,x1]) and IsEdge(g1,[x1,x])) then
            return false;
          fi;
        else 
          if not (x=x1 or (IsEdge(g1,[x,x1]) and IsEdge(g1,[x1,x]))) then
            return false;
          fi;
        fi;
     else  #y<>y1
        if IsEdge(g2,[y,y1]) then
           if not IsEdge(g1,[x,x1]) then 
              return false; 
           fi; 
        fi;
        if IsEdge(g2,[y1,y]) then
           if not IsEdge(g1,[x1,x]) then 
              return false; 
           fi; 
        fi;
     fi;
   od;
   return true;
end);


BindGlobal("CHK_MONO",function(g1,g2,morph) 
 #FIXME: make this one better too (see bellow)
   local x,y;
   x:=Length(morph);
   y:=morph[x];
   if y in morph{[1..x-1]} then
      return false;
   fi;
   return true;
end);

BindGlobal("CHK_EPI",function(g1,g2,morph) 
 #FIXME: make this one better using degrees, 
 #Think:  Morph(K_100,C_4,EPI);
   return Order(g2)-Length(Set(morph))<=Order(g1)-Length(morph);
end);

 #FIXME: write CHK_FULL function.
BindGlobal("CHK_FULL",function(g1,g2,morph)
 Print("Error: Internal function CHK_FULL not yet implemented in file morph_chq.g\n"); 
 return fail;
end);
