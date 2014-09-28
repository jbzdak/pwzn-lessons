Całki numeryczne (skrótowo)
===========================

:date: 2014-09-17
:tags: zajęcia, zaj1
:category: zajęcia
:summary: Termin zajęć

#:status: draft

Całkę funkcji można estymować za pomocą szeregu aproksymacji.

Zasada prostokątów:

.. math::

    \int^b_a f(x) dx = f\left(\frac{a+b}{2}\right)*(b-a)

Zasada trójkątów:

.. math::

    \int^b_a f(x) dx = \frac{f(a)+f(b)}{2}*(b-a)

Zasada simpsona:

.. math::

    \int^b_a f(x) dx = \frac{f(a)+4*f(\frac{a+b}{2})+f(b)}{6}*(b-a)

Dokładność tych metod można podnieść dzieląc przedział całkowania na
podprzedziały i sumując.

Adaptacyjna metoda Simpsona
---------------------------

Całkowanie adaptacyjne jest heurystyką uzależniającą
krok całkowania od zmienności funkcji. Dokładnie (zapewne) omówicie(liście)
to Państwo
na metodach numerycznych, tutaj przytoczę więc algorytm:

* Epsilon oznacza maksymalny błąd całkowania
* Wyznaczamy całke w zakrese od a do b metodą simpsona.
* Wyznaczamy całkę w zakresach od a do (a+b)/2 i od (a+b)/2 do b
* Jeśli różnica między całką na całym zakresie a sumą całek na połówkach jest
  mniejsza od 15 * Epsilon zwracamy (lewe + prawe - (lewe + prawe - cale)/15
* Jeśli jest większa zwracamy sumę całek od a do (a+b)/2 i od (a+b)/21

.. note::

    Algorytm pochodzi z `wikipedii <http://en.wikipedia.org/w/index.php?title=Adaptive_Simpson%27s_method&oldid=609913261>`__
    proszę go nie sprawdzać (jest tam gotowa implementacja w Pythonie).


