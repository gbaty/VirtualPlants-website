=================================
Using OpenAleaLab in command line
=================================


.. option:: --list-plugins category


    List all plugin available for a given category.
    For example --list-plugins oalab.applet list all applets discovered by OpenAleaLab.

    If category is "all", list all plugins.

    If category is "summary", list all plugin categories available in OpenAleaLab. For example oalab.applet, oalab.lab, ...

.. option:: --debug-plugins

    When loading plugins, raise errors instead passing its silently.
    Warning, this option must be used in debug mode only and may cause application crash and lose of unsaved data.