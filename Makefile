all: slides.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty algorithm.tex
	mpost $*.mp
	pdflatex $*.latex
	pdflatex $*.latex

present: all
	dspdfviewer -a no -f slides.pdf
