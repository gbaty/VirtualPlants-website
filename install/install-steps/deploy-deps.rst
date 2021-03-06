See `Linux <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:user:installation_linux>`_ or `MacOSX <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:user:installation_mac>`_ page on  `openalea website <http://openalea.gforge.inria.fr>`_.

Then, if not yet installed, install openalea dependencies: **deploy** and **sconsx**

Open a terminal, go to the directory where you want to install programs, for example

.. code-block:: bash

  cd $HOME/development

.. code-block:: bash

  git clone https://github.com/openalea/deploy.git
  cd deploy
  python setup.py COMMAND
  cd -

COMMAND can be:
  
  - **develop --user** : to install in developer mode, in your home dir
  - `develop --prefix=$HOME/local` : to install in developer mode in directory of your choice
  - `install` : to do a system installation
  - `install --prefix=...` : to install in directory of your choice

.. warning::

  If you don't know exactly what to do, please use: **develop --user**

.. code-block:: bash

  git clone https://github.com/openalea/sconsx.git
  cd sconsx
  python setup.py COMMAND
  cd -