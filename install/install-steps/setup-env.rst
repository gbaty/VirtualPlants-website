If not yet done, edit your bashrc file (generally in /home/user/.bashrc) and add (if not yet in file)

.. code-block:: bash

  source ~/.openalea.sh
  export PATH=$PATH:$HOME/.local/bin/
  export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

Save and close the file
Then close your terminal and open it again.

To download private repository, you need to configure your `ssh key on gforge <https://gforge.inria.fr/account/editsshkeys.php>`_.

