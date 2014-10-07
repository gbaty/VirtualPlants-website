
If you have OpenAlea installed from sources from GForge and you want the last version available on GitHub, you have to follow this steps:

update old openalea (optionnal)
###############################

.. code-block:: bash

    cd openalea
    svn up

modify old multisetup.py
########################

- comment following lines
    - core (~line 52)
    - misc (~line 58)
    - vpltk (Depends of version you have.) (~line 51)
    - oalab (Depends of version you have.)
- run multisetup
    .. code-block:: bash
    
        python multisetup.py develop
    
download and install new version of openalea
############################################

.. code-block:: bash

    cd ..
    git clone https://github.com/openalea/openalea openalea-git
    cd openalea-git
    python multisetup.py develop
