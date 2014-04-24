
.. _label-extending_oalab:

=====================
Extending OpenAleaLab
=====================

This document explains how to concretely extend OpenAleaLab.
For theorirical aspects and future plans, see :ref:`label-pep_plugins`.

OpenAleaLab plugins
===================

Plugin category -> Plugin Factories -> Plugin


**Plugin category**:
A plugin category is defined using entry_point group. 
It defines implicitly that all plugins in this category adhere to a common interface.
One plugin category contains at least one plugin factories.

**Plugin factory**:
A simple class that describe component features.
But, it is very important, that class must not imports module or implements features.
To get class implementing features, a special method called instantiate can be used.

**Plugin**
Class that actually implements features.

GUI special feature
-------------------

In particular case of graphical components, a plugin generally defines an adapter
able to connect a graphical component (a widget for example) to a specific
application. 

Example:

The module called oalab.gui.help provides this help widget:

.. code-block:: python
    :filename: oalab/gui/help.py

    class HelpWidget(QtGui.QWidget):

        def openWeb(self, url):
            """ 
            displays url
            """

        def actions(self):
            """
            Returns a list of 4-uple describing actions:
                ('pane name', 'group name', qaction, button_size).

            Action currently defined are:
                - Open Url
                - Home
            """


OpenAleaLab is the main application that gather all widgets.
We want to add HelpWidget in the MainWindow and allow communication between both classes.
For that purpose, we create a Plugin called HelpWidget in helper package:

.. code-block:: python
    :filename: helper/plugins/oalab/helpwidget.py

    class HelpWidget(object):

        data = {
        # Data that describe plugin
        }

        def __call__(self, mainwindow):
            # Import widget
            # Instantiate it
            # Ask to mainwindow to add it


It is very important to notice that adding widget in the right area is done by
the plugin, not the application. Application does almost nothing, it is just
a container of widgets. Real application intelligence is delegated to Plugins 
(placing and linking components) and components (doing real treatments).

Finally, we register this plugin in setup.py of package helper.

.. code-block:: python
    :filename: helper/setup.py

    setup(
        # setup instructions

        entry_points = { 
            'oalab.applet': [
                'helper = helper.plugins.oalab:HelpWidget'
            }
        )


Available entry points
======================

  - **oalab.applet** [:class:`~openalea.oalab.interfaces.i_applet.IApplet`]: Graphical component displayed in main window.


