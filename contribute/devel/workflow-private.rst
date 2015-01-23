
.. _workflow-private:

=============================
Private development on gforge
=============================

Steps to follow are :

To do only the first time

  - configure git
  - create your private area on gforge
  - fork official project you want to work on

For each new modification

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

Create your private area
========================

Do this step only one time, once created, never do it again.

To create a private area on gforge, you need a **@inria.fr** email address. Be sure this address is used, 
else, you can `change your gforge email address <https://gforge.inria.fr/account/change_email.php>`_.

Please respect naming convention above

#. `Register a new project <https://gforge.inria.fr/register>`_ :
  - Full name: private repositories your name
  - Description: private repositories (you can write what you want here)
  - Unix name: usernamegit (username is your gforge account login, just add git at the end)
  - Source code: select git button
  - Start from empty project

Create your fork
================

The official project you want to fork in order to contribute will be called "upstream".
To be able to contribute to this "upstream" project, you need to "fork it" (make a private clone of it).
To fork it, do these steps (do it only one time for a project)

#. Go to `My page <https://gforge.inria.fr/my>`_
#. click on your **private repositories** project
#. click on **administration** tab
#. click on **tools** tab
#. enable **source code management** (SCM) by checking it, then update
#. click on **SCM/Code source**
#. click on **administration** tab
#. click on "SCM/Code source"
  - repository name: same as repository you want to fork
  - description: fork full-address-to-forked repository
  - Initial clone URL: erase name, field must be empty

Wait at least one hour!

#. Click on "SCM/Source code"
#. Copy git command (something like `git clone git+ssh://username@scm.gforge.inria.fr//gitroot/usernamegit/usernamegit.git`)
#. Paste this command to clone project on your disk

Configure your fork
===================

.. code-block::

    git remote add private_upstream giturl
    # with giturl something like git+ssh://gbaty@scm.gforge.inria.fr//gitroot/project/repository.git
    git fetch private_upstream
    git checkout private_upstream/master -b private_upstream_master

Your fork is now ready to work on !

Create development branch
=========================

You must create a branch for each new feature, bug fix, and so on.
Development must be short : **one branch = one task**

**NEVER NEVER work on master, always on a branch**

Get last version of upstream/master

.. code-block:: bash

    git checkout private_upstream_master # go to your local master branch
    git pull private_upstream master # update it with upstream master
    git push # push upstream changes to your personal repository

Now, you can create your new branch.
Please choose an explicit name.

.. code-block:: bash

    git checkout -b wip_fix_app_crash_mac_os_10_9
    git push --set-upstream origin wip_fix_app_crash_mac_os_10_9
    # wip means "work in progress"

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

    git checkout private_upstream_master # go to your local master branch
    git pull private_upstream private_upstream_master # update it with upstream master
    git push # push upstream changes to your personal repository

It is safer to create a new branch for rebase

.. code-block:: bash

    git checkout wip_fix_app_crash_mac_os_10_9 # get your development branch
    git checkout -b fix_app_crash_mac_os_10_9 # create and checkout new branch, not we removed the "wip"
    git rebase private_upstream_master

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

Go to project page on gforge.inria.fr and click on tracker tab. 
Create a new entry, and do not forget to give an url.
This url is used by reviewers to reach your work, review it and integrate it.

url is something like:
git+ssh://username@scm.gforge.inria.fr//gitroot/username/username.git

branch is the name of your branch, for example "fix_app_crash_mac_os_10_9".


Reviewer: review branch
=======================

.. code-block:: bash

    git remote add username git+ssh://username@scm.gforge.inria.fr//gitroot/username/username.git
    git checkout username/branch
    # review changes, if all correct, write it on tracker and set state to "confirmed"

Integrator: integrate branch
============================

Read this paragraph only if you are an integrator !

.. code-block:: bash

    git checkout private_upstream_master
    git pull private_upstream master
    git merge username/branch
    git push private_upstream master

Finalization
============

If pull request has been integrated:

.. code-block:: bash

    git checkout private_upstream_master
    git pull private_upstream master

    # Check you find all yours commits on private_upstream_master
    # If yes:
    # git branch --delete branch # delete branch locally
    # git push origin :branch # delete branch on gforge fork

You can now start a new contribution cycle, see "Create development branch"

