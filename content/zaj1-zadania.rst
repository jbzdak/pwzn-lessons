Zajęcia 1 -- zadania
====================

:date: 2014-10-01
:tags: zajęcia, zaj1, zadania
:category: zajęcia

Blok 1
******

Liczę 15 minut na wszystkie zadania

Zadanie 1
#########

1. Stwórz listę 100 zawierających sto pierwszych dodatnich liczb naturalnych
2. Policz sumę tych elementów

Zadanie 2
#########

Dokonaj całkowania metodą prostokątów funkcji sin(x)
w zakresie od zera do 2*Pi korzystając dla miliona
punktów.

Zadanie 3
#########

Dawno temu wyznaczanie funkcji trygonometrycznych było
drogie i rozwiazywano ten problem tworząc tablicę
zawierającą obliczone wartości tych funkcji w określonej
siatce współprzędnych.

Stwórz słownik zawierający wartości sin(x) dla x w
zakresie od 0 do 2*pi dla co 1E-5.

.. note::

    **Uwaga**: liczby zmiennoprzecinkowe nie bardzo
    nadają się na klucze w słowniku ze względu na
    nieintuicyjne działanie.

    Dlatego przed użyciem floata jako klucza w słowniku
    (oraz przy wybieraniu wartości) polecam
    wykorzystanie funkcji ``round``. Proszę sprawdzić tej funkcji działanie w
    `dokumentacji <https://docs.python.org/3/>`__.

Zadanie 4
#########

Stwórz strukturę danych która reprezentuje zoo.
Będzie to lista słowników, każdy słownik reprezentuje jedno zwierze.
Lista powinna mieć 5 elementów, a każde zwierze przynajmniej 3 atrybuty w tym imię.

Wyświetl:

1. Całą strukturę danych
2. Dane drugiego zwierzęcia
3. Imiona wszystich zwierząt

Blok 2
******

Zadanie 1
#########

Dokumentacja funkcji
`sorted <https://docs.python.org/3/library/functions.html#sorted>`__
twierdzi, że funkcja przekazana jako argument ``key`` jest
wykonywana raz dla każdego elementu tablicy. Nie wierzę w to!

Napisz funkcję/obiekt key który liczy ile razy została wywołana i
udowodnij mi że dokumentacja nie kłamie.

Podpowiedż:

* Możesz użyć domknięcia.
* Możesz zamiast funkcji przekazać obiekt, który ma przeładowany operator ().

Zadanie 2
#########

Napisz funkcję która jest bardziej rozwiniętą funkcji ``range``,
przjmować ona będzie trzy argumenty:
``x0``, ``xN`` oraz ``n``. Funkcja ta zwracać będzie listę
mającą ``n`` elementów pierwszym jest ``x0``, ostatnim ``xN``,
a wartości pomiędzy są rozłożone równomiernie.

Funkcja ta może przyjmować wartości zmiennoprzecinkowe.

Zadanie 3
#########

Napisz funkcję która ma taką sygnaturę i działanie zgodne z dokumentacją:

.. code-block:: python

    def furier(furier_arg, points):
        """
            Funkcja ewaluuję wartość funkcji przekazanej jako składowe
            rozbicia na szereg furiera.

            furier_arg to lista floatów które definiują współczynniki rozkładu pewnej funkcji F
            na współczynniki furiera (dla ustalenia uwagi są to współczynniki przy sinusach)
            points to list punktow dla których wartości funkcji F będą zwrócone
        """
        pass

Zadanie 3a
##########

Popraw funkcję z poprzedniego zadania tak by można było wybrać czy rozkładamy na `sin` czy `cos`.

Zadanie 4
#########

Stwórz klasę `Integrator` która implementować będzie interfejs dokonujący
całkowania numerycznego.

Stwórz klasy `RectangleIntegrator` (całkująca metodą prostokątów),
`TrapesoidIntegrator` (całkująca metodą trójkątów),
`SimpsonIntegrator` (Całkujące metodą Simpsona) dziedziczą po klasie `Integrator`.

Dla osób które tego nie pamiętają: `informacje o całkowaniu numerycznym
<{filename}/numeryczne.rst>`__.

Klasa ta dodatkowo powinna dzielić przedział całkowania na N
podprzedziałów, dla każdego z podprzedziałów należy zastosować
odpowiednią metodę.

Zadanie 5: Zadanie na pięć
##########################

**Zadanie na 5** wykonanie tego zadania konieczne jest do uzyskania
oceny 5 z tych zajęć.


Stwórz klasę która będzie dokonywała całkowania za pomocą wzorów
Newtona-Cotesa rzędu 3, 4, 5 i 6.

**Uwaga** To jest zadanie w którym powinniście wykorzystać programowanie
danymi. Współczynniki powinny być zapisane w jakiejś strukturze danych,
a następnie ten sam algorytm powinien wyznaczać całkę N-tego rzędu.

Tutaj nie trzeba dzielić przedziału całkowania na dodatkowe podprzedziały.

W tym zadaniu powinieneś skorzystać z wyników niektórych poprzednich
zadań :)

Zadanie 5: **Challenge**
########################

**Challenge** to zadanie które jest opcjonalne, nie wpływa na ocenę
z zajęć ale jego wykonanie jest konieczne do wyjścia wcześniej.

Zaimplementuj klasę dokonującą całkowania adaptacyjną metodą Simpsona.



