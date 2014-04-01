====================================
API Changes in third party libraries
====================================

QHull
=====

After 2011 release, header files are stored in libqhull and libqhullcpp instead of qhull

From `QHull changelog <http://www.qhull.org/src/Changes.txt>`_ :

  Qhull 2011.1  2011/05/14 6.2.0.1383 (exe/dll files unchanged)
     [...]
     Installs headers to include/libqhull, include/libqhullcpp, include/road

Code sources must handle both cases, for exemple with following preprocessor directive :

.. code-block:: cpp

   #ifndef WITHOUT_QHULL
   extern "C" {
   #ifndef WITH_QHULL_BEFORE2011
   #include <qhull/qhull_a.h>
   #else
   #include <libqhull/qhull_a.h>
   #endif
   }
   #endif
   
Then just :doc:`define preprocessor variable <../tips/builderargs>` WITH_QHULL_BEFORE2011
 

Bison3
======

See `Bison 3 changelog <https://lwn.net/Articles/561990/>`_

