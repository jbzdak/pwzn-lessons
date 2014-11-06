Rozwiązania modelowe zajęć 2
============================

:date: 2014-10-13 23:30
:tags: zaj2, rozwiązania modelowe
:category: ogłoszenia


Zadanie 1
---------

.. code-block:: python

    def xrange(start_stop, stop=None, step=None):

        # Jeśli jakieś parametry mają wartości domyślne ustalamy je

        start = 0
        step = step if step is not None else 1

        if stop is not None:
            start = start_stop
        else:
            stop = start_stop

        # Sam algorytm

        while start < stop:
            yield start
            start +=

Zadanie 2
---------

.. code-block:: python

    def filter_animals(animal_list):

        # To trochę oszustwo, bo darowałem sobie dużo ifów, użyciem
        # cefaultdict.

        # Domyślnie genus_map["cokolwiek"]["cokolwiek"] zwraca nam
        # najcięższe możliwe zwierze (sprawdziłem z jakiego zakresu jest to losowane)
        # Jeśli nie chcecie robić założenia o rozkładzie można było dać największego
        # istniejącego floata, w ten sposób wartośc domyślna będzie zawsze
        # w pierwszej iteracji zastąpiona!

        genus_map = defaultdict(lambda: defaultdict(lambda: {'mass': (10, "Mg")}))

        for animal in animal_list:
            # Pobieram ostnio zapisane zwierze
            old_one = genus_map[animal['genus']][animal['sex']]
            # Wybieram to o mniejszej masie
            new_one = min(old_one, animal, key=mass_generator)
            # Umieszcam lżejsze zwierze w słowniku
            genus_map[animal['genus']][animal['sex']] = new_one

        list = []

        for pair in genus_map.values():
            for animal in pair.values():
                list.append(animal)

        # Sortowanie w Pytonie jest stabilne, to znaczy: nie zmienia względnej
        # kolejności elementów równych sobie.

        list = sorted(list, key=itemgetter('name'))
        list = sorted(list, key=itemgetter('genus'))

        return list


Zadanie 2
---------

.. code-block:: python

    import math

    # Rozwiązanie z zajęc 1
    def arange(x0, xN, n):
        step = (xN-x0)/(n-1)
        result = []
        for ii in range(n-1):
            result.append(x0+ii*step)
        result.append(xN)
        return result


    class Integrator(object):

        """
        Klasa która implementuje całki metodą Newtona Cotesa z użyciem interpolacji
        N-tego stopnia :math:`n\in<2, 11>`.

        .. note::

            Używamy wzorów NC nie dlatego że są super przydatne (zresztą gorąco
            zniechęcam Państwa przed pisaniem własnych podstawowych algorytmów
            numerycznych --- zbyt łatwo o głupi błąd) ale dlatego żebyście
            jescze raz napisali jakiś algorytm w którym nie opłaca się zrobić 11
            ifów.

        """

        PARAMS = {
            2: [1, 1],
            3: [1, 3, 1],
            4: [1, 3, 3, 1],
            5: [7, 32, 12, 32, 7],
            6: [19, 75, 50, 50, 75, 19],
            7: [41, 216, 27, 272, 27, 216, 41],
            8: [751, 3577, 1323, 2989, 2989, 1323, 3577, 751],
            9: [989, 5888, -928, 10496, -4540, 10496, -928, 5888, 989],
            10: [None] * 10,
            11: [None] * 11
        }

        PARAMS[10][0] = PARAMS[10][-1] = 2857
        PARAMS[10][1] = PARAMS[10][-2] = 15741
        PARAMS[10][2] = PARAMS[10][-3] = 1080
        PARAMS[10][3] = PARAMS[10][-4] = 19344
        PARAMS[10][4] = PARAMS[10][-5] = 5778

        PARAMS[11][0] = PARAMS[11][-1] = 16067
        PARAMS[11][1] = PARAMS[11][-2] = 106300
        PARAMS[11][2] = PARAMS[11][-3] = -48525
        PARAMS[11][3] = PARAMS[11][-4] = 272400
        PARAMS[11][4] = PARAMS[11][-5] = -260550
        PARAMS[11][5] = 427368

        def __init__(self, level):
            """
            Funkcja ta inicjalizuje obiekt do działania dla danego stopnia metody NC
            Jeśli obiekt zostanie skonstruowany z parametrem 2 używa metody trapezów.
            :param level: Stopień metody NC
            """
            self.level = level

        def integrate(self, func, func_range, num_evaluations):

            parts = math.ceil(num_evaluations/self.level)

            x0, xN = func_range

            result = 0

            params = self.PARAMS[self.level]

            # Funkcja: zip(arange(x0, xN, parts+1), arange(x0, xN, parts+1)[1:])
            # zwraca nam krotkę zawierającą lewy i prawy przedział całkowania.
            for a, b in zip(arange(x0, xN, parts+1), arange(x0, xN, parts+1)[1:]):
                pts = arange(a, b, self.level) # Punkty pośrednie do całkowania
                step_result = 0  # Całkowanie
                for par, pt in zip(params, pts):
                    step_result += par * func(pt)
                result += step_result / sum(params) * (b - a)

            return result

