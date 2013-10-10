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
