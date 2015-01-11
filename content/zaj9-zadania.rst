Zajęcia 9 -- zadania
====================

:date: 2015-01-07
:tags: zajęcia, zaj9 zadania
:category: zajęcia

Zadania
-------

Zadania proszę rozwiązać i zapisać w swoich repozytoriach githuba.

Zadanie 1
---------

Poniższy rysunek obrazuje przykładowe widmo gamma uzyskane ze scyntylatora:

.. figure:: {filename}/static/zaj9/Co60_Spectrum.JPG
    :height: 300px
    :width: 600px

    By HPaul (Own work) [`GFDL <http://www.gnu.org/copyleft/fdl.html>`__) or `CC-BY-SA-3.0 <http://creativecommons.org/licenses/by-sa/3.0/>`__], via
    `Wikimedia Commons <https://commons.wikimedia.org/wiki/File:Co60_Spectrum.JPG>`__

By znaleźć parametry danego piku (położenie, szerokość, ilość
zliczeń) generalnie do danych dopasowuje się funkcję:

.. math::
    f\left(x\right) = a \exp{\left(- { \frac{(x-b)^2 }{ 2 c^2} } \right)} + c\cdot x + d

czyli sumę gaussa i prostej. Prosta odwzorowuje tło, które zmienia
się powoli (i na długości jednego piku można założyć że zmienia się
liniowo), a sama funkcja gaussa odwzrowuje pik.

Przykład rozkladu (generowanego sztucznie) piku:

.. figure:: {filename}/static/zaj9/download.png

W pythonie do fitowania można wykorzystać funkcję:
`scipy.optimize.curve_fit <http://docs.scipy.org/doc/scipy-0.14.0/reference/generated/scipy.optimize.curve_fit.html>`__
która przyjmuje takie parametry:

* ``f`` funkcję o sygnaturze ``f(x, a, b, c...)``, gdzie
  x to iterabla która zawiera kolejne wartości odciętych
  a ``a, b, ...`` to kolejne parametry tej funkcji.

  Funkcja ta zwraca ta tablicę zawierającą wartości funkcji
  w kolejnych miejscach ``x``
* ``x`` współrzędne do których dopasowujemy
* ``y`` wartości funkcji którą poszukujemy
* ``p0`` początkowe wartości parametrów


**Uwaga**: Generalnie ``curve_fit`` jest bardzo czułe na
"sensownie" wybrane wartości parametrów początkowych.
Proponuję przyjęcie następujących wartości początkowych:
``c = d = 0`` (brak tła), wartości ``a``, ``b``, ``c`` wyznaczyć 
empirycznie z rozkładu ``a=max(y)``, ``b`` to średnia, ``c`` to
odchylenie standardowe (tutaj uczulam że wymaga to policzenia
średniej i odchylenia z histogramu).

Zadanie
*******

Zadanie polega na:

1. Napisaniu procedury która fituje odpowiednią funkcję do rozkładu
2. Uruchomieniu jej w ipython notebooku równilegle na wielu procesorach
   (każdy procesor dopasowuje do innego zestawu danych).
3. Wyrysowaniu (dla wybranych fitów): oryginalnych danych, dopasowanej funkcji
   oraz obu jej składowych.

Dane
----

Dane znajdują się `tutaj <http://db.fizyka.pw.edu.pl/pwzn-data/zaj9/>`__.

Dane są zapisane w binarnym formacie i zawierają macież ``float`` ów o kształcie
1000 x 10000. Do jej odczytu można zastosować taką linijkę:

.. code-block:: python

    m2 = np.memmap("/tmp/data.bin", dtype="float", shape=(1000, 10000))

W kolejnych rzędach macierzy są tablice wartości funkcji do których trzeba
dopasować odpowiednie dane. Wartości odciętej są dla każdego zestawu takie same
i zostały wygenerowane za pomocą:

.. code-block:: python

    np.linspace(-40, 40, 10000)

Tak więc by wyświetlić jeden pik należy zastosować linijkę:

.. code-block:: python

    x = np.linspace(-40, 40, 10000)
    y = m2[1]

    pylab.plot(x, y)

Zadanie 2
---------
i
Napisać przykład z grzałką i z termostatem tak by odwzorować również wpływ grzałki na
temperaturę. W tym celu należy skomunikować komponent z termometru z grzałką tak
by był informowany o fakcie grzania.

Rozwięzanie można napisać za pomocą Pyro lub pyzmq (albo dowolne inne).


