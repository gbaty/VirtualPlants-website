
Install Mars-Alt (developers)
=============================

Install development tools
-------------------------

.. include:: install-steps/dev-tools.rst


Install dependencies
--------------------

.. include:: install-steps/marsalt-deps.rst

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

To get last version available, just do 

.. code-block:: bash

  cd package
  git pull


Contribute to packages
----------------------

See :ref:`contribute` and :ref:`git-workflows`.



Troubleshooting
---------------

Multiple installation
#####################

To be sure you are using the right installation, you can run this command:

.. code-block:: bash

  python -c 'import vplants.mars_alt; print vplants.mars_alt.__path__'


Error loading tiff images
#########################

Install python-libtiff

.. code-block:: bash

  sudo apt-get install python-libtiff

Check libtiff is installed correctly

.. code-block:: bash

  python -c "import libtiff"

If you get this message: `ValueError: Failed to find TIFF header file (may be need to run: sudo apt-get install libtiff4-dev)`

Diagnostic : File :download:`tiff_h_4_0_3.py <patch/tiff_h_4_0_3.py>` is missing...
Add this file in the folder : /usr/lib/python2.7/dist-packages/libtiff/

.. code-block:: bash

  sudo cp tiff_h_4_0_3.py /usr/lib/python2.7/dist-packages/libtiff/

Try again :

.. code-block:: bash

  python -c "import libtiff"

Other troubles
##############

For other troubles, see:

See `troubleshooting page <http://openalea.gforge.inria.fr/beta_doc/vplants/vtissue/doc/_build/html/user/mars_alt_v1/troubleshootings.html>`_


.. seealso::

  :ref:`Mars-alt Main Page <marsalt>`



