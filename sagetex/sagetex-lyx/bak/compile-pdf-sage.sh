#!/bin/bash

sagefile=$1
texfile=${sagefile%.sagetex.sage}.tex

# for one-step conversion, uncomment lines below and corresponding line in ~/.lyx/preferences

#texfile=$1
#sagefile=${texfile%.tex}.sagetex.sage
#pdflatex $texfile

sage $sagefile
pdflatex $texfile

exit 0

