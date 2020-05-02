
## FIXME: Extend the .raw format to admit lists of graphs, 3D coordinates, 
##        viewports, drawing scale, etc.
## FIXME: Document the .raw format.

############################################################################
##
#O  SetCoordinates( <G>, <Coord> ) 
##  
##  <#GAPDoc Label="SetCoordinates">
##  <ManSection>
##  <Oper Name="SetCoordinates" Arg="G, Coord"/>
##  <Description>
##  
##  <P/>Sets the coordinates of the vertices of <A>G</A>, which are
##  used to draw <A>G</A> by <Ref Func="Draw"/>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;
##  gap> Coordinates(g);
##  fail
##  gap> SetCoordinates(g,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(g);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("SetCoordinates",[Graphs,IsList]);

############################################################################
##
#O  Coordinates( <G> )
##  
##  <#GAPDoc Label="Coordinates">
##  <ManSection>
##  <Oper Name="Coordinates" Arg="G"/>
##  <Description>
##  
##  <P/>Gets the coordinates of the vertices of <A>G</A>, which are
##  used to draw <A>G</A> by <C>Draw( <A>G</A> )</C>. If the
##  coordinates have not been previously set, <C>Coordinates</C>
##  returns <A>fail</A>.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;
##  gap> Coordinates(g);
##  fail
##  gap> SetCoordinates(g,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);
##  gap> Coordinates(g);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  </Example>
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Coordinates",[Graphs]);

############################################################################
##  
#O  GraphToRaw( <Filename>, <G> )
#O  GraphToRaw( <FileName>, <G>, <Highlighted> )
#O  GraphToRaw( <FileName>, <G>, <VertexColoringRecord> )
#O  GraphToRaw( <FileName>, <G>, <VertexColoringRecord>, <EdgeColoringRecord>)
##  
##  <#GAPDoc Label="GraphToRaw">
##  <ManSection>
##  <Oper Name="GraphToRaw" Arg="FileName, G"/>
##  <Oper Name="GraphToRaw" Arg="FileName, G, Highlighted"/>
##  <Description>
##  
##  <P/>Converts a &YAGS; graph <A>G</A> into a raw format (number of
##  vertices, coordinates, adjacency matrix, list of colors in hex format and a 
##  list of indices from the list of colors used for each vertex) and writes the
##  converted data to the file <A>FileName</A>.  For use by the
##  external program <C>draw</C> (see <Ref Func="Draw"/> ). Intended
##  for internal use only.
##  
##  <P/><Example>
##  gap> g:=CycleGraph(4);;
##  gap> GraphToRaw("mygraph.raw",g);
##  gap> GraphToRaw("mygraph2.raw",g,[1,2]);
##  gap> GraphToRaw("mygraph3.raw",g,rec(69D2E7:=[1,2]));
##  gap> GraphToRaw("mygraph4.raw",g,rec(69D2E7:=[1,2,3]),rec(CD5C5C:=[[1,2],[3,4]]));
##  </Example>
##  
##  If <A>Highlighted</A> is not specified, it is assumed to be an
##  empty list. The vertices listed in <A>Highlighted</A> are drawn in
##  a highlighted color by <C>Draw()</C>. 
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GraphToRaw",[IsString,Graphs,IsList]);
DeclareOperation("GraphToRaw",[IsString,Graphs,IsRecord,IsRecord]);

############################################################################
##  
#O  GraphUpdateFromRaw( <FileName>, <G> )
##  
##  <#GAPDoc Label="GraphUpdateFromRaw">
##  <ManSection>
##  <Oper Name="GraphUpdateFromRaw" Arg="FileName, G"/>
##  <Description>
##  
##  <P/>Updates the coordinates of <A>G</A> from a file
##  <A>FileName</A> in raw format as written by <C>draw</C> (see <Ref
##  Func="Draw"/> ). Intended for internal use only.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GraphUpdateFromRaw",[IsString,Graphs]);

##FIXME: write "RawToGraph(filename)"

############################################################################
##
#O  Draw( <G> )
#O  Draw( <G>, <Highlighted> )
##  
##  <#GAPDoc Label="Draw">
##  <ManSection>
##  <Oper Name="Draw" Arg="G"/>
##  <Oper Name="Draw" Arg="G, Highlighted"/>
##  <Description>
##  
##  <P/>Takes a graph <A>G</A> and makes a drawing of it in a separate
##  window possibly with a list of <A>Highlighted</A> vertices.  The
##  user can then view and modify the drawing and finally save the
##  vertex coordinates of the drawing into the graph <A>G</A>.
##  
##  <P/>Within the separate window, type h to toggle on/off the help
##  menu. Besides the keyboard commands indicated in the help menu,
##  the user may also move vertices (by dragging them), move the whole
##  drawing (by dragging the background) and scale the drawing (by
##  using the mouse wheel).
##  
##  <P/><Log>
##  gap> Coordinates(Icosahedron);
##  fail
##  gap> Draw(Icosahedron);
##  gap> Coordinates(Icosahedron);
##  [ [ 29, -107 ], [ 65, -239 ], [ 240, -62 ], [ 78, 79 ], [ -107, 28 ], 
##    [ -174, -176 ], [ -65, 239 ], [ -239, 62 ], [ -78, -79 ], [ 107, -28 ], 
##    [ 174, 176 ], [ -29, 107 ] ]
##  </Log>
##  
##  In its second form, <A>Highlighted</A> is a list of vertices of
##  <A>G</A> and those vertices are drawn in a highlighted
##  color by <C>Draw()</C>.
##
##  <P/><Log>
##  gap> Draw(Cube,[1,4,6,7]);
##  </Log>
##  
##  <C>Draw()</C> uses an external Java program (included with &YAGS;)
##  and hence, may not work on some platforms.
##  
##  <P/>Current version has been tested successfully on GNU/Linux, Mac
##  OS X and Windows7.  For other platforms (specially 32-bit
##  platforms), you should probably (at least) set up correctly the
##  variables <C>YAGSInfo.Draw.prog</C> and <C>YAGSInfo.Draw.opts</C>.
##  The former is a string representing the external binary program
##  path and name; the latter is a list of strings representing the
##  required command line options. Java binaries are provided for 32
##  and 64 bit versions of GNU/Linux (which also works for Mac OS X)
##  and of MS Windows.
##  
##  <P/><Log>
##  gap> YAGSInfo.Draw.prog; YAGSInfo.Draw.opts;
##  "/opt/gap4r8/pkg/yags/bin/draw/application.linux64/draw"
##  [  ]
##  </Log>
##  
##  <P/>The source code for the external program, made using
##  <E>processing</E> (<URL>http://processing.org</URL> version 2.2.1;
##  version 3 is not working well for us), is
##  <F>YAGS-DIR/bin/draw/draw.pde</F>
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("Draw",[Graphs,IsList]);
DeclareOperation("Draw",[Graphs,IsRecord,IsRecord]);
    
#E
