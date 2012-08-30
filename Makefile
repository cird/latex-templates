LATEX = latex
BIBTEX = bibtex
PDFLATEX = pdflatex
EPSTOPDF = epstopdf
MAKEINDEX = makeindex

LISTING_SRC = $(wildcard *.tex)
LISTING_PDF = $(addsuffix .pdf, $(basename $(LISTING_SRC)))
IMAGES_SRC = $(wildcard images/*.eps)
IMAGES_PDF = $(addsuffix .pdf, $(basename $(IMAGES_SRC)))

COMMON_ARGS = -interaction=nonstopmode

default: all

%.pdf: *.tex $(IMAGES_PDF)
	-rm -f $@
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)
	$(BIBTEX) $(basename $@)
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)

%.bst: %.dbj
	$(LATEX) $<

images/%.pdf: images/%.eps
	$(EPSTOPDF) $<

all: $(LISTING_PDF)

clean:
	-rm -fv *.aux *.bbl *.blg *.log *.out *.idx *.lof *.lot *.toc *.ilg *.ind
	-rm -fv images/*.pdf

distclean: clean
	-rm -fv *.pdf
