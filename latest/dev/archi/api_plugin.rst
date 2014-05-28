
.. _label-extending_oalab:

=======
Plugins
=======

This document explains how to concretely extend OpenAleaLab.
For theoretical aspects and future plans, see :ref:`label-pep_plugins`.

OpenAleaLab plugins
===================

Idea behind plugins is to extend application without modifying code of this application.
Another important aspect is that a plugin can be load automatically by application or **only on demand**.
For the second case, it is very important to keep a plugin light.

Plugin mechanism can be explained by this scheme:

Plugin category -> Plugin identifier -> Plugin (factory) -> Class

**Plugin category**:
A plugin category gather all extension providing **same feature** (for example, an applet in GUI).
This category is defined using **entry_point group**. 
It defines implicitly that all plugins in this category adhere to a common interface. 
See "Available entry points" to know matching between groups and interfaces.

**Plugin identifier**:
A name and a path to identify and allow to load real plugin.

**Plugin (factory)**:
A simple class that describe component features.
But, it is very important, that class must not import module or implement features.
To get class implementing features, a special method called load can be used.

**Class**
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
For that purpose, we create a Plugin called HelpWidgetPlugin in helper package:

.. code-block:: python
    :filename: helper/plugins/oalab/helpwidget.py

    class HelpWidgetPlugin(object):

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
    :linenos:
    :emphasize-lines: 5,7

    setup(
        # setup instructions

        entry_points = {
            'oalab.applet':                                                  # Plugin category
                [
                'HelpWidgetPlugin = helper.plugins.oalab:HelpWidgetPlugin'   # Plugin name = path to plugin (factory)
                ]
            }
        )


Create a plugin
---------------

As we just see, to add a plugin to the application you have to:

  - create the plugin (factory that point to the good class)
  - add it into entry_points in setup.py


Plugins on demand
-----------------

Some plugins are loaded automatically by application. For instance, it is the case for interfaces.
Some other plugins are loaded only if ask for it. For exemple, if user want to edit a curve, interface may
propose different editors and allow user to choose which one he prefers. In this case, only plugin chosen by
user is really loaded.


Finally, in some cases, developer might hard code name of a plugin he want to use to select the right one.
This case can be seen as a preset of plugin instead of standard plugin approach.

Available entry points
======================

  - :mod:`oalab.applet<openalea.oalab.plugins.applet>`: Graphical component displayed in main window.
  - :mod:`oalab.lab<openalea.oalab.plugins.lab>`: OpenAleaLab extensions
  - **oalab.qt_control**:
  - **oalab.notebook_control**:
  - **oalab.interface**:

.. automodule:: openalea.oalab.plugins.applet
    :undoc-members:
    :special-members:
    :show-inheritance:

.. automodule:: openalea.oalab.plugins.lab
    :undoc-members:
    :special-members:
    :show-inheritance:
