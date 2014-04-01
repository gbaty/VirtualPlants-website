=====================================
Extensible and pluggable applications
=====================================

As written in `Envisage documentation <http://docs.enthought.com/envisage/envisage_core_documentation>`_, 
the applications we write need to change over time. 
We fix bugs, and we add, modify, and remove features. 
In other words, we spend most of our time either fixing or extending applications.

Sometimes we extend our applications by changing the actual code, 
sometimes we have other ad hoc extension mechanisms in place – a text file here, 
a directory of scripts there. 
As applications grow, they often end up with numerous places where they can be extended, 
but with a different extension mechanism at each one. 
This makes it hard for developers who want to extend the application to know :

    - where they can add extensions
    - how to add them


Useful links
============

Some implementations
--------------------

  * `Trac component architecture <http://trac.edgewall.org/wiki/TracDev/ComponentArchitecture>`_
  * `Yapsy (yet another plugin system) <http://packages.python.org/Yapsy>`_  (example of plugin framework. Several links inside)
  * `Envisage <http://docs.enthought.com/envisage/envisage_core_documentation>`_
  * `PyUtilib <https://software.sandia.gov/trac/pyutilib>`_, `Architecture Doc (PDF) <https://software.sandia.gov/trac/pyutilib/export/3245/pyutilib.component.doc/trunk/doc/plugin/pca.pdf>`_
  * `Another simple framework <http://martyalchin.com/2008/jan/10/simple-plugin-framework>`_


Other documentation
-------------------

  * `Fundamental concept of plugin infrastucture <http://eli.thegreenplace.net/2012/08/07/fundamental-concepts-of-plugin-infrastructures>`_
  * `Python plugin framework <http://wehart.blogspot.fr/2009/01/python-plugin-frameworks.html>`_

PkgResources / entry points
===========================

  * `pkg_resources official website <http://peak.telecommunity.com/DevCenter/PkgResources>`_

ETS Envisage / extension points
===============================

  * `Envisage official website <http://docs.enthought.com/envisage/envisage_core_documentation>`_, 

OpenAlea components
===================

See `How to declare OpenAlea components <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:component:how_to_declare_logical_components>`_.

