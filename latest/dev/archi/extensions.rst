=====================================
Extensible and pluggable applications
=====================================

As written in `Envisage documentation <http://docs.enthought.com/envisage/envisage_core_documentation>`_, 
the applications we write need to change over time. 
We fix bugs, and we add, modify, and remove features. 
In other words, we spend most of our time either fixing or extending applications.

Sometimes we extend our applications by changing the actual code, 
sometimes we have other ad hoc extension mechanisms in place – a text file here, 
a directory of scripts there. 
As applications grow, they often end up with numerous places where they can be extended, 
but with a different extension mechanism at each one. 
This makes it hard for developers who want to extend the application to know :

    - where they can add extensions
    - how to add them


Useful links
============

Some implementations
--------------------

  * `Trac component architecture <http://trac.edgewall.org/wiki/TracDev/ComponentArchitecture>`_
  * `Yapsy (yet another plugin system) <http://packages.python.org/Yapsy>`_  (example of plugin framework. Several links inside)
  * `Envisage <http://docs.enthought.com/envisage/envisage_core_documentation>`_
  * `PyUtilib <https://software.sandia.gov/trac/pyutilib>`_, `Architecture Doc (PDF) <https://software.sandia.gov/trac/pyutilib/export/3245/pyutilib.component.doc/trunk/doc/plugin/pca.pdf>`_
  * `Another simple framework <http://martyalchin.com/2008/jan/10/simple-plugin-framework>`_


Other documentation
-------------------

  * `Fundamental concept of plugin infrastucture <http://eli.thegreenplace.net/2012/08/07/fundamental-concepts-of-plugin-infrastructures>`_
  * `Python plugin framework <http://wehart.blogspot.fr/2009/01/python-plugin-frameworks.html>`_

PkgResources / entry points
===========================

  * `pkg_resources official website <http://peak.telecommunity.com/DevCenter/PkgResources>`_

ETS Envisage / extension points
===============================

  * `Envisage official website <http://docs.enthought.com/envisage/envisage_core_documentation>`_, 

OpenAlea components
===================

See `How to declare OpenAlea components <http://openalea.gforge.inria.fr/dokuwiki/doku.php?id=documentation:component:how_to_declare_logical_components>`_.

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
We want to add HelpWidget in the MainWindo and allow communication between both classes.
For that purpose, we create a Plugin called OALabHelpWidget in helper package:

.. code-block:: python
    :filename: helper/plugins/oalab/helpwidget.py

    class OALabHelpWidget(object):

        data = {
            'name' : 'HelpWidget',
            'oalab': {
                'extensions': ['plantlab', 'tissuelab'],
                },
        }

        def instantiate(self, oalab):
            # Load and instantiate graphical component that actually provide feature
            from helper.widget import HelpWidget
            widget = HelpWidget()

            # Link OpenAleaLab and HelpWidget
            # 1. Add it to the right area.
            oalab.add_widget_to_info_area(widget)

            for action in widget.actions():
                # Add actions in PanedMenu
                oalab.menu.addBtn(*action)
                # Add actions in standard menu
                oalab.add_action(...)

It is very important to notice that adding widget in the right place is done by
the plugin, not the application. Application does almost nothing, it is just
a container of widgets. Real application intelligence is delegated to Plugins 
(placing and linking components) and components (doing real treatments).

Finally, we register this plugin in setup.py of package helper.

.. code-block:: python
    :filename: helper/setup.py

    setup(
        # setup instructions
    
        entry_points = { 
            'oalab.widgets': [
                'helper = helper.plugins.oalab:OALabHelpWidget'
            }


We show here some parts of OpenAleaLab application used by OALabHelpWidget instantiation.

.. code-block:: python
    :filename: oalab/gui/mainwindow.py

    class MainWindow(QtGui.QMainWindow):

        def __init__(self):
            # instructions

            self.menu = PanedMenu()

            # Search all widgets compatible with current Qt binding
            for plugin_factory in search('oalab.widgets', backend=QT_API):
                plugin = plugin_factory.load()
                plugin.instantiate(self)



        def add_widget_to_tool_area(widget):
            """
            Adds widget to tool area (left shelf)
            """

        def add_widget_to_info_area(widget):
            """
            Adds widget to info area (right shelf)
            """

        def add_actions(menu_name, actions):
            """
            add actions into menu with name "menu_name". 
            menu_name examples Edit, File, Help.
            If menu do not exists, this functions create it


DESCRIPTION

Variable or variables describing plugin.
**work in progress**: Potential useful information:
    - classical meta info (name, icon, desc, authors, license, ...)
    - python/qt compatibility (does-it work with PyQt4 ? PySide ? Qt 5)
    - python compatibility (python 2 ? python 3 ?)
    - interfaces implemented by this widget
    - dependencies required


These information are used to filter search results. For example:

.. code-block:: python

    # Return all widgets
    results = search('oalab.widgets')

    # Example of filter in basic query language

    # Return all widget written by John Doe
    results = search('oalab.widgets', author='John Doe')

Depending of data description structure, we can imagine advanced query languages like
SQL, SPARQL, or based on existing libraries 


Possible approaches for plugin description:

Flat variables
--------------

.. code-block:: python

    name = 'HelpWidget'
    authors = ['John Doe']

JSON
----

.. code-block:: python

    data = {
        'name' :
        'oalab': {
            'extensions': ['plantlab', 'tissuelab'],
            },
    }

Semantic web
------------

.. code-block:: python

    data = """
    @prefix dc: <http://purl.org/dc/elements/1.1/>.
    @prefix oa: <http://openalealab.org>

    oa:helpwidget
        dc:title "HelpWidget";
        dc:publisher "OpenAleaLab" 
        .
    """

