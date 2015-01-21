Kolokwium 3
===========

:date: 2015-01-18
:tags: kolokwium
:category: zajęcia

Poprawy (dotyczy również osób które nie brały udziału w kolokwium!)
-------------------------------------------------------------------


Proponuję takie terminy poprawy:

* Czwartek 22.I godzina (zależnie od ilości chętnych) 11 albo 12.00. Godzina
  zostanie ogłoszona w środę.
* Wtorek  27.I (w godzinach konsultacji)

W podanych terminach można poprawiać również poprzednie kolokwia.

By wziąć udział w poprawie proszę o wypełnienie ankiety
`z terminami  popraw <http://doodle.com/939w29r9cx5du4at>`__.

Wyniki
------

Wyniki `kolokwium <{filename}/static/kolokwia/kol-3a-wyniki.csv>`__.

Rozwiązania modelowe i punktacja
--------------------------------

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

