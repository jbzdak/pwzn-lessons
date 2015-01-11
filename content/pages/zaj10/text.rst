Zarządzanie projektem
=====================

:date: 2015-01-05

TODO
----

* Git hooks
* Git flows


Wstęp
-----

Tematem zajęć jest zarządzanie projektem Pythona, z naciskiem na
zarządzanie projektem *małym* czyli takim nad którym pracuje kilka osób,
albo wręcz jest to projekt jednoosobowy.

Narzędzia
---------

Podstawowe narzędzia które ułatwiają pracę nad projektemt to:

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