############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.5
##  2013/Octubre/11
##
##  draw.gi contains the methods to interface with the external program 'draw' 
##  for human-assisted graph drawings.
##

YAGSInfo.Draw:=rec();
YAGSInfo.Draw.Colors:=rec();
YAGSInfo.Draw.Colors.DEFAULT_FILL:="BBBBFF";
YAGSInfo.Draw.Colors.DEFAULT_FILL_HIGHLIGHTED:="FF4444";
if YAGSInfo.Arch=1 then #Unix (default)
   YAGSInfo.Draw.prog:=
        Concatenation(YAGSInfo.Directory,"/bin/draw/application.linux64/draw");
    YAGSInfo.Draw.opts:=[];
elif YAGSInfo.Arch=2 then # Mac OS X
  #
  #Mac binaries do not work in Mac using Linux binaries instead, which is OK.
  #
    #YAGSInfo.Draw.prog:=
    #    Concatenation(YAGSInfo.Directory,"/bin/draw/application.macosx/draw.app/Contents/MacOS/draw");
    #YAGSInfo.Draw.opts:=[];
    YAGSInfo.Draw.prog:=
        Concatenation(YAGSInfo.Directory,"/bin/draw/application.linux64/draw");
    YAGSInfo.Draw.opts:=[];
elif YAGSInfo.Arch=3 then #Windows
   YAGSInfo.Draw.prog:=
        Concatenation(YAGSInfo.Directory,"/bin/draw/application.windows64/draw.bat");
   YAGSInfo.WindowsDirectory:=SplitString(YAGSInfo.Directory,"","/");
   while YAGSInfo.WindowsDirectory[1] <> "cygdrive" do 
      Remove(YAGSInfo.WindowsDirectory,1);
   od;
   Remove(YAGSInfo.WindowsDirectory,1);  
   if Length(YAGSInfo.WindowsDirectory)<1 then 
      Print("#I YAGS: Draw() subsystem may not work:\n");
      Print("#I YAGS: Architecture seems to be Windows, but CYGWIN configuration is unknown\n");
      YAGSInfo.Draw.opts:=[];
   else
      Add(YAGSInfo.WindowsDirectory[1],':');
      YAGSInfo.WindowsDirectory:=
         JoinStringsWithSeparator(YAGSInfo.WindowsDirectory,"\\");
      YAGSInfo.Draw.opts:=
        [Concatenation(YAGSInfo.WindowsDirectory,"\\bin\\draw\\application.windows64\\lib\\")];
   fi;
else
   Print("#I YAGS: Unknown architecture for Draw() subsystem.\n");
   Print("#I YAGS: Trying unix defaults.\n");
   YAGSInfo.Draw.prog:=
        Concatenation(YAGSInfo.Directory,"/bin/draw/application.linux64/draw");
   YAGSInfo.Draw.opts:=[];
fi;

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
#M  GraphToRaw(<filename>, <G>, <VertexColoringRecord>, <EdgeColoringRecord>)
#M  GraphToRaw(<filename>, <G>, <VertexColoringRecord>)
#M  GraphToRaw(<filename>, <G>, <Highlighted> )
#M  GraphToRaw(<filename>, <G> )
##

InstallOtherMethod(GraphToRaw,"for graphs",true,[IsString,Graphs],0,
function(filename, G)    
    GraphToRaw(filename, G, []); 
end);

InstallMethod(GraphToRaw,"for graphs",true,[IsString,Graphs,IsList],0,
function(filename,G, highlighted)   
    local r;
    if Length(highlighted)>0 then
      r:=rec((YAGSInfo.Draw.Colors.DEFAULT_FILL_HIGHLIGHTED):= highlighted);
    else 
      r:=rec();
    fi;
    GraphToRaw(filename,G,r);
end);

InstallOtherMethod(GraphToRaw,"for graphs",true,[IsString,Graphs,IsRecord],0,
function(filename,G, VertexColoringRecord)   
    GraphToRaw(filename,G,VertexColoringRecord,rec());
end);

InstallMethod(GraphToRaw,"for graphs",true,[IsString,Graphs,IsRecord,IsRecord],0,
function(filename, G, VertexColoringRecord, EdgeColoringRecord) 
    local i,j,e,v,coord,colors,color,colorIndex,coloredVertices, coloredEdges,insertion;    
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
    #prepare colors
    colors:=Set(Concatenation(RecNames(VertexColoringRecord),RecNames(EdgeColoringRecord)));            
    for i in [1..Length(colors)] do
      AppendTo(filename, colors[i]);
      if i<Length(colors) then AppendTo(filename, " "); fi;
    od;
    AppendTo(filename,"\n");
    insertion := false;
    for i in [1..Length(RecNames(VertexColoringRecord))] do
      color := RecNames(VertexColoringRecord)[i];
      colorIndex:=String(Position(colors,color)-1); #zero based index for processing
      coloredVertices:=VertexColoringRecord.(color);
      if insertion and Length(coloredVertices)>0 then AppendTo(filename," "); insertion:=false; fi;
      for j in [1..Length(coloredVertices)] do
        v:=coloredVertices[j];
        AppendTo(filename,String(v-1),":",colorIndex);
        if j<Length(coloredVertices) then AppendTo(filename, " "); fi;
        insertion := true;
      od;      
    od;
    AppendTo(filename,"\n");    
    #colored edges
    insertion := false;
    for i in [1..Length(RecNames(EdgeColoringRecord))] do
      color := RecNames(EdgeColoringRecord)[i];
      colorIndex:=String(Position(colors,color)-1); #zero based index for processing
      coloredEdges:=EdgeColoringRecord.(color);
      if insertion and Length(coloredEdges)>0 then AppendTo(filename," "); insertion:=false; fi;
      for j in [1..Length(coloredEdges)] do
        e:=coloredEdges[j];
        AppendTo(filename,String(e[1]-1),",",String(e[2]-1),":",colorIndex); #zero based index for processing
        if j<Length(coloredEdges) then AppendTo(filename, " "); fi;
        insertion := true;
      od;      
    od;   
    AppendTo(filename,"\n");    
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
#M  Draw( <G>, <Highlighted> )
#M  Draw( <G>, <VertexColoringRecord> )
#M  Draw( <G>, <VertexColoringRecord>, <EdgeColoringRecord> )
##
InstallOtherMethod(Draw,"for graphs",true,[Graphs],0,
function(G) 
  if YAGSInfo.IsOnJupiter then      
    return Draw(G,[]);
  else
    Draw(G,[]);
  fi;
end);  
InstallMethod(Draw,"for graphs",true,[Graphs,IsList],0,
function(G,Highlighted)
    local r;
    if Length(Highlighted)>0 then
      r:=rec((YAGSInfo.Draw.Colors.DEFAULT_FILL_HIGHLIGHTED):= Highlighted);
    else 
      r:=rec();
    fi;  

    if YAGSInfo.IsOnJupiter then      
       return Draw(G,r);
    else
       Draw(G,r);
    fi;
end);
InstallOtherMethod(Draw,"for graphs",true,[Graphs,IsRecord],0,
function(G,VertexColoringRecord)
  if YAGSInfo.IsOnJupiter then      
    return Draw(G,VertexColoringRecord,rec());
  else
    Draw(G,VertexColoringRecord,rec());
  fi;
end);
InstallOtherMethod(Draw,"for graphs",true,[Graphs,IsRecord,IsRecord],0,
function(G,VertexColoringRecord, EdgeColoringRecord)
    local filename,dir,opts,template,rawGraph;
    filename:="drawgraph.raw";
    GraphToRaw(filename,G,VertexColoringRecord,EdgeColoringRecord);
    if YAGSInfo.IsOnJupiter then                
      template:=ReadAll(InputTextFile(Concatenation(YAGSInfo.Directory,"/bin/draw/p5js/draw-template.html"))); 
      rawGraph:=ReadAll(InputTextFile(filename));
      template:=ReplacedString(template,"YAGSTOKEN_RAW_GRAPH",rawGraph);        
      return Objectify( EvalString("JupyterRenderableType"), 
                        rec(
                           source:= "gap",
                           data:=rec(("text/html"):=template),
                           metadata:=rec() 
                        )
             );      
    else
      dir:=DirectoryCurrent();
      Process(dir,YAGSInfo.Draw.prog,InputTextNone(),OutputTextUser(),YAGSInfo.Draw.opts);
      GraphUpdateFromRaw(filename,G);
    fi;    
end);
#E

