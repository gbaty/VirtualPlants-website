
===================
Sphinx/Github pages
===================

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
      - disable jekyll (and allow to put folder beginning with _, see `Github faq <https://help.github.com/articles/files-that-start-with-an-underscore-are-missing>`_)
      - create a master branch necessary to build scripts

Update your repositories
========================

Standard workflow
-----------------

  * modify rst sources, add files, ...
  * generate html files locally : "make html"
  * check result in _build/html. If ok, continue to next step.
  * Commit and push source modifications
  * generate a commit with "make gh-pages"
  * check git state in gh-pages (normally all is ok)
  * push gh-pages
