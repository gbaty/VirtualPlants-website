======================
Development guidelines
======================

Python guidelines are documented on python website under the name `PEP8 <https://www.python.org/dev/peps/pep-0008>`_.
For Python, we use all PEP8 conventions excepted that we allow 120 characters per line instead of 80.


Tools
=====

Many editor or IDE (Integrated Development Environments) integrate tools to check or fix coding guidelines.
For example:

  - Eclipse with pydev extension
  - pyCharm
  - Spyder
  - Vim (with plugin)
  - Emacs (with plugin)

If your editor do not support natively PEP8, you can search if a plugin exists or use these two external tools:
  
  - `flake8 <https://pypi.python.org/pypi/flake8>`_ : check coding guidelines
  - `autopep8 <https://pypi.python.org/pypi/flake8>`_ : fix automatically guidelines

These tools may be available in your system package manager (apt-get, urpmi, ports, ...) or can be install using 
`pip <https://pip.pypa.io/en/latest/>`_ or easy_install.

To run autopep8:

.. code-block:: bash

    autopep8 -i -a --max-line-length=119 --ignore E26,E265 filename.py

Indentation
===========

Don't mix tab and spaces. For new project, use only spaces.

Documentation
=============

Add a Doctring for all classes and functions.

.. todo ::

    move dokuwiki [[documentation:doctests:how_to_document_python_api|How to document python API]] here

Naming
======


**Modules or packages**

Module names are the same as the file name. Modules should have short, lowercase names, without underscore. Singular is better than plural.

.. code-block:: python

    # Yes:
    import tree

    # No:
    import Tree


For C/C++/Fortran extension modules embedded in a Python package that provide a more Pythonic interface, the C/C++/Fortran module has a leading underscore (e.g. _amlpymodule).

**Class Names**

Class names use the CapsWords convention.

.. code-block:: python

     class Tree:
        pass

**Class Methods and Function Names**

Class methods and function names should be lowercase, with words separated by underscores.

.. code-block:: python

     def this_is_a_function():
         pass
    
     class ClassName:
         def class_method(self):
             pass

**Exception Names**

.. code-block:: python

    class VertexError(TypeError):
        pass


**Whitespace in Expressions and Statements**

Avoid extraneous whitespace in the following situations:

Immediately inside parentheses, brackets or braces.

.. code-block:: python

    # Yes:
    spam(ham[1], {eggs: 2})

    # No:
    spam( ham[ 1 ], { eggs: 2 } )



Immediately before a comma, semicolon, or colon:


.. code-block:: python

    # Yes:
    if x == 4:
        print x, y
        x, y = y, x

    # No:
    if x == 4 :
        print x , y
        x , y = y , x

Immediately before the open parenthesis that starts the argument list of a function call:

.. code-block:: python

    # Yes:
    spam(1)
    # No:
    spam (1)


Immediately before the open parenthesis that starts an indexing or slicing:

.. code-block:: python

    # Yes:
    dict['key'] = list[index]
    # No:
    dict ['key'] = list [index]


Use spaces around arithmetic operators:

.. code-block:: python

    # Yes:
    
    i = i + 1
    submitted += 1
    x = x * 2 - 1
    hypot2 = x * x + y * y
    c = (a + b) * (a - b)
    
    # No:
    
    i=i+1
    submitted +=1
    x = x*2 - 1
    hypot2 = x*x + y*y
    c = (a+b) * (a-b)



Don't use spaces around the '=' sign when used to indicate a keyword argument or a default parameter value.


.. code-block:: python

    #Yes:
    
    def complex(real, imag=0.0):
        return magic(r=real, i=imag)
    
    #No:
    
    def complex(real, imag = 0.0):
        return magic(r = real, i = imag)

Property
--------

Use property instead of get, set methods. Hide get and set methods with a leading underscore. Classes with properties have to inherit from object.


.. code-block:: python

    # Ok, new style
 
    class Tree(object):
        @property
        def root(self):
            return self._root

        @property.setter
        def root(self, root):
            self._root = root


    # Ok, old style

    class Tree(object):
        def _get_root(self):
            return self._root
        def _set_root(self, _root):
            self._root = _root
        root = property(_get_root, _set_root)


    # No:
    class Tree(object):
        def get_root(self):
            return self._root
        def set_root(self, _root):
            self._root = _root
        root = property(get_root,set_root)

Arborescence
============


plugins
-------

Plugin classes (factories):


.. code-block:: text-only

    mypackage/plugins/groupnames/abc.py
    mypackage/plugins/groupnames/xyz.py

abc.py contains class PluginAbc.

For example:

.. code-block:: text-only

    oalab/plugins/applets/helpwidget.py (class HelpWidget)

If your package defines a new group of plugin, just add a "groupname.py" module
to describe it (documentation, interfaces, ...)

.. code-block:: text-only

    mypackage/plugins/groupname.py

For example:

.. code-block:: text-only

    oalab/plugins/applet.py (contains IPluginApplet)

C++ specific Coding Guidelines
==============================


General Practices
-----------------


    * Write warning free code. What generates a warning on one platform will generate errors on another.
    * Don't use NULL for pointers. Use 0 instead.
    * Don't compare == 'true' or 'false'. Use (x) or (!x) instead.
    * Don't put an else right after a return.
    * Use Doxygen markup language in any new class header files.
    * Forward declare classes in your header files instead of including them whenever possible.
    * Use smart pointers instead of raw pointers.

Code Layout
-----------


**Indentation**

Use 4 spaces per indentation level. Do not use tabs.

Naming
------


**Functions**

.. code-block:: cpp

      int fct( int i, int j )
          {
          // ...
          }

**Loops**

.. code-block:: cpp

    for( int i= 1; i <= n; ++i )
        {
        // ...
        }

    while( cond )
        {
        // ...
        }

    do{
      //...
      }

    while( cond );

References
==========

.. todo ::

    - [[http://www.python.org/dev/peps/pep-0008/|PEP 8, Style Guide for Python Code]]
    - [[http://en.wikipedia.org/wiki/GNU_Coding_Standards|GNU Coding Standard]]
    - [[http://www.mozilla.org/hacking/mozilla-style-guide.html#General|Mozilla Coding Style Guide]]
