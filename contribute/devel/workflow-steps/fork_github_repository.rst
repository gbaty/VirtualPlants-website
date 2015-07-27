Log on github
=============

To start, you must create a github account and log in.

Fork github project
===================

On git, you **never work directly on official repository** but only on your personal repository.
Do do that, you must create a clone of the repository (a "fork") on your personal area just by clicking on **fork button**.

You can see in top-left corner : 

  yourname/project
  forked from othername/project


Now, clone it on your computer.
Just copy url displayed on your web browser and pass it to git clone command:

.. code-block:: bash

    git clone https://github.com/yourname/project

Change to newly created directory, usually project/:

.. code-block:: bash

    cd project/


Add a reference to official repository.

.. code-block:: bash

    git remote add upstream https://github.com/official/project
    git fetch upstream