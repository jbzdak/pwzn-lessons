#!/bin/bash

ROOT=/home/jb/dydakyka/pwzd
SRC=$ROOT/python-nauk
CONTENT=$ROOT/content

function compile(){

    zaj=$1
    cd $SRC/$zaj
    ipython nbconvert zaj1-blok*.ipynb --to rst
    ipython nbconvert zaj1-blok*.ipynb --to html
    ipython nbconvert zaj1-blok*.ipynb --to slides --reveal-prefix ../reveal.js

    #mkdir -p $CONTENT/$zaj
    mkdir -p $CONTENT/static/$zaj

    #cp *rst $CONTENT/$zaj
    cp *html $CONTENT/static/$zaj
}

compile zaj1