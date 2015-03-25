
.. _workflow-gforge:

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
  - merge it

.. include:: workflow-steps/notes.rst
.. include:: workflow-steps/git_configure.rst
.. include:: workflow-steps/create_gforge_private_fork.rst
.. include:: workflow-steps/configure_gforge_private_fork.rst
.. include:: workflow-steps/create_devel_branch.rst
.. include:: workflow-steps/work_on_modifs.rst
.. include:: workflow-steps/commit_message.rst
.. include:: workflow-steps/push_branch.rst
.. include:: workflow-steps/prepare_merging.rst

.. note::

  If you want a review on your code, you can use :ref:`workflow-private`.
  Else, just integrate it yourself.

.. include:: workflow-steps/manual_merge.rst

Finalization
============

.. code-block:: bash

    git push # push last master version on your clone

    # Check you find all yours commits on upstream/master
    # If yes:
    # git branch --delete fix_app_crash_mac_os_10_9 # delete branch locally
    # git push origin :fix_app_crash_mac_os_10_9 # delete branch on gforge fork

You can now start a new contribution cycle, see "Create development branch"

