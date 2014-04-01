========================
Cpp compiler differences
========================

gcc/clang
=========

main signature
--------------

Valid in gcc, not in clang because return value is required for main function.

.. code-block:: cpp

   main(){
   }

Replace it with 

.. code-block:: cpp

   int main(){
   }


libstdc++/libc++
================

libc++ is not binary compatible with gcc's libstdc++ (except for some low level stuff such as operator new). 
For example the std::string in gcc's libstdc++ is refcounted, whereas in libc++ it uses the "short string optimization". 
If you were to accidentally mix these two strings in the same program (and mistake them for the same data structure), you would inevitably get a run time crash.
In order to turn this run time crash into a link time error, libc++ uses a C++11 language feature called inline namespace to change the ABI of 
``std::string`` without impacting the API of ``std::string``. That is, to you ``std::string`` looks the same. But to the linker, ``std::string`` is being mangled as if it is in namespace ``std::__1``. 
Thus the linker knows that ``std::basic_string`` and ``std::__1::basic_string`` are two different data structures (the former coming from gcc's libstdc++ and the latter coming from libc++).


ext/slist class
---------------

Works with gcc/stdlib

.. code-block:: cpp

   #include <ext/slist>
   std::slist ...
   
   }

<ext/slist> has been removed in libc++ and can be replaced by forward_list but **forward_list has neither size nor count methods!**

.. code-block:: cpp

   #include <forward_list>


boost/python - standard lib
---------------------------

With clang/libc++, order of headers inclusions matters if you want to use both std lib and boost :

.. code-block:: cpp

   #define _LIBCPP_EXTERN_TEMPLATE(...)=
   
   
   #include <string>
   #include <boost/python.hpp>
   
   // generates 20 errors but ...
   
   #include <boost/python.hpp>
   #include <string>
   
   // works perfectly

Bug is not solved currently.
See `<http://bugs.python.org/issue10910>`_ and `<error_boost_python.log>`_





