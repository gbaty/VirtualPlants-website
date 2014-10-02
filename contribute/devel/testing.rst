=====================
Test your development
=====================

Run Unit Tests
##############


Test GUI
########

Simple checklist to test manually OpenAleaLab GUI

Applets
=======

Control
-------
    Two controls with same name
    New control
    Remove control


Drag and drop
=============

  * :checkbox:`VisualeaPackage` (X3 tabs)
     * :checkbox:`composite node -> Dataflow`
     * :checkbox:`composite node -> Shell`
     * :checkbox:`node -> Dataflow`
     * :checkbox:`node -> Shell`
     * :checkbox:`Node I/O OK`

  * :checkbox:`Control`
     * :checkbox:`Control -> Dataflow`
     * :checkbox:`Control -> Shell`

  * :checkbox:`Project`
     * :checkbox:`Data -> Dataflow`
     * :checkbox:`Data -> Shell`
     * :checkbox:`Model -> Dataflow`
     * :checkbox:`Model -> Shell`

Click (C) or Double click (DblC)
================================
Double click is generally used to open data

  * :checkbox:`FileBrowser`
     * :checkbox:`(DblC) on a file` open it (at least in text editor)
     * :checkbox:`(DblC) on a directory` does nothing

  * :checkbox:`VisualeaPkg`
     * :checkbox:`(DblC) on a composite node` open a dialog to define name, add it to current project and open it in editor
     * :checkbox:`(DblC) on a node` open a dialog to change default inputs

  * :checkbox:`Project`
     * :checkbox:`(DblC) on a data CATEGORY` open an import data dialog
     * :checkbox:`(DblC) on a data` open it in a compatible editor (can be external or internal)
     * :checkbox:`(DblC) on a model` open it in internal editor
     * :checkbox:`(DblC) on a startup` open it in internal editor
     * :checkbox:`(DblC) on a lib` open it in internal editor

Dependencies
============

Best way to test dependency issues is to uninstall completly package.

Uninstall all third party extension (tissuelab, ...)

IPython-qtconsole
-----------------

oalab must launch and shell must be replaced by simple shell

LPy
---
oalab must launch but:
    - LPy model is not available
    - 3D Viewer IS AVAILABE

PlantGL/LPy
-----------

oalab must launch but:
    - LPy model is NOT AVAILABLE
    - 3D Viewer is NOT AVAILABLE

PyQt
----
    all test in openalea/core work
    notebook work

visualea/grapheditor
--------------------
    New control works but has 0 interfaces available (show information dialog or empty list)
