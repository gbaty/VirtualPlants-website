=======================================================
Create a developer documentation with sphinx and github
=======================================================

Introduction
============

When developing a software, it is necessary to have a place to share and put documentation.
For users, this documentation must be nice and easy to read. It must allow to search specific topics. 
For developers, this documentation must be easy to write, easy to read and browse and keep history. 
It is also important that documentation facilitate link to real code, for example by providing syntax highlighting or extraction of code's documentation.


We choose to use sphinx to edit and build documentation and github to share it and keep history.
Please have look to :ref:`Sphinx page <label-TODO>` and :ref:`github page <label-TODO>` for more information.


Create repositories
===================

How to use github and sphinx to generate beautiful documentation.
All tips and models are based on excellent work done by `IPython Team <http://ipython.org>`_ .
Parts of this documentation directly come from `IPython-doc <https://github.com/ipython/ipython-doc/tree/gh-pages>`_ and `IPython-website <https://github.com/ipython/ipython-website>`_.

Create documentation source repository
--------------------------------------

  * Generate a github project called "organization-website" that contains documentation sources (mainly sphinx rst files)
  * Copy "_scripts" directory from `IPython website <https://github.com/ipython/ipython-website/tree/master/_scripts>`_
  * Modify _scripts/gh-pages.py and change page_repo with your website address.
      - For example: git@github.com:myorganization/myorganization.github.io.git
  
  * Create your sphinx project with sphinx-wizard
      - To question "Separate source and build directories (y/n) [n]", answer n

  * Add to makefile :

.. code-block:: text

  site: clean html
  	python _scripts/copy_trees.py
  
  # Copy changes to the repo from which they are served
  gh-pages: site
  	python _scripts/gh-pages.py


Create html repository
----------------------

Create repository to put generated html files.

  * create one repository for your user or organization as explained in `Github help pages <http://pages.github.com>`_
  * create a file named ".nojekyll" in project myorganization.github.io this is required to 
      - disable jekyll (and allow to put folder beginning with _, see `Github faq <http://help.github.com/articles/files-that-start-with-an-underscore-are-missing>`_)
      - create a master branch necessary to build scripts

Update your repositories
========================

Local Editing
-------------

While your documentation has not reached a stable step :

  * modify rst sources, add files, ...
  * generate html files locally with "make html"
  * fix warnings and errors
  * check and fix links with "make linkcheck"
  * check and fix doctests mith "make doctest"
  * check result in _build/html/index.html

When your modifications are enough stable

  * remove "_build" directory and do all checks again (links, doctests, errors and warnings)
  * Commit and push source modifications : see :ref:`github workflow <label-TODO>`
  * generate a commit with "make gh-pages"
  * check git state in gh-pages (normally all is ok)
  * push gh-pages

For the last step, id depends on workflow your team has chosen. 
It may be a direct push (old svn approach) or a branch/pull-request approach
