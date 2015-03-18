##############################
Install Mars-Alt and TissueLab
##############################

Install dependencies
####################

Install external dependencies:

  - python-qt4
  - python-vtk5
  - python-numpy
  - python-matplotlib

See `Linux <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:user:installation_linux>`_ or `MacOSX <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:user:installation_mac>`_ page on  `openalea website <http://openalea.gforge.inria.fr>`_.

Then, if not yet installed, install openalea dependencies: **deploy** and **sconsx**

.. code-block:: bash

  git clone https://github.com/openalea/deploy.git
  cd deploy
  python setup.py develop --user
  cd -

.. code-block:: bash

  git clone https://github.com/openalea/deploy.git
  cd deploy
  python setup.py develop --user
  cd -

Download Mars-Alt and TissueLab
###############################

Then, install **OpenAleaLab**, **TissueLab** and **openalea** core components

These commands clone all repositories and must be done only one time !

.. code-block:: bash

  git clone https://github.com/openalea/openalea.git
  git clone https://github.com/openalea/openalea-components.git
  svn co svn+ssh://scm.gforge.inria.fr/svnroot/vplants/vplants/trunk/container
  git clone git+ssh://scm.gforge.inria.fr//gitroot/tissue/tissue.git
  git clone git+ssh://scm.gforge.inria.fr//gitroot/marsalt/marsalt.git
  git clone git+ssh://scm.gforge.inria.fr//gitroot/tissue/tissuelab.git


Update and install packages
###########################

For these packages:

  - openalea
  - openalea-components
  - mars-alt

.. code-block:: bash

  cd package
  python multisetup.py develop --user

For these packages:

  - tissue
  - tissuelab

.. code-block:: bash

  cd package
  python setup.py develop --user

Update packages
###############

To get last version available, just do 

.. code-block:: bash

  cd package
  git pull

Important, for container, you need to do "svn up" instead.
This package will be migrated in openalea-components soon.




