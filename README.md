# psalm class for latex

## Installation

Put the file `psalm.cls` in `~/texmf/tex/latex/psalm`

## Usage

Suggested makefile:

```make
default: psalm.pdf

psalm.pdf: psalm.ltx chant.png
	pdflatex psalm.ltx
	rm psalm.aux psalm.log

chant.png: chant.pdf
	convert -density 600 chant.pdf -trim chant.png

chant.pdf: chant.ly
	lilypond -dno-point-and-click chant.ly

.PHONY: clean
clean:
	rm -f psalm.pdf psalm.aux psalm.log chant.png chant.pdf
```

## Acknowledgments

Based on https://github.com/gregrs-uk/anglican-chant-template
