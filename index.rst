devel-website
=============

Repository to store development tips

Documentation
-------------

How to use github and sphinx to generate beautiful documentation.
All tips and models are based on excellent work done by `IPython Team <http://ipython.org>`_ .
Parts of this documentation directly come from `IPython-doc <https://github.com/ipython/ipython-doc/tree/gh-pages>`_ and `IPython-website <https://github.com/ipython/ipython-website>`_.

  * Generate a github project called "organization-website" that contains documentation sources (mainly sphinx rst files)
  * Copy "_scripts" directory from `IPython website <https://github.com/ipython/ipython-website/tree/master/_scripts>`_
  * Create your sphinx project with sphinx-wizard.

To question Separate source and build directories (y/n) [n], answer n

  * Add to makefile :

.. code-block:: text

  site: clean html
  	python _scripts/copy_trees.py
  
  # Copy changes to the repo from which they are served
  gh-pages: site
  	python _scripts/gh-pages.py

.

  * Create of repository for the website for your user or organization as explained in `Github help pages <http://pages.github.com>`_
  * Create an empty file on this repository and push it to github (this is necessary because a master branch is required on this repo)
  * Modify _scripts/gh-pages.py and change page_repo with your website address (for example: git@github.com:myorganization/myorganization.github.io.git
