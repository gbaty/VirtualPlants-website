
Install Mars-Alt (developers)
=============================

Install development tools
-------------------------

.. include:: install-steps/dev-tools.rst


Install dependencies
--------------------

.. include:: install-steps/common-deps.rst
.. include:: install-steps/deploy-deps.rst

Setup your environment
----------------------

.. include:: install-steps/setup-env.rst

Download Mars-Alt
-----------------

Then, install Mars-Alt and **openalea** core components

These commands clone all repositories and must be done only one time !

.. code-block:: bash

  git clone https://github.com/openalea/openalea.git
  git clone https://github.com/openalea/openalea-components.git
  git clone git+ssh://username@scm.gforge.inria.fr//gitroot/tissue/tissue.git
  git clone git+ssh://username@scm.gforge.inria.fr//gitroot/marsalt/marsalt.git


During svn -> git migration
---------------------------

.. include:: install-steps/transition-svn-git.rst


Update and install packages
---------------------------

For these packages:

  - openalea
  - openalea-components
  - mars-alt

.. code-block:: bash

  cd package
  python multisetup.py COMMAND

For this package:

  - tissue

.. code-block:: bash

  cd package
  python setup.py COMMAND

.. code-block:: bash

  $HOME/.local/bin/alea_config

close terminal and reopen it.

Download Test Data
------------------

.. code-block:: bash

  sudo $HOME/.local/bin/alea_install VPlants.VTissueData


Run programs
------------

.. code-block:: bash

  visualea # to run Visualea to test mars-alt in dataflows

Update packages
---------------

.. include:: install-steps/update.rst

Contribute to packages
----------------------

See :ref:`contribute` and :ref:`git-workflows`.

Troubleshooting
---------------

.. include:: install-steps/troubleshooting.rst

