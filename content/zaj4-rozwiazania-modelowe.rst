Rozwiązania modelowe zajęć 3
============================

:date: 2014-10-27 19:00
:tags: zaj3, rozwiązania modelowe
:category: ogłoszenia
:status: draft


Zadanie 1
---------

.. code-block:: python

    # -*- coding: utf-8 -*-

    import numpy as np


    def linear_func(x, a, b):
        return a*x+b


    def chisquared(xy, a, b):

        x = xy[:, 0]
        y = xy[:, 1]
        sigma_y = xy[:, 2]

        return np.sum(np.power((y - a * x - b) / sigma_y, 2))


    def least_sq(xy):

        x = xy[:, 0]
        y = xy[:, 1]

        delta = len(xy) * np.sum(x ** 2) - np.sum(x) ** 2
        a = (np.sum(x ** 2) * np.sum(y) - np.sum(x) * np.sum(x * y)) / delta
        b = (len(xy) * np.sum(x * y) - np.sum(x)*np.sum(y))/delta
        return a, b

Zadanie 2
---------

Znów dwa rozwiązania:

.. code-block:: python

    def __create_slices():
        """
        To mi nie do końca wyszło. W każdym razie generuje to listę slice s które
        pozwalają tak zaindeksować tablicę i sąsiadów by po przesumowaniu
        wyszło dobrze
        """
        class SliceMaker(object):
            def __getitem__(self, item):
                return item

        sm = SliceMaker()

        # not diagonal

        yield from zip(
            chain(permutations([sm[:], sm[:-1]], 2), permutations([sm[:], sm[1:]], 2)),
            chain(permutations([sm[:], sm[1:]], 2), permutations([sm[:], sm[:-1]], 2))
        )

        # diagonal

        yield from zip(
            product([sm[:-1], sm[1:]], repeat=2),
            product([sm[1:], sm[:-1]], repeat=2)
        )

    # To jest lista slices które pozwalają mi wybrać odpowiedne fragmenty tablicy
    SLICES = list(__create_slices())


    def calculate_neighbours(board):


        neighbours = np.zeros(board.shape, dtype=np.int8)

        for n_slice, b_slice in SLICES:
            neighbours[n_slice] += board[b_slice]

        return neighbours


    def iterate(board):

        board = np.asanyarray(board, dtype=bool)

        n = calculate_neighbours(board)

        create = n == 3
        survives = (n == 2) & board

        return create | survives

Rozwiązanie studenta:

.. code-block:: python


    def calculate_neighbours(board):
        m, n = board.shape

        # "Oklejamy" planszę zerami (w ten sposób trochchę łatwiej jest
        # to indeksować). Wada jest taka że marnuje się trochę pamięci
        board2 = np.zeros((m+2, n+2), dtype=int)
        board2[1:m+1, 1:n+1] = board.astype(int)

        wynik = np.zeros(board.shape, dtype=np.int)
        ones = np.ones(board.shape) # Na moje oko (JB) to jest niepotrzebne, ale niech już będzie.
        for i, j in [ (1,0), (-1,0), (0,1), (0,-1), (1,1), (1,-1), (-1,1), (-1,-1) ]:
            wynik += (ones * board2[1+i:m+1+i, 1+j:n+1+j]).astype(int)
        return wynik

    def iterate(board):

        from numpy import logical_and as land, logical_or as lor, logical_not as lnot

        board = board.astype(np.bool)
        neigh = calculate_neighbours(board)
        ozywa = land(board == False, neigh == 3)
        umiera = lnot(land( board == True, lor( neigh < 2, neigh > 3) )
        board2 = land(lor(board, ozywa), umiera)
        return board2


Zadanie 3
---------

.. code-block:: python

    class Integrator(object):

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
            """

            :param callable func: Funkcja którą całkujemy
            :param tuple[int] func_range: Krotka zawierająca lewą i prawą granicę całkowania
            :param in tnum_evaluations:
            :return:
            """


            # Ilość odcinków na których robimy cąłkowanie poziomu level
            parts = math.ceil(num_evaluations/self.level)

            # Num evaluations zaokrąglone do góry
            new_evaluations = int(parts * (self.level-1))

            start, stop = func_range

            # Siatka punktów do wykonania
            grid = np.linspace(start, stop, new_evaluations, endpoint=False)

            # Niestety siatkę pubktów musimy przerobić, ponieważ kolejne
            # kroki całkowania zazębiają się.
            # Potrzebujemy siatki która wygląda tak:
            # 1 2 3 -> Każdy z wierszy stanowi jeden krok całkowania trzeciego poziomu
            # 3 4 5
            # 4 6 7
            # Zauważcie że ostatni punkt poprzedniego i pierwszy punkt następnego poziomu
            # się zazębiają.
            # Tutaj przekształcam siatkę tak by spełniała moje wymagania.
            value_grid = np.zeros((parts, self.level))

            value_grid[:, :-1] = grid.reshape((parts, self.level-1))
            value_grid[:-1, -1] = value_grid[1:, 0]
            value_grid.flat[-1] = stop

            # Wykonuje funkcję 
            value_grid = func(value_grid)

            coefficients = np.asanyarray(self.PARAMS[self.level], dtype=float)

            # całkowanie:
            res = np.sum(value_grid * coefficients[np.newaxis, :])

            return res / np.sum(coefficients) * (stop - start) / parts


