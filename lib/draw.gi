############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  R. MacKinney, M.A. Pizana and R. Villarroel-Flores
##
##  Version 0.0.1
##  2013/Octubre/11
##
##  draw.gi contains the methods to interface with the external program 'draw' 
##  who knows how to do human-assisted graph drawings.
##


############################################################################
##
#M  SetCoordinates(<G>,<Coord>) 
##
InstallMethod(SetCoordinates,"for graphs",true,[Graphs,IsList],0,
function(G,Coord)  
  #Minimal verification!
  #FIXME: Verify more conditions
  if Length(Coord)<>Order(G) then 
      Print("Usage: SetCoordinates(Graph,CoordinatesList);\n");
      return;
   fi;
   G!.Coordinates:=Coord;
end);

############################################################################
##
#M  Coordinates(<G>) 
##
InstallMethod(Coordinates,"for graphs",true,[Graphs],0,
function(G) 
   if IsBound(G!.Coordinates) then
      return StructuralCopy(G!.Coordinates);
   else 
      return fail; 
   fi;
end);

############################################################################
##
#M  GraphToRaw(<filename>, <G>)
##
InstallMethod(GraphToRaw,"for graphs",true,[IsString,Graphs],0,
function(filename, G) 
    local i,j,coord;
    PrintTo(filename,Order(G),"\n");
    if(IsBound(G!.Coordinates)) then 
      coord:=Coordinates(G);
    else
      coord:=List([1..Order(G)],x->[Random([-100..100]),Random([-100..100])]);
    fi;
    for i in [1..Order(G)] do
      AppendTo(filename,coord[i][1], " ");
      AppendTo(filename,coord[i][2],"\n");
    od;
    for i in [1..Order(G)] do 
      for j in [1..Order(G)] do 
         if IsEdge(G,[i,j]) then
            AppendTo(filename,"1"); 
         else 
            AppendTo(filename,"0");
         fi;
      od;
      AppendTo(filename,"\n");
    od;
end);

############################################################################
##
#M  GraphUpdateFromRaw(<filename>,<G>)
##
InstallMethod(GraphUpdateFromRaw,"for graphs",true,[IsString,Graphs],0,
function(filename, G)
    local inp,str,n,i,coord,strpair;
    inp:=InputTextFile( filename );
    str:=ReadLine(inp);
    coord:=[];
    n:=Int(Chomp(str));
    for i in [1..n] do 
       str:=ReadLine(inp);
       strpair:=SplitString(str," \n");
       coord[i]:=[Int(strpair[1]),Int(strpair[2])];
    od;
    CloseStream(inp);
    SetCoordinates(G,coord);
end);

############################################################################
##
#M  Draw( <G> )
##
InstallMethod(Draw,"for graphs",true,[Graphs],0,
function(G)
    local filename,dir,opts;
    filename:="drawgraph.raw";
    GraphToRaw(filename,G);
    dir:=Directory("./");
    opts:=[];
    Process(dir,drawproc,InputTextNone(),OutputTextNone(),opts);
    GraphUpdateFromRaw(filename,G);
end);





#E

