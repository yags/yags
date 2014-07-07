
## FIXME: Find a robust, documented way of doing this. Perhaps in PackageInfo?
## finding path of external program `draw':
drawproc:=Concatenation(GAPInfo.PackagesInfo.yags[1].InstallationPath,
                         "/bin/draw/application.linux64/draw");

############################################################################
##
#O  SetCoordinates( <G>, <Coord> ) 
##
##  Sets the coordinates of the vertices of <G>, which are used to draw <G>. 
##
##  \beginexample
##  gap> G:=CycleGraph(4);;
##  gap> SetCoordinates(G,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(G);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  \endexample
##
DeclareOperation("SetCoordinates",[Graphs,IsList]);

############################################################################
##
#O  Coordinates( <G> )
##
##  Gets the coordinates of the vertices of <G>, which are used to draw <G>. 
##
##  \beginexample
##  gap> G:=CycleGraph(4);;
##  gap> SetCoordinates(G,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(G);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  \endexample
##
DeclareOperation("Coordinates",[Graphs]);

############################################################################
##
#O  GraphToRaw( <filename>, <G> )
##
##  Converts a Yags graph <G> into a raw format (vertices, coordinates and 
##  adjacency matrix) and writes the converted data to the file <filename>. 
##  For use of the external program `draw'.
##
##  \beginexample
##  gap> G:=CycleGraph(4);;
##  gap> GraphToRaw("mygraph.raw",G);
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
##  The user can then modify the drawing and finaly the coordinates of 
##  the vertices of G used for the drawing, are updated into the graph <G>.
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
DeclareOperation("Draw",[Graphs]);

#E
