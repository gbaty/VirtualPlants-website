
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

.. include:: workflow-steps/notes.rst
.. include:: workflow-steps/git_configure.rst
.. include:: workflow-steps/create_gforge_private_fork.rst
.. include:: workflow-steps/configure_gforge_private_fork.rst
.. include:: workflow-steps/create_devel_branch.rst
.. include:: workflow-steps/work_on_modifs.rst
.. include:: workflow-steps/commit_message.rst
.. include:: workflow-steps/push_branch.rst
.. include:: workflow-steps/prepare_merging.rst

Submit your pull-request
========================

Go to upstream project page on gforge.inria.fr and click on tracker tab (outils suivi). 
Click on "pull-request-project" link, and then create a new entry, and do not forget to give an url.
This url is used by reviewers to reach your work, review it and integrate it.

url is something like:
git+ssh://username@scm.gforge.inria.fr//gitroot/username/project.git
You can obtain it with, 

.. code-block:: bash
    :emphasize-lines: 4

    git remote -v
    
    origin   git+ssh://username@scm.gforge.inria.fr//gitroot/usernamegit/project.git (fetch)
    origin   git+ssh://username@scm.gforge.inria.fr//gitroot/usernamegit/project.git (push)
    upstream git+ssh://username@scm.gforge.inria.fr//gitroot/organization/project.git (fetch)
    upstream git+ssh://username@scm.gforge.inria.fr//gitroot/organization/project.git (push)

Copy paste line corresponding to origin and remove "git+ssh://username@"

branch is the name of your branch, for example "fix_app_crash_mac_os_10_9".

You need to allow at list one official "integrator" to read your private repository.
For that, on your private project, go to "user and permissions", 
add a new "reviewer" (or integrator) role with "read access" to repository and then add the integrator.


Reviewer: review branch
=======================

Read this part only if you are a reviewer !

.. code-block:: bash

    git remote add username git+ssh://username@scm.gforge.inria.fr//gitroot/username/project.git
    git fetch username
    git checkout username/branch -b review_username_branch
    # review changes, if all correct, write it on tracker and set state to "confirmed"

Integrator: integrate branch
============================

Read this paragraph only if you are an integrator !

.. code-block:: bash

    # Check branch has not changed since previous review
    git checkout review_username_branch
    git pull

    git checkout master
    git pull upstream master

    # --no-ff (no fast forward) is used to create a merge commit.
    # This commit is used to create a link between tracker and git repository
    git merge --no-ff review_username_branch

It is very important to follow this message convention:

.. code-block:: text

    Merge pr/[#trackerid] from branch username/branchname into master
    #example: Merge pr/[#18786] from branch gbaty/support_repr_vtk into master

Then push it to official repository

.. code-block:: bash

    git push upstream master

Finally, set PR tracker state to "closed" and add comment "merged".
This is important to signal to others contributors that pr has been integrated.

Finalization
============

If pull request has been integrated:

.. code-block:: bash

    git checkout master
    git pull upstream master

    # Check you find all yours commits on upstream_master
    # If yes:
    # git branch --delete branch # delete branch locally
    # git push origin :branch # delete branch on gforge fork

You can now start a new contribution cycle, see "Create development branch"

