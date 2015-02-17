
.. _workflow-github:

============================
Public development on github
============================

The workflow describe here is mainly inspired from 
IPython development workflow and especially from a
Fernando Perez message (unfortunatly these links are no more available).

Steps to follow are :

  - configure git and github
  - fork github project you want to work on
  - create a new //branch// with explicit name (ex: //fix_app_crash_mac_os_10_9//)
  - work on your new branch
  - **prepare your work for merging**
  - submit your pull request

.. note::

    If you are a new git user, you can try git on `try.github.io <http://try.github.io>`_ to be more familiar with git commands. 
    You can also have a look to `Atlassian Git documentation <https://fr.atlassian.com/git>`_.


Configure git
=============

"--global" refer to your username on your computer. **So you need to config only once for you.**

If you want a specific config for a specific project, please use "--local"

.. code-block:: bash

    git config --global user.name "my name"
    git config --global user.email myemail@foo.com
    git config --global push.default simple
    git config --global core.editor <your_favorite_editor>

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


Add a reference to official repository.

.. code-block:: bash

    git remote add upstream https://github.com/official/project
    git fetch upstream
    git checkout upstream/master -b upstream_master


Create development branch
=========================

You must create a branch for each new feature, bug fix, and so on.
Development must be short : **one branch = one task**

**NEVER NEVER work on master, always on a branch**

Get last version of upstream/master

.. code-block:: bash

    git checkout upstream_master # go to your local master branch
    git pull upstream master # update it with upstream master
    git push # push upstream changes to your personal repository

Now, you can create your new branch.
Please choose an explicit name.

.. code-block:: bash

    git checkout -b wip_fix_app_crash_mac_os_10_9
    git push --set-upstream origin wip_fix_app_crash_mac_os_10_9

Work on your development branch
===============================


.. code-block:: bash

    # edit file(s)
    git commit
    git add mynewfile.py
    git commit
    # edit file(s)
    git commit


Save your branch and commits on your personal repository on github

.. code-block:: bash

    git push origin wip_fix_app_crash_mac_os_10_9



Commit message
==============

Please write a `good commit message <http://web-design-weekly.com/blog/2013/09/01/a-better-git-commit/>`_:

Try to limit using the -m commit flag.

If using the simpler git commit command it should open up Vim (if it’s your default editor) where you can construct a better commit by following some of these simple steps.

      * The **first line should be a short summary**. Referencing the bug number or the main accomplishment of the change. e.g “Fixes issue #8976″. This is the title of your commit and should be **less than 50 characters**.
      * Then a **line break**.
      * Followed by a **longer detailed description about the things that changed**. This section is a really good place to explain what and why. You could cover statistics, performance wins, roadblocks, etc. The text should be wrapped at 72 characters.

Prepare your work for merging
=============================

Before asking other to integrate your work, you must clean it.
First get last modifications and work on a new branch created especially for cleaning. 

Get last version of upstream/master

.. code-block:: bash

    git checkout upstream_master # go to your local master branch
    git pull upstream master # update it with upstream master
    git push # push upstream changes to your personal repository

It is safer to create a new branch for rebase

.. code-block:: bash

    git checkout wip_fix_app_crash_mac_os_10_9 # get your development branch
    git checkout -b fix_app_crash_mac_os_10_9 # create and checkout new branch
    git rebase upstream_master

If master has diverged during your work, conflicts can occur !
Fix conflicts for each file and finish rebase :

.. code-block:: bash

    # edit file1 and solve conflicts
    git add file1 # say to git that conflict is resolved
    # edit file2 and solve conflicts
    git add file2
    git rebase --continue

If rebase has gone wrong, for example you've rebased the wrong branch, you can cancel it with

.. code-block:: bash

    git rebase --abort

.. note::

    For advanced user, you can also use `git rebase --interactive <https://help.github.com/articles/interactive-rebase>`_.

Finally, you can push rebased branch to github

.. code-block:: bash

    git push --set-upstream origin fix_app_crash_mac_os_10_9


Submit your pull-request
========================

On github interface, select your branch fix_app_crash_mac_os_10_9 and click on pull-request (or compare & pull-request).

You must see at right :


    Able to merge
    These branches can be automatically merged 


If it's not the case, master has probably diverged. You must turn back to previous step and do it again.

Now it is OK ! 
As your branch is very clean, other developers have absolutely nothing to do to integrate your work (except to review your changes) and so they will certainly integrate it.


Maintainer: merge pull-request
==============================

This work is done in two steps :

  - review work (read modifications, test it, ...)
  - integrate it (merge)


To review work, just checkout pull-request. See github documentation : 
`Checkout pull request <https://help.github.com/articles/checking-out-pull-requests-locally>`_.

If pull-request is ok, just click on "merge pull-request"

Finalization
============

If pull request has been integrated:
You can know delete you branch from pull-request page on github.
Then:

.. code-block:: bash

    git fetch -p
    git checkout upstream_master
    git pull upstream master
    git push

You can now start a new contribution cycle, see "Create development branch"
