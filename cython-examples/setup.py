from distutils.core import setup
from Cython.Build import cythonize


setup(
    name='cython-examples',
    ext_modules=cythonize("cython_examples/*pyx"),
    packages=['cython_examples'],
)
