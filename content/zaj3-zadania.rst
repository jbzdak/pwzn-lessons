Zajęcia 3 -- zadania
====================

:date: 2014-11-05
:tags: zajęcia, zaj3, zadania
:category: zajęcia
:status: draft

Zadania na zajęcia 2 dostępne są w następującym repozytorium github:
https://github.com/jbzdak/pwzn (inne niż ostatnim razem).

Uwaga, ze względu na to jak działa git do skomitowania potrzebne jest
podanie mu adresu e-mail oraz nazwy użytkownika. Nazwa użytkownika ustalana
jest albo per-repozytorium, albo per-konto użytkownika. Najęciach ponieważ 
używacie wspólnych kont należałoby używać konfiguracji per repzytorium.
By ją wykonać należy napisać:

.. code-block:: bash

     git config user.email "your_email@example.com"
     git config user.name "Billy Everyteen"

Taka konfiguracja będzie działała tylko dla aktualnego repozytorium.

Do zadań dołączono wygodny skrypt testujący, podane wywołanie testuje rozwiązanie
zadania numer 2.

.. code-block:: bash

    python3 run_tests.py --zaj 2 --no 2 --short

Parametry skryptu:

``--zaj``

    Numer zajęć

``--no``

    Numer zadania na zajęciach

``--short``

    Jeśli pojawi się ten parametr zostaną uruchomione któtsze testy

``--data-dir``

    Katalog z danymi do testów (są one pobierane oddzielnie). Domyslnie jest
    to ``/opt/pwzn`` i na nuclabach powinno działać od razu.

    Jeśli pobieracie dane to jeśli jako ten parametr daliście katalog ``/foo``
    to dane powinny trafić do ``/foo/zaj3``.




