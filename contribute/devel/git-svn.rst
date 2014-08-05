===================================
Migrate public gforge/svn to github
===================================


1. extract svn author names and save it in a file:

.. code-block:: bash

    svn log --quiet | awk '/^r/ {print $3}' | sort -u > svn-authors

2. update svn-authors:

.. code-block:: text

    svnname = Full Name <email>

.. code-block:: bash

    git svn clone --authors-file=svn-authors svn+ssh://USER@scm.gforge.inria.fr/svnroot/PROJECT/trunk PROJECT-git-svn


git push --tags

http://stackoverflow.com/questions/19385565/fix-broken-git-history-after-merging-other-repo-into-subdir
http://jasonkarns.com/blog/merge-two-git-repositories-into-one/
