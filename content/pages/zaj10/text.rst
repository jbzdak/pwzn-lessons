Zarządzanie projektem
=====================

:date: 2015-01-05


Wstęp
-----

Tematem zajęć jest zarządzanie projektem Pythona, z naciskiem na
zarządzanie projektem *małym* czyli takim nad którym pracuje kilka osób,
albo wręcz jest to projekt jednoosobowy.

Narzędzia
---------

Podstawowe narzędzia które ułatwiają pracę nad projektem to:

* System kontroli wersji
* Issue tracker
* Automatyczne testy kodu
* Narzędzie do generowania dokumentacji projektu
* Wikipedia projektu


System kontroli wersji
**********************

W zasadzie wszystkie systemy kontroli wersji które są
`rozproszone <http://en.wikipedia.org/w/index.php?title=Distributed_revision_control&oldid=639181191>`__
są tak samo udanymi narzędziami.

Z tych narzędzi ja najbardziej lubię `git-a <http://git-scm.com/>`__, głównie
z tego powodu że pozwala on na bardzo elastyczną pracę oraz umożliwia
wykonywanie operacji które są uznane za "niebezpieczne" (np. przepisywanie
historii projektu).

Przy wspólnej pracy nad projektem bardzo przydaje się centralne repozytorium
kodu, repozytoria takie udostępnia np. serwis GitHub i Bitbucket. W obu serwisach
repozytoria które pobrać mogą wszyscy są darmowe, a repozyoria prywatne są płatne.
Github daje studentom darmowo 5 repozytoriów prywatnych a Bitbucket --- daje ich
nieograniczoną ilość.

Dokumentacja
************

Dokumentacja projektu jest ważna, nawet jeśli projektem który dokumentujecie jest
Wasza praca inżynierska.

* Ułatwia wrocenie do projektu po tym jak przez długi czas
  będzie on leżał odłogiem.
* Ułatwia przekazanie projektu komuś innemu.
* Ułatwia wprowadzenie innych osób do projektu.

Minimum dokumentacji w projekcie to wyjaśnienie: co poszczególne moduły robią i dlaczego
robią to w taki sposób.

Dokumentację można podzielić na dwie kategorie:

* Dokumentację API (dokumentację interfrejsów programistycznych) --- dokumentacja
  zawiera opis poszczególnych struktur danych, funkcji oraz metod w programie.
  Przykładem dokumentacji API jest `dokumentacja javy <http://docs.oracle.com/javase/8/docs/api/>`__
  Dokumentacja API odpowie na pytanie: "Jakie parametry ma funkcja ``pylab.plot``"
* Dokumentację narracyjną. Dokumentacja API pozwala bardzo szybko wyszukać
  informację jeśli wie się czego się szuka, natomiast trudno jest w niej
  znaleźć odpowiedź na niezbyt konkretne pytanie. Dokumentacja narracyjna
  zaczyna od problemu --- i pokazuje jak go rozwiązać. Dokumentacja narracyjna
  odpowie nam na pytanie: "Jak narysować za pomocą ``matplotlib`` logarytmiczny
  histogram".

Bardzo często używanym narzędziem do robienia dokumentacji projektów Pythonowych
jest `Sphinx <http://sphinx-doc.org/>`__. Może on służyć do:

* Pisania dokumentacji (zarówno dokumentacji API jaki i narracyjnej). Sphinks
  wspiera równieć generowanie dokumentacji ze specjalnie sformatowanych
  `docstringów <http://en.wikipedia.org/w/index.php?title=Docstring&oldid=637556513>`__
  za pomocą modułu `autodoc <http://sphinx-doc.org/ext/autodoc.html>`__.
* Pisania `książek <https://readthedocs.org/projects/the-axiom-book/>`__
* Tworzenia `stron przedmiotów <http://db.fizyka.pw.edu.pl//bazy_danych_ed_20/>`__
  (na marginesie: jednak do tworzenia stron przedmiotu lepszy wydaje
  się być `pelican <http://docs.getpelican.com/en/3.5.0/>`__.

Są serwisy internetowe które pobierają Wasz projekt z Waszego repozyorium,
generują i publikują dokumentację Waszego projektu, przykładem takiej strony
jest: `read the docs <https://readthedocs.org/>`__.

Issue tracker
*************

Issue tracker jest programem zawierającym informacje o zadaniach do wykonania w
danym projekcie. Generalnie zadaniem issue trackera jest wspieranie większych
projektów informatycznych --- i na przykład podział pracy między programistami.

W projektach typu: "praca inżynierska" issue tracker ma inne zadania ---
zasadniczo w pracy nad waszą pracą dyplomową można oczekiwać sporych przerw
(na przykład z powodu sesji czy większego kolokwium). Issue tracker bardzo
pomaga wrócić do pracy po takiej przerwie.

Funkcję issue trackera może pełnić plik ``todo.txt`` w katalogu waszego
projektu, dodatkowo zarówno bitbucket jak i github mają wbudowane proste
issue trackery.

Komercyjne rozwiązania issue trackery są niestety płatne. Ja używałem takich:

* `Youtrack <https://www.jetbrains.com/youtrack/>`__. Darmowa licencja
  do 10 osób, własnym hostowaniu projektu.
* `JIRA <https://www.atlassian.com/software/jira>`__. Darmowa licencja
  dla projektów open-source wraz z hostingiem.

Testy
-----

Dobrym zwyczajem jest pisanie testów do kodu równolegle z pisaniem kodu.

Co testować:

* Poprawność działania modeli które tworzycie (czy dają sensowne wyniki)
* Poprawność analizy danych.

W bibliotece standardowej Pythona są dwa moduły służące do testowania kodu,
``doctest`` oraz ``unittest``.

Doctest
*******

Doctest jest systemem modułem który tworzy testy ze specjalnie sformatowanych
linii z dosctringów w obiektów w danym module.

Przykład z `dokumentacji <https://docs.python.org/3.4/library/doctest.html>`__:

.. code-block:: python

    """
    This is the "example" module.

    The example module supplies one function, factorial().  For example,

    >>> factorial(5)
    120
    """

    def factorial(n):
        """Return the factorial of n, an exact integer >= 0.

        If the result is small enough to fit in an int, return an int.
        Else return a long.

        >>> [factorial(n) for n in range(6)]
        [1, 1, 2, 6, 24, 120]
        >>> [factorial(long(n)) for n in range(6)]
        [1, 1, 2, 6, 24, 120]
        >>> factorial(30)
        265252859812191058636308480000000L
        >>> factorial(30L)
        265252859812191058636308480000000L
        >>> factorial(-1)
        Traceback (most recent call last):
            ...
        ValueError: n must be >= 0

        Factorials of floats are OK, but the float must be an exact integer:
        >>> factorial(30.1)
        Traceback (most recent call last):
            ...
        ValueError: n must be exact integer
        >>> factorial(30.0)
        265252859812191058636308480000000L

        It must also not be ridiculously large:
        >>> factorial(1e100)
        Traceback (most recent call last):
            ...
        OverflowError: n too large
        """

        import math
        if not n >= 0:
            raise ValueError("n must be >= 0")
        if math.floor(n) != n:
            raise ValueError("n must be exact integer")
        if n+1 == n:  # catch a value like 1e300
            raise OverflowError("n too large")
        result = 1
        factor = 2
        while factor <= n:
            result *= factor
            factor += 1
        return result


Linijki z docstringów rozpoczynające się od: ``>>>`` zostaną wykonane w
interpreterze Pythona a następnie wynik ich działania zostanie skonwertowany
na ciąg znaków i porównany z linikjami po ``>>>``.

Unittest
********

Unittest jest typowym narzędziem to tworzenia testów: tworzymy klasę testu,
klasa ta może zawierać metody specjalne: ``setUp``, ``tearDown``, ``setUpClass``
(i kilka innych) oraz wiele metod których nazwa zaczyna się od ``test``.

Metody których nazwa zaczyna się od ``test`` są testami. Każda z tych metod
jest wykonanana i jeśli nie rzuci wyjątku to uznaje się że test wykonał się
poprawnie. Wyjątek interpretowany jest jako błąd.

.. code-block:: python

    import random
    import unittest

    class TestSequenceFunctions(unittest.TestCase):

        def setUp(self):
            self.seq = list(range(10))

        def test_shuffle(self):
            # make sure the shuffled sequence does not lose any elements
            random.shuffle(self.seq)
            self.seq.sort()
            self.assertEqual(self.seq, list(range(10)))

            # should raise an exception for an immutable sequence
            self.assertRaises(TypeError, random.shuffle, (1,2,3))

        def test_choice(self):
            element = random.choice(self.seq)
            self.assertTrue(element in self.seq)

        def test_sample(self):
            with self.assertRaises(ValueError):
                random.sample(self.seq, 20)
            for element in random.sample(self.seq, 5):
                self.assertTrue(element in self.seq)

Uruchamianie testów
*******************

Zarówno dla doctesta i unittesta istnieją metodu uruchamiania poszczególnych
testów.

W projekcie powinien istnieć skrypt, który uruchamia wszystkie testy na raz
oraz (oprócz wyświetlania na wyników na standardowe wyjście) zwraca za pomocą
kodu wyjścia to czy testy się powiodły.

Narzędzie `nose <http://nose.readthedocs.org/>`__
pozwala na wyszukanie i uruchomienie wszystkich testow
w projekcie. Teoria jest taka że po instalacji starczy napisać ``nosetests .`` i
nose wyszuka i uruchomi wszystkie testy w projekcie. Praktyka jest taka
że potrzeba jeszcze trochę konfiguracji.

Serwer CI
---------

Serwer ciągłej integracji to system który:

* Pobiera nowe commity z repozytorium.
* Buduje projekt na wszystkich systemach docelowych (windows, linuks...)
* Uruchamia testy
* Wysyła e-mail jeśli testy nie przejdą.

Istnieją darmowe systemy CI dla projektów open-source. Przykładem takiego systemu
jest `travis CI <https://travis-ci.org>`__.

Wirtualne środowiska
--------------------

Tak jak pisałem wcześniej: każdy projekt powinien mieć swoje virtualne środowisko,
które jest przypięte do skompilowanego własnoręcznie interpretera (interpreter
systemowy może zostać zmieniony na nowszą wersję co zmieni ABI i
zepsuje środowisko).

Plik z zależnościami
--------------------

W projekcie powinien być plik o nazwie ``requirements.txt`` który zawiera
zależności projektu. Pliki requirements mają bardzo prostą składnię, mianowicie
w każdej linii zawierają nazwę jednej zależności.

Przykładowa zawartość

.. code-block:: bash

    numpy
    scipy
    matplotlib
    foo==1.0.1
    bar>=10

By zainstalować wszystkie biblioteki z pliku requirements starczy napisać:
``pip -r <nazwa pliku>``.

Zależnośći można albo podać bez wersji (wtedy pobrana zostanie najnowsza wersja),
albo ustalić jej wersję (można np. żądać wersji nowszej niż zadana). Pełna
składnia plików z zależnościami `jest dość rozbudowana <https://pip.pypa.io/en/latest/reference/pip_install.html#requirements-file-format>`__.

Są dwie szkoły:

* Podawać zalezności bez wersji, ew. określając wersję minimalną
  w formacie: ``numpy>1.8``. Tutaj problem może spowodować to, że autor
  wprowadzi zmiany łamiące kompatybilność wsteczną.
* Podawać zależności z dokładną wersją. Tutaj problemem może być to że spędzicie
  dwa dni szukając błędu naprawionego w zależności dwa lata temu.

Rozwiązanie:

* Zależnie od biblioteki rozsądnym kompromisem może być ``Django<1.8.0,>=1.7.0``,
  zakładam że developerzy django nie zmienią żadnych ważnych API przy zmianie
  między pomniejszymi wersjami.
* Do tego zawsze warto mieć w projekcie plik ``requirements_working.txt``
  zawierający zależności z podaną wersją z konfiguracji ktora **na pewno działa**,
  by taki plik wygenerować starczy komenta ``pip freeze > requirements_working.txt``.

Instalacja zależności z repozytorium
************************************

Nie każda przydatna wersja zależności jest w pypi, czasem projekt taki można
zainstalować bezpośrednio z repozytorium (o posiada poprawnie napisany plik
``setup.py``). W tym celu można zdefiniować zależność w postaci:

.. code-block:: bash

    ``typ_rep+url_do_repo@id_commitu#egg=nazwa_paczki``

Na przykład gdybym chciał zainstalować numpy z repozytorium napisałbym:

.. code-block:: bash

    git+https://github.com/numpy/numpy.git@master#egg=numpy



Plik ``setup.py``.
------------------

Układ projektu
**************

Typowy układ projektu wygląda tak:

.. code-block:: bash

    - my_project
      - my_package
        - subpackage
          __init__.py
          foo.py
        __init__.py
        bar.py
    - scripts
      run_tests.sh
      ...
    setup.py
    requirements.txt
    requirements_working.txt
    source.me


Wyjaśnienie poszczególnych plików:

* ``source.me`` plik dla którego wykonujecie ``source source.me``, który
  np. włącza środowisko wirtualne, włącza odpowiednią instalację Root-a
  (czy innego softu od którego zależy Wasz)
* ``setup.py`` jeśli Wasz projekt jest paczką wykorzystywaną w innych projektach
  dobrze jest móc zainstalować go. Do tego służy plik ``setup.py``.
* ``run_tests.sh`` skrypt który uruchamia wszystkie testy.


(Troszkę) zaawansowane użycia Git-a
-----------------------------------

Git flows
*********

Współpraca nad projektem zawsze wymaga jakiejś formy synchronizacji pracy, a
najczęściej również łączenia zmian wprowadzanych przez różne osoby.

W Gicie (i każdym innym VCS) jeden ciąg zmian nazywamy branchem (gałęzią),
a operację łączenia branchy mergeowaniem. Mergeowanie z reguły jest mało
przyjemną operacją, są jednak metody pozwalające na minimalizację problemów.

Jedną z nich są tzw. topic branche, przy pracy z topic branchami w repozytorium
mamy takie gałęzie:

* ``master`` Wersja produkcyjna
* ``develop`` Aktualna wersja deweloperska (to w Waszych projektach będzie
  ``develop`` zależy od Was).
* ``feature/*`` W branchu o nazwie ``feature/foo`` odbywa się cała praca
  nad funkcjonalnością ``foo``.
* ``bugfix/*`` w takich branchach naprawia się błędy.

Branche ``feature`` i ``bugfix`` to właśnie topic branche --- czyli gałęzie
tematyczne. Gdy programista pracuje nad daną funkcjonalnościa zmiany
trafiają właśnie do topic brancha.

Współpraca nad projektem z użyciem Pull-Requestów
*************************************************

Generalnie topic branche same w sobie raczej w Waszych projektach się nie
przydadzą, ale ich używanie ułatwia używanie Pull-Requestów. Pull request
to prośba do innego programisty by połączył dwa branche.

W pull-requeście widać:

* Zmiany w kodzie
* Komentarze wszystkich zainteresowanych





