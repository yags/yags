#start GAP in YAGS's doc directory when using these commands.
#also always run this commands in order in a fresh instance of GAP/YAGS.
RequirePackage("yags");
files:=["../PackageInfo.g","../lib/algebraic.gd", "../lib/cliques.gd", "../lib/iso.gd",
"../lib/atlas.gd", "", "../lib/digraphs.gd", "../lib/kernel.gd",
"../lib/backtrack.gd", "../lib/distances.gd", "../lib/morph.gd",
"../lib/basics.gd", "../lib/draw.gd", "../lib/unaryop.gd",
"../lib/binaryop.gd", "../lib/exec.gd",
"../lib/classes.gd", "../lib/families.gd"];
list:=ExtractExamples("/opt/gap4r7/pkg/yags/doc/","main.xml",files,"Subsection");;
#LogTo("examplestest.txt");
RunExamples(list);
#RunExamples(list,rec(compareFunction:="uptowhitespace"));
#RunExamples(list,rec(changeSources:=true));
#RunExamples(list,rec(changeSources:=true, compareFunction:="uptowhitespace"));
#LogTo();
