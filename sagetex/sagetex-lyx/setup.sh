#!/bin/bash

# may need to run as root or using sudo
# if you encounter problems, try running LyX in terminal to see error messages

# install for all users
texdirtype=TEXMFLOCAL

# install for single user
#texdirtype=TEXMFHOME

texdir=$(kpsewhich -var-value=$texdirtype)

# modify to be consistent with Sage installation
sagedir=/usr/local/sage
sagetexdir=$sagedir/local/share/texmf/tex

# copy SageTeX files into LaTeX installation
cp -R $sagetexdir $texdir

# update LaTeX configuration
texhash $texdir

# lyx preferences file defines formats and converters
cat preferences >> ~/.lyx/preferences
# if you have no existing preferences file, you can avoid copying by using following line instead 
#ln preferences ~/.lyx/

# Sage module file defines layout for LyX documents
ln sage.module ~/.lyx/layouts

# compile-pdf-sage.sh generates PDF output via SageTeX
# ensure both sage and compile-pdf-sage.sh are on execution path; need not be in $sagedir
PATH=$sagedir:$PATH
export PATH
ln compile-pdf-sage.sh $sagedir
