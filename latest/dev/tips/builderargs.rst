========================
Pass options to builders
========================



SconsX
======

Write an :file:`options.py` file containing all extra parameters. 

For example :

.. code-block:: python

   num_jobs=8

   QTDIR='/usr/local'
   WITH_CGAL=True

   EXTRA_CCFLAGS='-DCGAL_CFG_NO_CPP0X_VARIADIC_TEMPLATES'
   EXTRA_LINK_FLAGS='-F/usr/local/lib'

   gl_includes='/usr/X11/include'



.. seealso:: 

  - `SconsX documentation <http://openalea.gforge.inria.fr/doc/openalea/sconsx/doc/_build/html/contents.html>`_
  - `Available parameters <http://openalea.gforge.inria.fr/doc/openalea/sconsx/doc/_build/html/user/Technical.html#configure>`_

  
Homebrew
========

To display current values, just launch


.. code-block:: sh

   brew --env

To modify environnement in a formula :

.. code-block:: ruby

   class MyFormula < Formula
      # instructions
     def install
       ENV['CFLAGS'] = '-I/usr/include'

