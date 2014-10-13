Całki numeryczne (skrótowo)
===========================

:date: 2014-09-17
:tags: zajęcia, zaj1
:category: zajęcia
:summary: Termin zajęć

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

Pozostałe wzory Newtona-Cotesa są na `wolphram alpha
<http://mathworld.wolfram.com/Newton-CotesFormulas.html>`__.



Adaptacyjna metoda Simpsona
---------------------------

Całkowanie adaptacyjne jest heurystyką uzależniającą
krok całkowania od zmienności funkcji. Dokładnie (zapewne) omówicie(liście)
to Państwo
na metodach numerycznych, tutaj przytoczę więc algorytm:

* Epsilon oznacza maksymalny błąd całkowania
* Wyznaczamy całke w zakrese od a do b metodą simpsona (jej wartość dalej oznaczam jako ``cale``)
* Wyznaczamy całkę w zakresach od a do :math:`\frac{a+b}{2}`
  (oznaczane jako ``lewe`` od :math:`\frac{a+b}{2}` do b (oznaczane dalej jako ``prawe``)
* Jeśli różnica między całką na całym zakresie a sumą całek na połówkach jest
  mniejsza od 15 * Epsilon zwracamy (lewe + prawe - (lewe + prawe - cale)/15
* Jeśli jest większa zwracamy sumę całek od a do :math:`\frac{a+b}{2}` i od :math:`\frac{a+b}{2}` do b


.. note::

    **UWAGA**:
    Algorytm pochodzi z `wikipedii <http://en.wikipedia.org/w/index.php?title=Adaptive_Simpson%27s_method&oldid=609913261>`__
    proszę go nie sprawdzać (jest tam gotowa implementacja w Pythonie).


