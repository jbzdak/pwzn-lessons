Zajęcia 8 -- zadania
====================

:date: 2014-12-17 18:00
:tags: zajęcia, zaj8, zadania
:category: zajęcia

Zadania
-------

Zadania proszę rozwiązać i zapisać w swoich repozytoriach githuba.

Zadanie 1
---------

Przyśpieszyć następnującą (albo dowolną inną) implementacją algorytmu quicksort za pomocą Cythona.

Proszę zbadać wydajność obu wersji algorytmu.

.. code-block:: python

    # Written by Magnus Lie Hetland

    "Everybody's favourite sorting algorithm... :)"

    def partition(list, start, end):
        pivot = list[end]                          # Partition around the last value
        bottom = start-1                           # Start outside the area to be partitioned
        top = end                                  # Ditto

        done = 0
        while not done:                            # Until all elements are partitioned...

            while not done:                        # Until we find an out of place element...
                bottom = bottom+1                  # ... move the bottom up.

                if bottom == top:                  # If we hit the top...
                    done = 1                       # ... we are done.
                    break

                if list[bottom] > pivot:           # Is the bottom out of place?
                    list[top] = list[bottom]       # Then put it at the top...
                    break                          # ... and start searching from the top.

            while not done:                        # Until we find an out of place element...
                top = top-1                        # ... move the top down.

                if top == bottom:                  # If we hit the bottom...
                    done = 1                       # ... we are done.
                    break

                if list[top] < pivot:              # Is the top out of place?
                    list[bottom] = list[top]       # Then put it at the bottom...
                    break                          # ...and start searching from the bottom.

        list[top] = pivot                          # Put the pivot in its place.
        return top                                 # Return the split point


    def quicksort(list, start, end):
        if start < end:                            # If there are two or more elements...
            split = partition(list, start, end)    # ... partition the sublist...
            quicksort(list, start, split-1)        # ... and sort both halves.
            quicksort(list, split+1, end)
        else:
            return

Zadanie 2
---------

**UWAGA**: Zadanie to jest opcjonalne i warte +1 do oceny za projekt (również dla osób które
projektu nie robią).

Zadanie polega na oprogramowaniu funkcjonalności ``inotify`` z poziomu Pythona.
``inotify`` jest API jądra linuksa które pozwala uzyskiwanie powiadomień
o zmianach w plikach i katalogach.

API wspiera `takie funkcje <http://man7.org/linux/man-pages/man7/inotify.7.html>`__:

* ``inotify_init`` --- zwraca inta reprezentującego deksryptor pliku z którego
  będzie można odczytywać powiadomienia
* ``inotify_add_watch`` --- zaznacza że interesują nas informacje o danym zasobie
  (będziemy obserwować ten zasób dyskowy)
* ``read`` (funkcja odczytująca plik) --- czeka aż pojawi się pierwsza notyfikacja
* ``cose`` --- zamyka deskryptor uzyskany za pomocą ``inotify_init``

Sugerowane podejście do tego problemu to opakować całe Api za pomocą ``ctypes``/``cffi``.

Wymagane funkcjonalności:

* Chciałbym móc z poziomu Pythona obserwować jakiś katalog pod kątem zmian.