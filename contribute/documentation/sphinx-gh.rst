===========================
Contribute to documentation
===========================

Improve openalea.github.io website
==================================

Follow github workflow on project VirtualPlants-website.

**VirtualPlants-website**:

.. include:: ../devel/project/summary-virtualplants-website.rst


* Install softwares:

    - `git <http://git-scm.com>`_
    - `sphinx <http://sphinx-doc.org>`_

.. toctree::

    ../devel/workflow-pull-push


To check if your modifications are correct, you need to build html documentation with:

.. code-block::

    make html

Then check result in "_build/html" directory (open index.html with a web browser).
If all is ok, you can push it to main repository.


Create a new website based on sphinx and github
===============================================

When developing a software, it is necessary to have a place to share and put documentation.
For users, this documentation must be nice and easy to read. It must allow to search specific topics. 
For developers, this documentation must be easy to write, easy to read and browse and keep history. 
It is also important that documentation facilitate link to real code, for example by providing syntax highlighting or extraction of code's documentation.


We suggest to use sphinx to edit and build documentation and github to share it and keep history.
Please have look to :ref:`Sphinx page <label-TODO>` and :ref:`github page <label-TODO>` for more information.

All tips and models are based on excellent work done by `IPython Team <http://ipython.org>`_ .
Parts of this documentation directly come from `IPython-doc <https://github.com/ipython/ipython-doc/tree/gh-pages>`_ and `IPython-website <https://github.com/ipython/ipython-website>`_.

Create official organization website
------------------------------------

If you just want to contribute, please go to next step. This step is useful for organization owners only.

Create source repository
~~~~~~~~~~~~~~~~~~~~~~~~

* Generate a github project called "organization-website".

  - Select right organization account (not your user account). This project contains documentation sources (mainly sphinx rst files)
  - To question "Add readme", say yes !

* Prepare github directory

  - Launch a terminal
  - **Warning**: you must modify replace ORGANIZATION with the right one.
  - Once modified, launch these commands.

.. code-block:: bash

    # cd /go/to/your/directory
    git clone https://github.com/ORGANIZATION/ORGANIZATION-website
    cd ORGANIZATION-website
    mkdir _scripts

* Copy scripts :download:`gh-pages.py` and :download:`copy_trees.py` into "_scripts" directory
* Modify _scripts/gh-pages.py and change page_repo values. Generally, just replace both ORGANIZATION and USERNAME with organization name.

* Create your sphinx project with sphinx-wizard.

.. code-block:: bash

    # Go to root directory (not in _scripts)
    sphinx-quickstart

    # Keep default value except ...
    # To question "Separate source and build directories (y/n) [n]", answer n
    # To question "Generate Makefile (y/n) [y]", answer n (to use a custom Makefile)

* Click on this :download:`link <Makefile>` and save Makefile into you documentation directory.


Create html repository
~~~~~~~~~~~~~~~~~~~~~~

Create repository to put generated html files.

* Go to github.com again
* Generate a github project called "organization.github.io", as explained in `Github help pages <http://pages.github.com>`_.

  - Select right organization account (not your user account). This project contains documentation sources (mainly sphinx rst files)
  - To question "Add readme", say yes !


* Create a file named ".nojekyll" in project myorganization.github.io this is required to 
    - disable jekyll (and allow to put folder beginning with _, see `Github faq <http://help.github.com/articles/files-that-start-with-an-underscore-are-missing>`_)
    - create a master branch necessary to build scripts


Create your personal repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::

    - Go on github.com and log in.
    - Fork ORGANIZATION-website (https://github.com/ORGANIZATION/ORGANIZATION-website).
      This step create a new project https://github.com/USERNAME/ORGANIZATION-website.

Then, on a terminal, do

.. code-block:: bash

    # Checkout your fork

    git clone https://github.com/USERNAME/ORGANIZATION-website
    cd ORGANIZATION-website


    # Create an empty branch used to host generated files
    # Never work on this branch as script will replace all files automatically

    git checkout --orphan gh-pages
    git rm -rf . # clear branch
    touch README.md
    touch .nojekyll
    git add README.md .nojekyll
    git commit -m "Initial commit"
    git push origin gh-pages


    # Come back to source directory
    git checkout master


Standard workflow
-----------------

Local Editing
~~~~~~~~~~~~~

While your documentation has not reached a stable step :

* modify rst sources, add files, ...
* generate html files locally with "make html"
* fix warnings and errors
* check and fix links with "make linkcheck"
* check and fix doctests mith "make doctest"
* check result in _build/html/index.html

Share your work
~~~~~~~~~~~~~~~

When your modifications are enough stable, you may want to share your work with other

* remove "_build" and "gh-pages" directory and do all checks again (links, doctests, errors and warnings)
* Commit and push source modifications : see :ref:`github workflow <workflow-github>`
* generate html files and an associated commit with "make gh-pages"
* check git state in gh-pages (normally all is ok)
* push gh-pages

Publish your work on official website
-------------------------------------

Now, other developers can see sources on your fork and result at http://USERNAME.github.io/ORGANIZATION-website

If your work is accepted, you may want to integrate your work in official website.
For this last step, id depends on workflow your team has chosen.

Generally, if you are a maintainer of official website, you can push html files to website with

.. code-block:: bash

    cd ORGANIZATION-website
    # Remove all pages
    #rm -rf gh-pages 
    make publish

If you are a contributor, just create a pull-request following standard git workflow.


