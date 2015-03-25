Prepare your work for merging
=============================

Before asking other to integrate your work, you must clean it.
First get last modifications and work on a new branch created especially for cleaning. 

Get last version of upstream/master

.. code-block:: bash

    git checkout master # go to your local master branch
    git pull upstream master # update it with upstream master
    git push # push upstream changes to your personal repository

It is safer to create a new branch for rebase

.. code-block:: bash

    git checkout wip_fix_app_crash_mac_os_10_9 # get your development branch
    git checkout -b fix_app_crash_mac_os_10_9 # create and checkout new branch, not we removed the "wip"
    git rebase master

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