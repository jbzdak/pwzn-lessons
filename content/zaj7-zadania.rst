Zajęcia 7 -- zadania
====================

:date: 2014-12-11 09:00
:tags: zajęcia, zaj7, zadania
:category: zajęcia

Zadania
-------

Zadania proszę rozwiązać i zapisać w swoich repozytoriach githuba.

Zadanie 1
---------

Pobrać plik znajdujący się w `http://db.fizyka.pw.edu.pl/pwzn-data/zaj7/rand-data-b`
(testować można na pliku: `http://db.fizyka.pw.edu.pl/pwzn-data/zaj7/rand-data-a` który
jest mniejszy).

W zadaniu tym należy zasymulować działanie programu do przyśpieszania pobierania ---
i proszę pobierać równolegle plik w N (konfigurowalne z zakresu 0 do 11) kawałkach.


Znane problemy
**************

1. Nagłówek ``Range`` określa początkowy i koniec pobieranego zakresu, i oba są
   pobierane inkluzywnie tj: ``Range: 0-10``, zwróci 11 bajtów.
2. ``requests.get`` zwraca obiekt typu response, który zawiera dwa argumenty:
   ``text`` i ``content``. Atrybut ``content`` zawiera bajty odpowiedzi ``text``
   zawiera bajy skonwertowane na odpowiednie kodowanie.
3. Map (tak jak jest zaimplementowane w pulach procesów) pozwala na wywołanie
   funkcji jednoargmentowych, tj. jest odpowiednikiem takiego kodu:

   .. code-block:: python

      res = []
      for r in input:
         res.append(f(r))

   Jeśli chcecie przekazać więcej argumentów do funkcji należy zapakować je
   w krotkę a potem odpakować.

Zadanie 2
---------

Zadanie polega na napisaniu crawlera stron WWW działającego równolegle w N procesach,
crawler musi mieć takie funkcjonalności:

* Loguje się do strony ``/login`` za pomocą nazwy użytkownika ``foo`` oraz hasła ``bar``.
* Pierwszą stroną do pobrania jest strona o adresie ``//numeryindeksówzespolu``.
* Program pobiera stronę i znajduje w niej wszystkie linki. Program pobiera wszystkie strony
  dodaje do listy stron do pobrania wszystkie strony na które wskazują te linki.

  * Program przestaje nie pobiera stron które są w odległości większej niż 5 linków
    od strony z której rozpoczęto pobieranie.

* Program wyświetla wszystkie odwiedzone linki. Linki te są posortowane w taki sposób
  że linki ze stron "bliższych" do strony z której rozpoczęto poszukowanie są wcześniej
  od stron "dalszych" (jeśli współczynnik "bliskości" jest taki sam linki są posortowane
  alfabetycznie).


Serwer do uruchomienia jest pobrany do pobrania z serwisu ``github <https://github.com/jbzdak/laughing-cyril>``__,
należy uruchomić plik ``server.py``. Do uruchomienia potrzebna jest paczka ``tornado`` (``pip install tornado``).
Następnie możeie pracować na stronie ``localhost``.

Znane problemy
**************

1. Generalnie po wykonaniu prawidłowej akcji logowania zostaniecie przekierowani
   na inną stronę, jeśli użyjecie `sesjii <http://docs.python-requests.org/en/latest/user/advanced/>`__
   requests to sesja ta zapamięta ciastka. W innym przypadku należy wyłączyć redirecty:

   .. code-block:: python

      result = requests.post(..., allow_redirects=False)
      print(response.cookies)
      requests.get(... cookies=response.cookies)

2. By pobrać adres odnośnika można użyć:  `obiekt_odnośnika["href"]`.

3. Równoległe pobieranie stron najłatwiej oprogramować za pomocą dwóch kolejek,
   obie będą przechowywały pobrane adresy linków oraz to jak dany adres odległy
   jest od strony z której zaczynaliście. W kolejce `queue_a` są linki do przetworzenia
   w `queue_b` linki odnalezione w stronach z ``queue_a``.

   .. code-block:: python

        def process(queue_a, queue_b):

            while True:
                page_to_be_searched = queue_a.get()

                for link in get_links(...):
                    queue_b.put([link, link_depth])

   Jest jeden proces kontrolny który ma za zadanie:

   1. Zbierać wszystkie linki
   2. Jeśli jakiś link należy przeszukać załadować go do ``queue_a``.






Uwaga
-----

Zasadniczo dość rzadko najlepszym rozwiązaniem problemu przyśpieszania pobierania danych po
HTTP jest pobieranie ich w wielu procesach (lub wątkach). Większe przyśpieszenia uzyskuje się
pisząc kod asynchroniczny (taki który zamiast oczekiwać na zakończenie operacji wejścia-wyjścia
wykonuje podczas takiej operacji inne zadania).