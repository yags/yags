############################################################################
##
#O  EasyExec( <Dir>, <ProgName>, <InString> )
#O  EasyExec( <ProgName>, <InString> )
##  
##  <#GAPDoc Label="EasyExec">
##  <ManSection>
##  <Oper Name="EasyExec" Arg="Dir, ProgName, InString"/>
##  <Oper Name="EasyExec" Arg="ProgName, InString"/>
##  <Description>
##
##  Calls external program <A>ProgName</A> located in directory <A>Dir</A>, feeding it with
##  <A>InString</A> as input and returning the output of the external program as a 
##  string. <A>Dir</A> must be a directory object or a list of diretory objects. 
##  If <A>Dir</A> is not provided, <A>ProgName</A> must be in the system's binary PATH.
##  <C>fail</C> is returned if the program could not be located.
##
##  <Example>
##  gap> s:=EasyExec("date","");;
##  gap> s;
##  "Sun Nov  9 10:36:16 CST 2014\n"
##  gap> s:=EasyExec("sort","4\n2\n3\n1");;
##  gap> s;
##  "1\n2\n3\n4\n"
##  </Example>
##  
##  Currently, this operation is not working on MS Windows.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("EasyExec",[IsDirectory,IsString,IsString]);


############################################################################
##
#O  YAGSExec( <ProgName>, <InString> )
##  
##  <#GAPDoc Label="YAGSExec">
##  <ManSection>
##  <Oper Name="YAGSExec" Arg="ProgName, InString"/>
##  <Description>
##
##  For internal use. Calls external program <A>ProgName</A> located in directory 
##  <C><A>YAGSDir</A>/bin/</C> feeding it with <A>InString</A> as input and returning 
##  the output of the external program as a string. <C>fail</C> is returned if
##  the program could not be located.
##
##  <Example>
##  gap> YAGSExec("time","");
##  "1415551127\n"
##  gap> YAGSExec("nauty","l=0$=1dacn=5 g1,2,3. xbzq");
##  "(4,5)\n(2,3)\n[2,3,4,5,1]\n[\"cb0c\",\"484f264\",\"b0e19f1\"]\n"
##  </Example>
##    
##  Currently, this operation is not working on MS Windows.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("YAGSExec",[IsString,IsString]);


## FIXME: delete?
############################################################################
##
#O  TimeInSeconds()
##  
##  <#GAPDoc Label="TimeInSeconds">
##  <ManSection>
##  <Oper Name="TimeInSeconds" Arg=""/>
##  <Description>
##
##  Returns the time in seconds since 1970-01-01 00:00:00 UTC as an integer.
##  This is useful to measure execution time. It can also be used to impose 
##  time constraints on the execution of algorithms. Note however that the time 
##  reported is the <E>wall time</E>, not necessarily the time spent in the process
##  you intend to measure.
##
##  <Example>
##  gap> TimeInSeconds();
##  1415551598
##  gap> K:=CliqueGraph;;
##  gap>  t1:=TimeInSeconds();NumberOfCliques(K(K(K(K(Icosahedron)))));TimeInSeconds()-t1;
##  1415551608
##  44644
##  103
##  </Example>
##    
##  Currently, this operation is not working on MS Windows.
##  
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareOperation("TimeInSeconds",[]);

