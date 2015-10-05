manual: index
	pdftex manual

all: clean cleanall texs first manual

texs:
	./buildman.pe -f config.yags

index:
	makeindex manual

first:
	tex manual
	makeindex manual
	bibtex manual

clean:
	rm -f *~

cleanall:
	rm -f manual.aux manual.bbl manual.blg manual.ind
