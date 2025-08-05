#start GAP in YAGS's doc directory when using this file.
#also always run this commands in a fresh instance of GAP.
#Read("testexamples.gap");

LoadPackage("yags");

docdir:=Concatenation(YAGSInfo.Directory,"/doc");

files := ["../PackageInfo.g", "../lib/algebraic.gd", "../lib/cliques.gd", "../lib/iso.gd",
"../lib/atlas.gd", "../lib/digraphs.gd", "../lib/kernel.gd",
"../lib/backtrack.gd", "../lib/distances.gd", "../lib/morph.gd",
"../lib/basics.gd", "../lib/draw.gd",
"../lib/binaryop.gd", "../lib/exec.gd",
"../lib/classes.gd", "../lib/unaryop.gd", "../lib/families.gd"];


#list:=ExtractExamples(docdir,"main.xml",files,"Chapter");;
list:=ExtractExamples(docdir,"main.xml",files,"Single");;

LogTo("examples_single.out");
for ex in list do
#  Print("\n====================\n");
#  Print("Testing file: ", ex.file, "\n");
#  Print("Example content:\n", ex, "\n");
  RunExamples([ex], rec(compareFunction := "uptowhitespace"));
od;

#RunExamples(list,rec(compareFunction:="uptowhitespace"));
#RunExamples(list,rec(changeSources:=true, compareFunction:="uptowhitespace"));
#RunExamples(list);
#RunExamples(list,rec(changeSources:=true));
LogTo();


