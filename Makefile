BASENAME = ganetwork

BIBTEX = /usr/bin/bibtex
DVIPS  = /usr/bin/dvips
LATEX  = /usr/bin/latex
PDFLATEX  = /usr/bin/pdflatex
RM     = /bin/rm
CP     = /bin/cp

#all : $(BASENAME).pdf

all : $(BASENAME).pdf

$(BASENAME).ps : $(BASENAME).dvi
	$(DVIPS) -t letter -o $(BASENAME).ps $(BASENAME).dvi

$(BASENAME).dvi : $(BASENAME).tex $(BASENAME).bbl
	\latex  $(BASENAME); \latex $(BASENAME);

$(BASENAME).bbl : $(BASENAME).aux
	-$(BIBTEX) $(BASENAME)

$(BASENAME).aux : $(BASENAME).tex
	$(LATEX) $(BASENAME)

$(BASENAME).pdf : $(BASENAME).dvi
#	$(PDFLATEX) $(BASENAME); $(PDFLATEX) $(BASENAME);
#	\ps2pdf -dPDFSETTINGS=/prepress $<	
	\dvipdf $(BASENAME).dvi

.PHONY : clean
clean :
	$(RM) -f $(BASENAME).aux $(BASENAME).bbl $(BASENAME).blg \
	$(BASENAME).dvi $(BASENAME).lof $(BASENAME).log $(BASENAME).ps \
	$(BASENAME).toc $(BASENAME).pdf
