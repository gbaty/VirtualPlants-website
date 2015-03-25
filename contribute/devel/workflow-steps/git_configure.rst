Configure git
=============

"--global" refer to your username on your computer. **So you need to config only once for you.**

If you want a specific config for a specific project, please use "--local"

.. code-block:: bash

    git config --global user.name "my name"
    git config --global user.email myemail@foo.com
    git config --global push.default simple
    git config --global core.editor <your_favorite_editor>