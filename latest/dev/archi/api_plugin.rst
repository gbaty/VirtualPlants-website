
.. _label-extending_oalab:

=======
Plugins
=======

Idea behind plugins is to 
  - extend application with your code or third-party code without nor reading nor modifying application'code.
  - install only parts that are useful for your usage
  - earn time at launch and use by loading plugin only once necessary
  - for developers, permit other to extend your work easily

Overview
========

This document explains how to concretely extend OpenAleaLab.
For theoretical aspects and future plans, see :ref:`label-pep_plugins`.

Plugin mechanism can be explained by this scheme:

:menuselection:`Plugin category --> Plugin identifier --> Plugin (factory) --> Class`

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

.. note::

    In particular case of graphical components, a plugin generally defines an adapter
    able to connect a graphical component (a widget for example) to a specific
    application. 



Create a plugin
---------------

To add a plugin to the application you have to:

  - create the plugin (factory that point to the right class)
  - add it into right :term:`entry_point category` in setup.py


Plugins on demand
-----------------

Some plugins are loaded automatically by application. For instance, it is the case for interfaces.
Some other plugins are loaded only if ask for it. For exemple, if user want to edit a curve, interface may
propose different editors and allow user to choose which one he prefers. In this case, only plugin chosen by
user is really loaded.

For the second case, it is very important to keep a plugin light.

Plugin categories
=================

  - :mod:`Lab Extensions<openalea.oalab.plugins.lab>` [oalab.lab]: New laboratory based on OpenAleaLab
  - :mod:`Applets<openalea.oalab.plugins.applet>` [oalab.applet] : Graphical component displayed in main window.
  - :mod:`Controls <openalea.oalab.plugins.control>` [oalab.qt_control, oalab.notebook_control]: Data editors and viewers
  - :mod:`Interfaces <openalea.oalab.plugins.interface>` [oalab.interface]: Description of data types


Developer tools
===============

OpenAleaLab provides command line utilities that help to create and debug plugins:

    - :option:`--list-plugins`
    - :option:`--debug-plugins`

