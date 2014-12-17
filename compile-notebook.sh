#!/bin/bash

ROOT=/home/jb/dydakyka/pwzd
SRC=$ROOT/python-nauk
CONTENT=$ROOT/content

function compile(){

    zaj=$1
    cd $SRC/$zaj
    ipython nbconvert ${zaj}-blok*.ipynb --to rst
    ipython nbconvert ${zaj}-blok*.ipynb --to html
    ipython nbconvert ${zaj}-blok*.ipynb --to slides --reveal-prefix ../reveal.js

    #mkdir -p $CONTENT/$zaj
    mkdir -p $CONTENT/static/$zaj

    #cp *rst $CONTENT/$zaj
    cp *html $CONTENT/static/$zaj
    cp -r ${zaj}*files $CONTENT/static/$zaj
}

#compile zaj1
#compile zaj2
#compile zaj3
#compile zaj4
#compile zaj5
#compile zaj6
#compile zaj7
compile zaj8
