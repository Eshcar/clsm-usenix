target   = clsm
texfiles = *.tex
figfiles = *.eps
bibfiles = $(target).bib

all: tex bib 
	dvips $(target).dvi
	ps2pdf $(target).ps $(target).pdf

tex:	bib $(texfiles) 
	/usr/local/texlive/2013/bin/x86_64-darwin/latex $(target)

bib:	$(bibfiles)
	/usr/local/texlive/2013/bin/x86_64-darwin/latex $(target)
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex $(target)
	/usr/local/texlive/2013/bin/x86_64-darwin/latex $(target)
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex $(target)

fig:	$(figfiles)
	touch $(target).tex
	
clean:
	rm -f *.log *.aux *.bbl *.blg *.ps *.pdf *~