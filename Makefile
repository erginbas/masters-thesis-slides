FIGDIR = figures
FIGSRC = fig_pasmt_tree fig_fasmt_tree fig_mismatch fig_hypergraph fig_oracles
FIGS   = $(addprefix $(FIGDIR)/, $(addsuffix .pdf, $(FIGSRC)))

all: main.pdf

$(FIGDIR)/%.pdf: $(FIGDIR)/%.tex
	cd $(FIGDIR) && pdflatex -interaction=nonstopmode $*.tex

main.pdf: main.tex macros.tex $(FIGS)
	latexmk -pdf -interaction=nonstopmode main.tex

clean:
	latexmk -C main.tex
	rm -f $(FIGDIR)/*.aux $(FIGDIR)/*.log $(FIGDIR)/*.out

.PHONY: all clean
