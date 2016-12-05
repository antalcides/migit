#!/bin/sh

pdflatex $1.tex && sage $1.sagetex.sage && pdflatex $1.tex
