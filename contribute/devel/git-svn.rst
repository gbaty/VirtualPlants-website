===================================
Migrate public gforge/svn to github
===================================

First install **git-svn**

On linux, package is generally called "git-svn"

On Mac OS X with macport:

.. code-block:: bash

    sudo port deactivate git
    sudo port install git +svn

All scripts are available in virtualplants/svntogit project.

Migrate whole svn repository to git
===================================

1. extract svn author names and save it in a file:

.. code-block:: bash

    svn log --quiet | awk '/^r/ {print $3}' | sort -u > svn-authors

2. update svn-authors:

.. code-block:: text

    svnname = Full Name <email>

.. code-block:: bash

    git svn clone --authors-file=svn-authors svn+ssh://USER@scm.gforge.inria.fr/svnroot/PROJECT/trunk PROJECT-git-svn


If it fails due to an author missing in author file, like
Author: anonymous not defined in svn-authors file

Just add it to author file, go to PROJECT-git-svn and continue:

.. code-block:: bash

    cd PROJECT-git-svn
    git svn fetch


To synchronize with last svn changes (done after git svn clone)

.. code-block:: bash

    cd PROJECT-git-svn
    git svn rebase


Export tags : git push --tags

Useful links:
  - `fix broken history <http://stackoverflow.com/questions/19385565/fix-broken-git-history-after-merging-other-repo-into-subdir>`_
  - `merge 2 repositories <http://jasonkarns.com/blog/merge-two-git-repositories-into-one>`_



Migrate subpart of repository while keeping history
===================================================
Hack to extract only commit with modification in a specific directory

.. code-block:: bash

    #1. Convert a whole repository but keep only one directory (here "misc" from "openalea" svn repository)
    # Replace svn url with right one found on gforge
    git svn clone --authors-file=svn-authors  --include-paths="^misc" svn://scm.gforge.inria.fr/svnroot/openalea/trunk misc-git-svn
    
    #2. Generate a file with commit information
    cd misc-git-svn
    git log --name-only --pretty=format:commit:%H > ../commits-misc.txt
    
    #3. Generate a bash script to cherry-pick these commits
    python parse-commits.py ../commits-misc.txt > cherry-pick.sh
    
    #4. Create new empty git repository
    cd ..
    mkdir misc-git-svn-filtered
    cd misc-git-svn-filtered
    git init
    git remote add origin ../misc-git-svn
    git fetch origin
    
    # 5. Check cherry-pick script and run it.
    sh ../misc-git-svn/cherry-pick.sh
    
    # 6. Go to your real github repository and import this branch
    cd ../repo
    git remote add local_misc ../misc-git-svn-filtered
    git fetch local_misc
    git checkout local_misc/master -b misc-git-svn
    
    # 7. Rewrite historic to avoid to appears as commiter in each commit
    
    
    # 8. Merge it
    git checkout master
    git merge misc-git-svn

