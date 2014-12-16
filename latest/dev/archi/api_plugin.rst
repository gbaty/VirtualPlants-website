
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

Plugins are used to extend application.
All plugins are managed in the same way but can do really different tasks and have very different behaviour.
For example an "image processing algorithm", a "qt applet" and an "OpenAleaLab extension"
are all plugins, defined and registered in the same way but with very different logics.
The logic and expected behaviour are described in an "interface" associated to a "category".

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


Plugins on demand
-----------------

Some plugins are loaded automatically by application. For instance, it is the case for interfaces.
Some other plugins are loaded only if ask for it. For exemple, if user want to edit a curve, interface may
propose different editors and allow user to choose which one he prefers. In this case, only plugin chosen by
user is really loaded.

For the second case, it is very important to keep a plugin light.

Plugin categories
=================

  - :mod:`Labs<openalea.core.plugin.lab>` [oalab.lab] New laboratory based on OpenAleaLab
  - :mod:`Applets<openalea.core.plugin.applet>` [oalab.applet] : Graphical component displayed in main window.
  - :ref:`Controls<label-plugin_control>` [oalab.qt_control, oalab.notebook_control]: Data editors and viewers
  - :mod:`Interfaces <openalea.core.plugin.interface>` [oalab.interface]: Description of data types


How to define a plugin
======================

.. automodule:: openalea.core.plugin
    :undoc-members:
    :special-members:
    :show-inheritance:

Advanced
========

See :ref:`label-api_pluginmanager`.

Developer tools
===============

OpenAleaLab provides command line utilities that help to create and debug plugins:

    - :option:`--list-plugins`
    - :option:`--debug-plugins`

