
.. _workflow-pull-push:

============================
Direct workflow: "pull-push"
============================

**This workflow is generally used when working on a new project**


Steps to follow are :

To do only the first time

  - configure git
  - fork official project you want to work on
  - get development branch

For each new modification

  - commit your modifications
  - push it to official repository


.. include:: workflow-steps/notes.rst
.. include:: workflow-steps/git-configure.rst

Clone repository
================

.. code-block:: bash

    git clone giturl
    # with giturl something like git+ssh://username@scm.gforge.inria.fr//gitroot/project/repository.git
    # for example: git+ssh://username@scm.gforge.inria.fr//gitroot/oalab/oalab-tissue.git

Your local repository is now ready to work on !

.. include:: workflow-steps/work-on-modifs.rst
.. include:: workflow-steps/commit-message.rst

Push your work
==============

When your are satisfied with your work, push it to official repository.

.. code-block:: bash

    git fetch
    git rebase
    git push

You can now start a new contribution cycle, see "Work on your modifications"

