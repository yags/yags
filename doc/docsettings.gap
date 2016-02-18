# Useful to create GAP documentation of this package

path := Directory(".");;
main := "main.xml";;
files := ["../PackageInfo.g", "../lib/algebraic.gd", "../lib/binaryop.gd", "../lib/distances.gd",
"../lib/iso.gd", "../lib/atlas.gd", "../lib/classes.gd", "../lib/draw.gd", "../lib/kernel.gd", 
"../lib/backtrack.gd", "../lib/cliques.gd", "../lib/exec.gd", "../lib/morph.gd", 
"../lib/basics.gd", "../lib/digraphs.gd", "../lib/families.gd", "../lib/unaryop.gd"];;
bookname := "YAGS";;

SetGapDocLaTeXOptions(rec(EarlyExtraPreamble:="\\usepackage{tikz}\n\\usetikzlibrary{positioning}\n"));; 

MakeGAPDocDoc(path, main, files, bookname);;
