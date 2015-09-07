############################################################################
##
#O  EasyExec( <dir>, <progname>, <instring> )
#O  EasyExec( <progname>, <instring> )
##
##  Calls external program <prog> located in directory <dir>, feeding it with
##  <instring> as input and returning the output of the external program as a 
##  string. <dir> must be a directory object or a list of diretory objects. 
##  If <dir> is not provided, <prog> must be in the system's binary PATH.
##  'fail' is returned if the program could not be located.
##
##  \beginexample
##  gap> s:=EasyExec("date","");;
##  gap> s;
##  "Sun Nov  9 10:36:16 CST 2014\n"
##  gap> s:=EasyExec("sort","4\n2\n3\n1");;
##  gap> s;
##  "1\n2\n3\n4\n"
##  \endexample
##  
DeclareOperation("EasyExec",[IsDirectory,IsString,IsString]);


############################################################################
##
#O  YagsExec( <progname>, <instring> )
##
##  For internal use. Calls external program <prog> located in directory 
##  '<yags-dir>/bin/' feeding it with <instring> as input and returning 
##  the output of the external program as a string. 'fail' is returned if
##  the program could not be located.
##
##  \beginexample
##  gap> YagsExec("time","");
##  "1415551127\n"
##  gap> YagsExec("nauty","l=0$=1dacn=5 g1,2,3. xbzq");
##  "(4,5)\n(2,3)\n[2,3,4,5,1]\n[\"cb0c\",\"484f264\",\"b0e19f1\"]\n"
##  \endexample
##  
DeclareOperation("YagsExec",[IsString,IsString]);


## FIXME: delete?
############################################################################
##
#O  TimeInSeconds()
##
##  Returns the time in seconds since 1970-01-01 00:00:00 UTC as an integer.
##  This is useful to measure execution time. It can also be used to impose 
##  time constraints on the execution of algorithms. Note however that the time 
##  reported is the 'wall time', not necessarily the time spent in the process
##  you intend to measure.
##
##  \beginexample
##  gap> TimeInSeconds();
##  1415551598
##  gap> K:=CliqueGraph;;
##  gap>  t1:=TimeInSeconds();NumberOfCliques(K(K(K(K(Icosahedron)))));TimeInSeconds()-t1;
##  1415551608
##  44644
##  103
##  \endexample
##  
DeclareOperation("TimeInSeconds",[]);

