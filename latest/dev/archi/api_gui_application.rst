============================
Builtin Graphical Components
============================

Paned menus
===========

Paned menus, also called "ribbon bars" are alternatives to classical Tool bars.
It allows to emphasize some action with larger buttons.
To create a Paned menu, you just need to create a
:class:`~openalea.oalab.gui.menu.PanedMenu` and add :class:`~QtGui.QAction` with
:meth:`~openalea.oalab.gui.menu.PanedMenu.addBtnByAction` method :

.. automodule:: openalea.oalab.gui.menu.PanedMenu

PanedMenu components :

.. image:: images/api_ribbon_bar.png
    :width: 600px


Main classes and methods
========================

.. autoclass:: openalea.oalab.gui.menu.PanedMenu
    :members: addBtnByAction

