
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
                'HelpWidget = helper.plugins.oalab:HelpWidget'
            }
        )

To add the plugin in your lab (here in *minilab*), don't forhet to add it in the main file of the lab:

.. code-block:: python
    :filename: oalab/plugins/labs/minilab.py

    class MiniLab(object):
        name = 'mini'
        applets = [ 'HelpWidget']

Create a plugin
---------------

As we just see, to add a plugin to the application you have to:

  - create the plugin (factory that point to the good class)
  - add it into entry_points in setup.py
  - add it in lab


Available entry points
======================

  - **oalab.applet** [:class:`~openalea.oalab.interfaces.i_applet.IApplet`]: Graphical component displayed in main window.


Known issues
============

actions
-------

    - method used by applet to provide action is not well described and not enough generic.

app/mainwin/session
-------------------

    - role of session, application and app not clear

ControlPanel
------------

    - project_manager is currently embedded in MainWindow (should be linked to session or app)

VPLScene
--------

    - we don't have viewer which permit to quickly check what is the scene

    - VPLScene has dependency to QtCore and QtGui (not expected)
    - Qt is used only to send a "SceneChanged" signal (Qt dependency not justified for only on signal)
    - Due to Qt dependency, scene is currently embeded in MainWindow.
    - As Scene is not graphical, it should be linked to session or application
    - -> Derivating VPLScene from Observed would be enouth.

.. warning::

    FIXED: Scene using Observed/Listeners instead of Qt Signal&Slots works.
    There is a bug. Is it a new one ?

    .. code-block:: text

        No handlers could be found for logger "openalea.core.pkgmanager"
        Traceback (most recent call last):
          ...
          File "/usr/local/Cellar/python/2.7.6_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/pickle.py", line 322, in save
            raise PicklingError("%s must return string or tuple" % reduce)
        pickle.PicklingError: <built-in method __reduce_ex__ of VPLScene object at 0x7fa15a5d6ed0> must return string or tuple


ProjectManagerWidget
--------------------

    - dependency to AppletContainer (paradigm container). 
    - ProjectManagerWidget must work without controller.applet_container

ControlPanel
------------

    - hard links with project, colormap and control
    - no abstraction for controls

.. code-block:: python

    class ControlPanel
        def update(self)
            colors = self.colormap_editor.getTurtle().getColorList()
            self.session.project.control["color map"] = colors
        
            objects = self.geometry_editor.getObjects()
            for (manager, obj) in objects:
                if obj != list():
                    obj, name = geometry_2_piklable_geometry(manager, obj)
                    self.session.project.control[unicode(name)] = obj
        
            scalars = self.scalars_editor.getScalars()
            for scalar in scalars:
                self.session.project.control[unicode(scalar.name)] = scalar



Menu
----

    - tab seems to be unordered
    - name of big buttons have disappear
    - add icon to group
    - add a classical menu

Logger
------

    - doesn't work anymore (neither in oalab nor in visualea)

Projects Manager
----------------

    - we don't have a widget that list all available projects (cf package treeview for instance)
    - We can't edit project (metadata, startup, ...)

Package Manager
---------------

    - use 3 tabs for the moment and so, take many place. TODO: centralize them in only one tab (a tab of 3 sub-tabs).
    - hide it if we don't use workflow?

Shortcuts
---------

    - shortcuts doesn't work anymore.

Store
-----

    - is too big to appear by default in the application

Config
------

    - create a user configuration to store preferences

Status Bar
----------

    - add a status bar in mainwindow

ResultPanel
------------

    - TODO: add a space to store and visualize results