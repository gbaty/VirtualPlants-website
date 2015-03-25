Merge branch
============


.. code-block:: bash

    git checkout master
    git pull upstream master

    # --no-ff (no fast forward) is used to create a merge commit.
    git merge --no-ff fix_app_crash_mac_os_10_9

Then push it to official repository

.. code-block:: bash

    git push upstream master