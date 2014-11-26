Rozwiązania modelowe zajęć 3
============================

:date: 2014-10-26 19:00
:tags: zaj3, rozwiązania modelowe
:category: ogłoszenia


Zadanie 1
---------

.. code-block:: python

    def load_data(path):
        keys = []
        frequencies = []

        with open(path, encoding='utf-8') as f:
            wr = csv.reader(f, dialect=csv.unix_dialect)
            for row in wr:
                keys.append(row[0])
                frequencies.append(int(row[1]))

        return keys, frequencies


    def suggester(input, data):
        left = bisect.bisect_left(data[0], input)
        right = bisect.bisect_right(data[0], input[:-1] + chr(ord(input[-1])+1))
        slice = collections.defaultdict(lambda: 0)
        total = 0
        for ii in range(left, right):
            word = data[0][ii]
            count = data[1][ii]
            slice[word[len(input)]] += count
            total += count
        return [(i[0], i[1] / total) for i in sorted(slice.items(), key=lambda x: (x[1], x[0]), reverse=True)]

Zadanie 2
---------

Tutaj przedstawiam kilka rozwiązań

.. code-block:: python

    # -*- coding: utf-8 -*-
    from collections import defaultdict
    import csv
    import bisect

    from solutions.zaj3.zadanie1 import load_data


    def find_le(a, x):
        'Find rightmost value less than or equal to x'
        i = bisect.bisect_right(a, x)
        if not i:
            raise ValueError
        if a[i] == x:
            return i
        else:
            return None


    def merge_naive(path1, path2, out_file):

        """

            Naiwne rozwiązanie

        """

        result = defaultdict(lambda: 0)

        d = load_data(path1)

        for ngram, freq in zip(d[0], d[1]):
            result[ngram] += freq

        d = load_data(path2)

        for ngram, freq in zip(d[0], d[1]):
            result[ngram] += freq

        with open(out_file, 'w', encoding='utf-8') as f:
            wr = csv.writer(f, dialect=csv.unix_dialect)
            for word, count in sorted(result.items(), key=lambda x: x[0]):
                wr.writerow([word, count])


    def merge(path1, path2, out_file):

        """
        Moja implementacja łączenia. Jest średnio elegancja jeśli chodzi o kod,
        ale dość wydajna. Ta funkcja otwiera pliki i odpala merge_internal.

        """
        with open(path1) as f1, open(path2) as f2, open(out_file, 'w') as o:
            i1 = csv.reader(f1, dialect=csv.unix_dialect)
            i2 = csv.reader(f2, dialect=csv.unix_dialect)
            out = csv.writer(o, dialect=csv.unix_dialect)

            for r in merge_internal(i1, i2):
                out.writerow(r)

    def merge_internal(i1, i2):
        """

        Moja implementacja łączenia. Jest średnio elegancja jeśli chodzi o kod,
        ale dość wydajna.

        r1 i r2 to właśnie łączone n-gramy.

        Algorytm jest taki:

        * Jeśli aktualnie pobrane obu plików ngramy są sobie równe to zwracamy sumę
          częstotliwości i pobieramy dwa kolejne elementy.
        * Jeśli nie są równe to zwracamy mniejszy i pobieramy nowy element
          na jego miejsce. Możemy zwrócić mniejszy element ponieważ wiemy że
          w drugim pliku nie ma już takiego samego n-gramu.

        """

        r1, r2 = None, None # "Aktualne" elementy

        while True:
            if r1 is None: # Jeśli r1 nie jest Nonem to pobieramy następny ngram
                try:
                    r1 = next(i1)
                except StopIteration:
                    if r2 is not None: # r1 się skońvzyło wyrzucamy r2 i resztę elementów z i2
                        yield r2
                    for r in i2:
                        yield r
                    return
            if r2 is None:  # Jeśli r2 nie jest Nonem to pobieramy następny ngram
                try:
                    r2 = next(i2)
                except StopIteration:
                    if r1 is not None: # r2 się skońvzyło wyrzucamy r1 i resztę elementów z i1
                        yield r1
                    for r in i1:
                        yield r
                    return

            # Teraz mamy załadowane zarówno r1 jak i r2

            if r1[0] > r2[0]: # Inwariant jest taki że w r1 zawsze jest mniejszy ngram od r2
                r1, r2 = r2, r1 # Tutaj zamieniamy miejscami zarówno r jak i i
                i1, i2 = i2, i1

            if r1[0] == r2[0]: # Ngramy są sobie równe zwracamy sumę i ustawiamy oba na None (żeby oba się pobrały)
                yield [r1[0], int(r1[1]) + int(r2[1])]
                r1, r2 = None, None
            else: # Jeśli nie są równe zwracamy mniejszy i ustawiamy go na None.
                yield [r1[0], r1[1]]
                r1 = None


    import csv
    from heapq import merge as hmerge


    def merge_kowal(path1, path2, out_file):
        """
        Rozwiązanie jednego ze studentów. Wykorzystuje on (działającą na iteratorach)
        funkcję h-merge która dokonuje merge sort.

        Następnie jeśli w strumieniu zwróconym przez hmerge znajdzie się jeden po drugim
        te same elementy to dodaje do siebie ich częstotliwości
        """

        with open(path1, 'r', encoding='utf-8') as file1, open(path2, 'r', encoding='utf-8') as file2, open(out_file, 'w', encoding='utf-8') as output:
            reader1 = csv.reader(file1, dialect=csv.unix_dialect)
            reader2 = csv.reader(file2, dialect=csv.unix_dialect)
            reader_out = csv.writer(output, dialect=csv.unix_dialect)

            it = iter(hmerge(reader1, reader2))
            current = next(it)

            while True:
                try:
                    nxt = next(it)
                    if current[0] == nxt[0]:
                        current[1] = int(current[1]) + int(nxt[1])
                        nxt = current
                    else:
                        reader_out.writerow(current)
                        current = nxt
                except StopIteration:
                    reader_out.writerow(nxt)
                    break


    if __name__ == '__main__':

        merge(
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_0.xmlascii.csv',
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_1.xmlascii.csv',
            '/tmp/mergeout.csv')



    if __name__ == '__main__':
        merge_naive(
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_0.xmlascii.csv',
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_1.xmlascii.csv',
            '/tmp/mergenaive.csv')
        merge(
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_0.xmlascii.csv',
            '/opt/pwzn/zaj3/enwiki-20140903-pages-articles_part_1.xmlascii.csv',
            '/tmp/mergeout.csv')


Zadanie 3
---------

.. code-block:: python


    def generate_ngrams(contents, ngram_len=7, break_at=None):
        n_gram = defaultdict(lambda: 0)

        idx = 0

        for title, contents in contents:

            idx += 1

            for ii in range(len(contents) - ngram_len+1):
                n_gram[contents[ii:ii + ngram_len]] += 1

            if break_at is not None and idx == break_at:
                break

        return n_gram

