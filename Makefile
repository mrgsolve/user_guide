SHELL := /bin/bash
export PATH := /Applications/RStudio.app/Contents/MacOS/pandoc:$(PATH)
DEST := ../../mrgsolve/mrgsolve.github.io/user_guide

spelling:
	Rscript _spelling.R

html: 
	make render
	rm -rf docs/*
	cp -r _book/* docs/

publish:
	make render
	make pdfbook
	rm -rf docs/*
	cp -r _book/* docs/
	make spelling

.PHONY: www
www:
	Rscript build.R


pdfbook:
	Rscript -e "bookdown::render_book('index.Rmd', output_format = 'bookdown::pdf_book',quiet=TRUE)"

edits:
	git add user_guide/*
	git commit -am "edits"
	git push -u origin master

render:
	Rscript -e "bookdown::render_book('index.Rmd', quiet=TRUE)"

all:
	make render


.PHONY: doxygen
doxygen:
	doxygen scripts/Doxyfile
	git add doxygen/*
