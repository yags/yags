
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
#O  CopyCoordinates( <G>, <H> );
#O  CopyCoordinates( <G>, <H>, <V> );
##  
##  <#GAPDoc Label="CopyCoordinates">
##  <ManSection>
##  <Oper Name="CopyCoordinates" Arg="G, H"/>
##  <Oper Name="CopyCoordinates" Arg="G, H, V"/>
##  <Description>
##  
##  <P/>Sets the coordinates of <A>G</A> to be a copy of those of <A>H</A>. 
##  If the coordinates of <A>H</A> have not been previously set, 
##  <Ref Oper="CopyCoordinates"/> silently does nothing. <A>G</A> and 
##  <A>H</A> must have the same number of vertices, otherwise, <A>fail</A> 
##  is returned. 
##  
##  <P/><Example>
##  gap> H:=CycleGraph(4);;
##  gap> SetCoordinates(H,[[-10,-10 ],[-10,20],[20,-10 ], [20,20]]);;
##  gap> G:=CompleteGraph(4);;
##  gap> Coordinates(G);
##  fail
##  gap> CopyCoordinates(G,H);
##  gap> Coordinates(G);
##  [ [ -10, -10 ], [ -10, 20 ], [ 20, -10 ], [ 20, 20 ] ]
##  </Example>
##  
##  <P/>In its second form, <A>V</A> is a list specifying how the vertices of 
##  <A>G</A> are obtained from <A>H</A>. Often, <A>V</A> can be the 
##  <Ref Func="VertexNames"/> of <A>G</A>. Formally, each element of <A>V</A> 
##  specifies a vertex of <A>G</A>, hence it is necessary that 
##  <C>Length(<A>V</A>)=Order(<A>G</A>)</C>. Also, each element of <A>V</A> 
##  is either a vertex of <A>H</A> or a subset of vertices of <A>H</A>. 
##  Then the coordinates of the vertex specified by an element <C>s</C> of 
##  <A>V</A> is simply the average of the coordinates of the vertices of 
##  <C>s</C> in <A>H</A>.  
##
##  <P/><Example>
##  gap> H:=PathGraph(5);
##  Graph( rec( Category := SimpleGraphs, Order := 5, Size := 
##  4, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3, 5 ], [ 4 ] ] ) )
##  gap> SetCoordinates(H,[[0,0],[10,0],[20,0],[50,0],[110,0]]);
##  gap> G:=PathGraph(4);
##  Graph( rec( Category := SimpleGraphs, Order := 4, Size := 
##  3, Adjacencies := [ [ 2 ], [ 1, 3 ], [ 2, 4 ], [ 3 ] ] ) )
##  gap> CopyCoordinates(G,H,[[1,2],3,[],[3,4,5]]);
##  gap> Coordinates(G);
##  [ [ 5, 0 ], [ 20, 0 ], [ 0, 0 ], [ 60, 0 ] ]
##  </Example>
##
##  <Ref Oper="CopyCoordinates"/> is used internally by &YAGS; in most of its 
##  standard constructions.
##
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("CopyCoordinates",[Graphs,Graphs,IsList]);

############################################################################
##  
#O  GraphToRaw( <Filename>, <G> )
#O  GraphToRaw( <FileName>, <G>, <Highlighted> )
##  
##  <#GAPDoc Label="GraphToRaw">
##  <ManSection>
##  <Oper Name="GraphToRaw" Arg="FileName, G"/>
##  <Oper Name="GraphToRaw" Arg="FileName, G, Highlighted"/>
##  <Description>
##  
##  <P/>Converts a &YAGS; graph <A>G</A> into a raw format (number of
##  vertices, coordinates, adjacency matrix, number of highlighted
##  vertices and list of highlighted vertices) and writes the
##  converted data to the file <A>FileName</A>.  For use by the
##  external program <C>draw</C> (see <Ref Func="Draw"/> ). Intended
##  for internal use only.
##  
##  <P/><Example>
##  gap> G:=CycleGraph(4);;
##  gap> GraphToRaw("mygraph.raw",G);
##  </Example>
##  
##  If <A>Highlighted</A> is not specified, it is assumed to be the
##  empty list. The vertices listed in <A>Highlighted</A> are drawn in
##  a highlighted color by <C>Draw()</C>.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("GraphToRaw",[IsString,Graphs,IsList]);

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
##  #I Draw: Opening new window for drawing.
##  #I Draw: Type 'H' on the new window to display help menu.
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
##  #I Draw: Opening new window for drawing.
##  #I Draw: Type 'H' on the new window to display help menu.
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
##  "/opt/gap-4.14.0/pkg/yags/bin/draw/application.linux64/draw"
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
    
#E
