Create development branch
=========================

You must create a branch for each new feature, bug fix, and so on.
Development must be short : **one branch = one task**

**NEVER NEVER work on master, always on a branch**

Get last version of upstream/master

.. code-block:: bash

    git checkout master # go to your local master branch
    git pull upstream master # update it with upstream master
    git push # push upstream changes to your personal repository

Now, you can create your new branch.
Please choose an explicit name.

.. code-block:: bash

    git checkout -b wip_fix_app_crash_mac_os_10_9
    git push --set-upstream origin wip_fix_app_crash_mac_os_10_9
    # wip means "work in progress"