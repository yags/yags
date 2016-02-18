
## FIXME: Extend the .raw format to admit lists of graphs, 3D coordinates, 
##        viewports, drawing scale, etc.
## FIXME: Document the .raw format.

############################################################################
##
#O  SetCoordinates( <G>, <Coord> ) 
##
##  Sets the coordinates of the vertices of <G>, which are used to draw <G>
##  by `Draw( <G> )'. 
##
##  \beginexample
##  gap> g:=CycleGraph(4);;
##  gap> SetCoordinates(g,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(g);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  \endexample
##
DeclareOperation("SetCoordinates",[Graphs,IsList]);

############################################################################
##
#O  Coordinates( <G> )
##
##  Gets the coordinates of the vertices of <G>, which are used to draw <G> 
##  by `Draw( <G> )'. If the coordinates have not been previously set, `Coordinates' 
##  returns <fail>.
## 
##
##  \beginexample
##  gap> g:=CycleGraph(4);;
##  gap> Coordinates(g);
##  fail
##  gap> SetCoordinates(g,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(g);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  \endexample
##
DeclareOperation("Coordinates",[Graphs]);

############################################################################
##
#O  GraphToRaw( <FileName>, <G> )
##
##  Converts a {\YAGS} graph <G> into a raw format (number of vertices, coordinates and 
##  adjacency matrix) and writes the converted data to the file <FileName>. 
##  For use by the external program `draw' (see `Draw(<G>)' ).
##
##  \beginexample
##  gap> g:=CycleGraph(4);;
##  gap> GraphToRaw("mygraph.raw",g);
##  \endexample
##
DeclareOperation("GraphToRaw",[IsString,Graphs]);

############################################################################
##
#O  GraphUpdateFromRaw( <FileName>, <G> )
##
##  Updates the coordinates of <G> from a file <FileName> in raw format. 
##  Intended for internal use only.
##
DeclareOperation("GraphUpdateFromRaw",[IsString,Graphs]);

##FIXME: write "RawToGraph(filename)"

############################################################################
##
#O  Draw( <G> )
##
##  Takes a graph <G> and makes a drawing of it in a separate window. 
##  The user can then view and modify the drawing and finally save the vertex 
##  coordinates of the drawing into the graph <G>.
##  
##  Within the separate window, type h to toggle on/off the help menu. Besides the 
##  keyword commands indicated in the help menu, the user may also move vertices 
##  (by dragging them), move the whole drawing (by dragging the background) and 
##  scale the drawing (by using the mouse wheel).
## 
##  \beginexample
##  gap> Coordinates(Icosahedron);
##  fail
##  gap> Draw(Icosahedron);
##  gap> Coordinates(Icosahedron);
##  [ [ 29, -107 ], [ 65, -239 ], [ 240, -62 ], [ 78, 79 ], [ -107, 28 ], 
##    [ -174, -176 ], [ -65, 239 ], [ -239, 62 ], [ -78, -79 ], [ 107, -28 ], 
##    [ 174, 176 ], [ -29, 107 ] ]
##  \endexample
##
##  `Draw()' uses an external java program (included with {\YAGS}) and hence, may not work on some platforms.
##
##  Current version has been tested successfully on GNU/Linux, Mac OS X and Windows7. 
##  For other platforms (specially 32-bit platforms), you should probably (at least) set up 
##  correctly the variables `YAGSInfo.Draw.prog' and `YAGSInfo.Draw.opts'. 
##  The former is a strings representing the external binary program path and name; the latter 
##  is a list of strings representing the required command line options. Java binaries are 
##  provided for 32 and 64 bit versions of GNU/Linux (which also works for Mac OS X) and of 
##  MS Windows.
##  
##  \beginexample
##  gap> YAGSInfo.Draw.prog; YAGSInfo.Draw.opts;
##  "/usr/share/gap/pkg/yags/bin/draw/application.linux64/draw"
##  [  ]
##  \endexample
##  
DeclareOperation("Draw",[Graphs]);

#E
