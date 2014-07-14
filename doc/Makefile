all: manualps
	pdftex manual

index:
	makeindex manual

texs:
	./buildman.pe -f config.yags

manual: texs index
	tex manual

manualps: manual
	dvips -o manual.ps manual.dvi

clean:
	rm -f manual.aux manual.bbl manual.blg manual.ind

first:
	tex manual
	makeindex manual
	bibtex manual
