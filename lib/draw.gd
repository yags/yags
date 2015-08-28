
## FIXME: Find a robust, documented way of doing this. Perhaps in PackageInfo?
## finding path of external program `draw':
drawproc:=Concatenation(GAPInfo.PackagesInfo.yags[1].InstallationPath,
                         "/bin/draw/application.linux64/draw");


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
#O  GraphToRaw( <filename>, <G> )
##
##  Converts a \YAGS\ graph <G> into a raw format (number of vertices, coordinates and 
##  adjacency matrix) and writes the converted data to the file <filename>. 
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
#O  GraphUpdateFromRaw( <filename>, <G> )
##
##  Updates the coordinates of <G> from a file <filename> in raw format. 
##  Intended for internal use only.
##
DeclareOperation("GraphUpdateFromRaw",[IsString,Graphs]);

##FIXME: write "RawToGraph(filename)"

############################################################################
##
#O  Draw( <G> )
##
##  Takes a graph <G> and makes a drawing of it in a separate window. 
##  The user can then view and modify the drawing and finaly save the vertex 
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
##  This preliminary version, should work fine on GNU/Linux. For other plataforms,
##  you should probably (at least) set up correctly the variable `drawproc'
##  which should point to the correct external program binary. Java binaries are provided for 
##  GNU/Linux, Mac OS X and Windows. 
##  
##  \beginexample
##  gap> drawproc;
##  "/usr/share/gap/pkg/yags/bin/draw/application.linux64/draw"
##  \endexample
##  
DeclareOperation("Draw",[Graphs]);

#E
