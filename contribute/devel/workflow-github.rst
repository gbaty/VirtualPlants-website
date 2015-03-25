
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

.. include:: workflow-steps/notes.rst
.. include:: workflow-steps/git_configure.rst
.. include:: workflow-steps/fork_github_repository.rst
.. include:: workflow-steps/create_devel_branch.rst
.. include:: workflow-steps/work_on_modifs.rst
.. include:: workflow-steps/push_branch.rst
.. include:: workflow-steps/commit_message.rst
.. include:: workflow-steps/prepare_merging.rst
.. include:: workflow-steps/push_new_branch.rst


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
    git checkout master
    git pull upstream master
    git push

You can now start a new contribution cycle, see "Create development branch"
