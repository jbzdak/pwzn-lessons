Kompilacja Pythona
==================

:date: 2014-10-01
:tags: zajęcia, zaj1, narzędzia, linux
:category: narzędzia

Często najprostszą metodą zainstalowania Pythona (szczególnie na systemach
linuksowych) jest jego kompilacja ze źródeł.

Zależności
----------

Żródła należy pobrać ze strony
`python.org <https://www.python.org/downloads/>`__,
system operacyjny oczywiście musi posiadać kompilator. Python do kompilacji wymaga
tylko zgodnego ze standarcem kompilatora C, natomiast  by skompilowany interpreter
posiadał wszystkie biblioteki należy zainstalować takie biblioteki (z
plikami nagłówkowymi):

* readline
* ncurses
* sqlite
* tcl, tk
* ffi
* bz2
* lzma

Na stabilnym debianie (ten system najlepiej znam) starczy napisać:

.. code-block:: bash

    sudo apt-get build-dep python3.2 # Instaluje zależności do budowy pythona3.2
    sudo apt-get install liblzma-dev libssl-dev openssl # Zależności pythona 3.4, których nie ma 3.2

Systemy oparte o Enterprise Linux mogą skorzystać z:

.. code-block:: bash

    sudo yum install yum-utils
    sudo yum-builddep python3

Kompilacja
----------

Kompilacja jest już prosta! Zakładam że kompilator zostanie zainstalowany do
katalogu ``/opt/py3.4``. Proszę rozpakować źródła Pythona. następnie wykonać:

.. code-block:: bash

    ./configure --prefix=/opt/py3.4
    make
    make install




