If not yet installed, install external dependencies:
On ubuntu 14.04, you need to install ipython manually because packaged version is too old.

  - ipython 2.x + qtconsole (apt: ipython, ipython-qtconsole, ubuntu: pip install ipython==2.4.1)
  - scons
  - PyQt4 (apt: python-qt4)
  - Numpy (apt: python-numpy)
  - matplotlib (apt: python-matplotlib)
  - zlib headers (apt: zlib1g-dev)

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
  
  - `develop --user` : to install in developer mode, in your home dir
  - `develop --prefix=$HOME/local` : to install in developer mode in directory of your choice
  - `install` : to do a system installation
  - `install --prefix=...` : to install in directory of your choice


.. code-block:: bash

  git clone https://github.com/openalea/sconsx.git
  cd sconsx
  python setup.py COMMAND
  cd -