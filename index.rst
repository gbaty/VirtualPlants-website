devel-website
=============

Repository to store development tips

Documentation
-------------

How to use github and sphinx to generate beautiful documentation.
All tips and models are based on excellent work done by `IPython Team <http://ipython.org>`_ .
Parts of this documentation directly come from `IPython-doc <https://github.com/ipython/ipython-doc/tree/gh-pages>`_ and `IPython-website <https://github.com/ipython/ipython-website>`_.

1. Generate a github project called "project-website" that contains documentation sources (mainly sphinx rst files)
2. Generate a github project called "project-doc" with a branch called "gh-pages". This repository will contain built files (mainly html files)

3. Copy "_scripts" directory from `IPython website <https://github.com/ipython/ipython-website/tree/master/_scripts>`_
4. Create your sphinx project with sphinx-wizard.
5. Add to makefile :

.. code-block::

  site: clean html
  python _scripts/copy_trees.py
  
  # Copy changes to the repo from which they are served
  gh-pages: site
  python _scripts/gh-pages.py


