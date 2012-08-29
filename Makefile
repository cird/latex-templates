LATEX = latex
BIBTEX = bibtex
PDFLATEX = pdflatex
EPSTOPDF = epstopdf
MAKEINDEX = makeindex
INKSCAPE = inkscape

LISTING_SRC = $(wildcard *.tex)
LISTING_PDF = $(addsuffix .pdf, $(basename $(LISTING_SRC)))
IMAGES_SRC = $(wildcard images/*.eps) $(wildcard images/*.svg)
IMAGES_PDF = $(addsuffix .pdf, $(basename $(IMAGES_SRC)))

COMMON_ARGS = -interaction=nonstopmode

default: all

images/%.pdf: images/%.eps
	$(EPSTOPDF) $<

images/%.pdf: images/%.svg
	$(INKSCAPE) --export-pdf=$@ --export-latex --export-area-page $<

%.pdf: *.tex $(IMAGES_PDF)
	-rm -f $@
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)
	$(BIBTEX) $(basename $@)
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)
	$(PDFLATEX) $(COMMON_ARGS) $(basename $@)

%.bst: %.dbj
	$(LATEX) $<

all: $(LISTING_PDF)

clean:
	-rm -fv *.aux *.bbl *.blg *.log *.out *.idx *.lof *.lot *.toc *.ilg *.ind
	-rm -fv images/*.pdf images/*.pdf_tex

distclean: clean
	-rm -fv *.pdf
