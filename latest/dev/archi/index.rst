=========================
Developer's documentation
=========================

.. toctree::
    :maxdepth: 1

    api_project
    components
    api_gui_application


Concepts
========

.. toctree::
    :maxdepth: 1

    object_communication
    extensions
    coupling_use_cases


Full API
========

.. toctree::
    :maxdepth: 1

    openalea.oalab <apidoc/oalab/openalea.oalab>
    openalea.core <apidoc/core/core>

Full API tree has been generated using

.. code-block:: bash

    sphinx-apidoc -f -o latest/dev/archi/apidoc/core openalea/core/src
    sphinx-apidoc -f -o latest/dev/archi/apidoc/oalab openalea/oalab/src openalea/oalab/src/openalea/oalab/gui openalea/oalab/src/openalea/oalab/legacy

