############################################################################
############################################################################
##
##
##  YAGS: Yet Another Graph System
##  C. Cedillo, R. MacKinney-Romero, M.A. Pizana, I.A. Robles 
##  and R. Villarroel-Flores.
##
##  Version 0.0.4
##  8/Nov/14
##
##  exec.gi contains the methods to call external programs easily.
##  as well as some basic system calls.
##


############################################################################
##
#M  EasyExec( <dir>, <progname>, <instring> )
#M  EasyExec( <dir-list>, <progname>, <instring> )
#M  EasyExec( <progname>, <instring> )
##
InstallMethod(EasyExec, [IsDirectory,IsString,IsString],
function(dir,progname,instring) 
   local instream, outstream, outstring,prog;
     outstring:="";
     instream:=InputTextString(instring);
     outstream:=OutputTextString(outstring,false);
     prog:=Filename(dir,progname);
     if prog=fail then return fail; fi;
   Process(DirectoryCurrent(),prog,instream,outstream,[]);
   CloseStream(outstream);
   CloseStream(instream);
   return outstring;
end);

InstallOtherMethod(EasyExec, [IsList,IsString,IsString],
function(dir,progname,instring) #here, <dir> is a list of directories.
   local instream, outstream, outstring,prog;
     outstring:="";
     instream:=InputTextString(instring);
     outstream:=OutputTextString(outstring,false);
     prog:=Filename(dir,progname);
     if prog=fail then return fail; fi;
   Process(DirectoryCurrent(),prog,instream,outstream,[]);
   CloseStream(outstream);
   CloseStream(instream);
   return outstring;
end);

InstallOtherMethod(EasyExec, [IsString,IsString],
function(progname,instring) 
   local path;
   path:=DirectoriesSystemPrograms();
   return EasyExec(path,progname,instring);
end);


############################################################################
##
#M  YAGSExec( <progname>, <instring> )
##
InstallMethod(YAGSExec, [IsString,IsString],
function(progname,instring) 
   local path;
   path:=DirectoriesPackageLibrary("yags","bin");
   return EasyExec(path,progname,instring);
end);

############################################################################
##
#M  TimeInSeconds( )
##
InstallMethod(TimeInSeconds, [],
function()    
   local str;
   str:= YAGSExec("time","");
   Remove(str);#remove trailing newline
   return Int(str);
end);


