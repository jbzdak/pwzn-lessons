Kolokwium 3 (update 2)
======================

:date: 2015-01-26
:modified: 2015-01-26
:tags: kolokwium
:category: zajęcia

Update
------

* Naniosłem wyniki drugiej grupy.
* Dodałem terminy poprawy

Poprawy (dotyczy również osób które nie brały udziału w kolokwium!)
-------------------------------------------------------------------

Na razie proponuję takie terminy poprawy:

* Wtorek  27.I (w godzinach konsultacji).
  Dostępne są dwa terminy: http://doodle.com/2fx3wbcdh4cp8zyk
  (osoby zgłoszone poprzednią ankietą nie muszą się zgłaszać)
* Czwartek (29.I )

  * Grupa I 13-14.00
  * Grupa II 14 - 15.00

* Termin w sesji (poza godzinami egzaminów)

W podanych terminach można poprawiać również poprzednie kolokwia.

Wyniki
------

Wyniki (grupa 11-14, nie uwzględnia popraw) `kolokwium <{filename}/static/kolokwia/kol-3a-wyniki.csv>`__.
Wyniki (grupa 14-17) `kolokwium <{filename}/static/kolokwia/kol-3b.csv>`__.

Rozwiązania modelowe i punktacja (kol 3a)
-----------------------------------------

Tresc `kolokwium <{filename}/static/kolokwia/kol-3a.pdf>`__.

Zadanie 1
*********

W pythonie 2.7 (przynajmniej jeśli 1E8 zamienimy na 1E11+) prawidłowa jest odpowiedź 1.

W pythonie 3.X prawadziwe jest 3 i 4.
Odpowiedź 2 jest niepoprawna ponieważ wywołanie to zwróci obiekt typu ``range`` a nie listę.

Za prawidłową odpowiedź (zaznacznie **tylko** 3 i 4) był jeden punkt.
Za jeden błąd było 0.5 pkt.

Zadanie 2
*********

**Zadanie 2a**

Rozwiązanie kanoniczne:

.. code-block:: python

    import csv

    result = []
    with file(open('name.csv'), 'r'):
       r = csv.reader(
          dialect=csv.unix_dialect)
       for row in r:
          result.append(list(r))

Alternatywnie:

.. code-block:: python

    import pandas as pd
    result = pd.read_csv(
       'name.csv', sep=',')

**Zadanie 2b**


Rozwiązanie kanoniczne:

.. code-block:: python

    import csv

    class PipeDialect(csv.unix_dialect):
        delimiter = '|'

    result = []
    with file(open('name.csv'), 'r'):
       r = csv.reader(
          dialect=PipeDialect)
       for row in r:
          result.append(list(r))

**Punktacja**

Jeden punkt przyznawany z **poprawnie** rozwiązane zadanie, błąd skutkował
przyznaniem 0 punktów, czasem bardzo drobne błędy skutkowały przyznaniem 0.5 pkt.

**Częste błędy**

Częstym błędem było zrobienie czegoś w stylu:

.. code-block:: python

    import csv

    class PipeDialect(csv.unix_dialect):
        delimiter = '|'

    result = []
    with file(open('name.csv'), 'r'):
       r = csv.reader(
          dialect=PipeDialect)
       for ii, row in enumerate(r):
          for jj, cell in enumerate(row):
             result[ii][jj] = cell

Program ten jest niepoprawny ponieważ odniesienie się do nieistniejącego
indeksu w liście zawsze skutkuje wyjątkiem.

Zadanie 3
*********

**Rozwiązanie za 1pkt**

.. code-block:: python

    norm = np.sum(data, axis=1)
    data_normed = data / norm[:, np.newaxis]

**Rozwiązanie za 0.5pkt**

.. code-block:: python

    data_normed = np.copy(data)
    for ii in range(len(data_normed)):
        data_normed[ii, :] = data[ii, :]/np.sum(data[ii, :])

**Rozwiązanie za 0.25pkt**

.. code-block:: python

    data_normed = np.copy(data)
    for ii in range(data_normed.shape[0]):
        for jj n range(data_normed.shape[1]):
         data_normed[ii, jj] = data[ii, jj]/np.sum(data[ii, :])

To rozwiązanie jest szczególnie niewydajne ponieważ:

1. Wykonuje instrukcję bytekodu pythona dla każdej komórki tablicy
2. Wielkokrotnie liczy sumę elementów każdego wiersza.

**Punktacja**

Kod który nie działa skutkuje przyznaniem 0pkt. Za wykonanie (poprawne!)
operacji na ``data`` a nie na kopii nie obcinałem punktów.

**Częsty błąd**

Częstym błędem było pisanie czegoś w stylu:

.. code-block:: python

    for row in data:
        row = row/np.sum(row)

Jest to błąd ponieważ przypisanie ``row =`` nie modyfikuje data. By zmodyfikować
data należaloby napisać:

.. code-block:: python

    for row in data:
        row[:] = row/np.sum(row)

Zadanie 4
*********

**Rozwiązanie za 1pkt**

.. code-block:: python

    data[stddev > 2*data] = np.nan

**Rozwiązanie za 0.5pkt**

.. code-block:: python

    data_fixed = np.copy(data)

    for ii in range(len(data_fixed))
        if 2*data[ii] < std[ii]:
            data[ii] = np.nan


**Punktacja**

Kod który nie działa skutkuje przyznaniem 0pkt. Czasem za drobny błąd przyznawąłem
0.5pkt.

Zadanie 5
*********

**Rozwiązanie modelowe**

Liczyłem że ktoś będzie pamiętał o indeksach w pandas.

.. code-block:: python

    def convert_to_pandas(dataset):
        data = [[k, v] for k, v in dataset.items()]
        frame = pd.DataFrame(data, columns=['kod', 'count'])
        frame.set_index('kod', inplace=True)
        return frame

    frame = convert_to_pandas(get_data(1))

    for ii in range(2, 101):
        frame = frame.add(convert_to_pandas(get_data(ii)), fill_value=0)

**Inne rozwiązania**

Inne rozwiązania wykorzystywały ``collections.Counter`` albo zwykły słownik.


**Punktacja**

Kod który nie działa skutkuje przyznaniem 0pkt. Czasem za drobny błąd przyznawąłem
0.5pkt.

Rozwiązania modelowe i punktacja (kol 3b)
-----------------------------------------

Tresc `kolokwium <{filename}/static/kolokwia/kol-3b.pdf>`__.

Zadanie 1
*********

Tylko jedno wywołanie było niepoprawne:

.. code-block:: python

    my_wrapper(foo, bar, baz)

To wywołanie jest poprawne:

.. code-block:: python

    my_wrapper(baz, foo=foo, bar=bar)

Argument baz jest przekazany pozycyjnie (co dopuszcza sygnatura my_wrapper)
pozostałe jako keyword arguments.


Zadanie 2
*********

Rozwiązanie modelowe:

.. code-block:: python

    import csv
    with open('in.csv', 'r') as in,
           open('out.csv', 'w' as out:
      read = csv.reader(in)
      write = csv.writer(out, delimiter="?")
      for line in read:
        write.writeline(line)

Bardzo często Państwo kopiowaliście argumenty do listy, a listę do
drugiego pliku, nie obcinałem za to punktów.

Można było również skorzystać z Panadas, co jednak wymagało doczytania
parametru, który wyłączał zapisywanie indeksu.

Zadanie 3
*********

Program B zużywa **więcej pamięci** ponieważ powstaje w nim
macierz:

.. code-block:: python

    data!=np.nan

Jest to normalna macierz logiczna. Myślę że dodatkowa pamięć konieczna
do obliczeń nie będzie dla Was problemem, jak poszukacie to są narzędzia
które kompilują tego typu wyrażenia do jednej pętli C.

Zadanie 4
*********

Tutaj rozwiązanie jest proste. Należało tylko nie zapomnieć
o wykorzystaniu funkcji ``np.*``.


