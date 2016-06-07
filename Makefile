all: slides.pdf
debug: slides.tex slides.pdf

slides.pdf: jenkins.markdown template.latex Makefile
	pandoc jenkins.markdown -t beamer --latex-engine xelatex -o slides.pdf --template=template.latex -f markdown+lists_without_preceding_blankline-implicit_figures --latex-engine-opt "-shell-escape" --filter pandoc-citeproc

# Useful for debugging
slides.tex: jenkins.markdown template.latex Makefile
	pandoc jenkins.markdown -t beamer --latex-engine xelatex -o slides.tex --template=template.latex -f markdown+lists_without_preceding_blankline

clean:
	rm slides.pdf
