SHELL := /bin/bash
export PATH := /Applications/RStudio.app/Contents/MacOS/pandoc:$(PATH)
DEST := ../../mrgsolve/mrgsolve.github.io/user_guide


publish:
	make render
	cp -r img public
	cp -r public/ ${DEST}
	cd ${DEST} && git add * && git commit -am "publish"
	git add * && git commit -am "publish"

.PHONY: www
www:
	Rscript build.R


edits:
	git add user_guide/*
	git commit -am "edits"
	git push -u origin master

render:
	Rscript -e "bookdown::render_book('index.Rmd')"


all:
	make render
	rm -rf docs/*
	cp -r _book/* docs/

.PHONY: doxygen
doxygen:
	doxygen scripts/Doxyfile
	git add doxygen/*
