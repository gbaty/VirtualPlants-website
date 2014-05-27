=====================
Development documents
=====================

.. todo::

    Insert visual roadmap (JC) 


RoadMap
=======
    - Project
    - Viewer
    - World
    - Simulator (Meta-model)
    - Models/ Paradigms
    - Application: 
        - archi
        - GUI
    - Service Oriented Architecture (SOA)
    - Manager (Package, Project, ...)
    - Controls / GUI
    - Config / Session
    - Interaction
        - edition of objects
        - relationships between the different models

For tasks and deadlines, please have a look to Ganttproject file ":download:`tasks.gan`".
This file can be opened with `Ganttproject <http://www.ganttproject.biz>`_


Concepts
========

Model
------

========== ==========
Summary
========== ==========
Resp:      J. Coste
Due Date:  23/05/2014
Objective: Access model in other models
Issue:     None
========== ==========

Tasks:
++++++
    - Defining the :ref:`Models <label-model>`
        + generic interface (API)
            * run, step, init, ... (*)
            * get_documentation, ... (*)
        + implementation for all paradigms
            * Python (*)
            * VisuAlea (*)
            * LPy
            * R
    - Drag and drop a model in other models
        + Python (*)
        + Visualea
            * Create *model node* (*) (TODO: connect reset, step, ...)
            * Open/Edit the widget of a node :
                - **Open** a widget in the widget manager (To define: GadgetManager?)
                - **Edit** a model in the ModelEditors
            + save (model) node
        + LPy:
            - I/O :
                * AxialTree vs MTG
                * Sub-context
                * LPy / World (AxialTree Interpretation)
        + R
    - Project
        + store models instead of files (else we create new models and we doesn't keep the internal state model!) (*)
        + call models without extension (*model1* and not *model1.py*) (*)
    - Standardize
        + use the same classes in OpenAleaLab and in Visualea:
            * ex: NodeFactory / ModelFactory, InputObject(oalab) / InputObject(visualea), ...

**Progress:**
    - API and implementation is done.
    - Drag and drop into python is done.
    - Drag and drop into Visualea is in progress.
    - Everything with (*) is done

What's Next:
++++++++++++
    - Do we want to call models that are in an other project?

Project
-------

========== ==========
Summary
========== ==========
Resp:      J. Coste
Due Date:  18/04/2014
Objective: Project in OpenAleaLab
Issue:     None
========== ==========

Tasks:
++++++

- Project Documentation
    + Get :ref:`OpenAlea PEP project <label-pep_project>`
    + Move vpltk project doc :ref:`here <label-api_project>`
    + Tutorial / :ref:`Screenshot <label-project_screenshot>`
- GUI integration
    #. view
    #. edit
    #. create
- Test on real project


**Progress:**
    Almost done, test on real projects


What's Next:
++++++++++++

    - refactoring
        + define the role of a project
        + abstract project vs concrete ones
            * Project: Python project. Might be used in any scientific software.
            * LabProject(Project), 
            * Independant Widget from the Application 
        + Lazy load: load in memory only what is edited.
    - features
        + vcs integration (svn, git) (P1)
        + different storage/representation strategies: directory, hdf5, bup, gzip, wheels, eggs, ftp
        + Import using import hooks (PEP-0302)




Application GUI
---------------

========== ==========
Summary
========== ==========
Resp:      J. Coste, G. Baty
Due Date:  28-30/04/2014
Objective: Graphical structure + concepts
Issue:     None
========== ==========

Tasks:
++++++
    #. Grouping the widgets in a rational way
    #. Interaction between components (Drag/Drop)

**Progress:**
    #. First try: define named area (inputs, outputs) than can be used to gather widgets. See mainwindow2.MainWindow


Application archi
-----------------

========== ==========
Summary
========== ==========
Resp:      G. Baty
Due Date:  28-30/04/2014
Objective: Graphical structure + concepts
Issue:     None
========== ==========

Tasks:
++++++
    - Naming concepts
    - one concept / one class
    - the application define its components
    - the components extend the application

**Progress:**

    - A new MainWindow class (mainwindow2.MainWindow) has been defined.
      This class do not have widget imports except for shell and menu.
      1/3 of widget has been integrated. Some blocking issues were identified.
      See :ref:`label-extending_oalab`.
    - New MainWindow uses entry_points to find plugins and add it

**TODO**
    - Fix blocking issues.

Service Oriented Architecture
-----------------------------

========== ==========
Summary
========== ==========
Resp:      C. Pradal
Due Date:  15/05/2014
Objective: Loose coupling and delegation
Issue:     None
========== ==========

Tasks:
++++++
    - Definition of concepts: component, interface, service, adapters
    - Service: 
        + abstract class (interface)
        + dump/load object (project)
        + 3D display
        + Help 
    - find Plugin


Viewer
------

========== ==========
Summary
========== ==========
Resp:      G. Baty
Due Date:  15/05/2014
Objective: 3D Viewer component
Issue:     None
========== ==========

Tasks:
++++++
    - Defining the Viewer component
        + interface (API)
        + code
        + review
    - Integration in oalab
        + compatibility with existing viewer
    - Documentation

What's Next:
++++++++++++
    - Mixing py_vtk & PyQGLViewer in a same widget
    - Principles of the interaction with object of the world
    - Select an object
    - Manage layers
    - Manage transparency
    - Modal Interaction
    - Introspection / Info on objects
    - Edition mechanisms
    - Camera path interpolation
    - PlantGL Viewer backward compatibility
    - WebGL viewer


Release OpenAleaLab
-------------------

Resp.: G. Baty and J. Coste

Obj: PlantLab & TissueLab

    - Project
    - Application Architecture (concepts)
    - Application GUI
    - world
    - Viewer
    - Paradigms (API, edit, run)
    - shell


Milestones
==========

30th April
----------
 
OpenAleaLab alpha
    - project
        + create
        + edit (metadata, add elements)
        + view
    - shell / exec 
    - paradigms
    - Application

30th May
--------

Concepts and their relationships
    - Architecture
        + Interface
        + components
        + Service: Manager/Registration
    - Controls
    - Component GUI
    - Visualea / OALab
    - LPy / OALab
    - Drag/Drop
    - World / Viewer


15th June
---------

OpenAleaLab replaces VisuAlea and L-Py
    - Tutorials
    - Test / Debug
    - Documentation / Installation





Known issues : To FIX
=====================

Project treeview
----------------
break link between project treeview and applet container.

actions
-------

    - method used by applet to provide action is not well described and not enough generic.
    - Action object: (i) interface, (ii) application and code refactoring

app/mainwin/session
-------------------

    - role of session, application and app not clear
    - Define an new object application vs mainwin which inherit of SignalSlot
    - Define the interface of the session. (move code from actual project manager to session).

ControlPanel
------------

    - project_manager is currently embedded in MainWindow (should be linked to session or app)
    - Rename controlPanel and project_manager to explicit and well defined names.

VPLScene
--------

    - rename to world?

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



-Menu
-----

    - add icon to group
    - fix titlebar size for tab widgets (too small on MacOSX) 
      by setting minimal size to QWidget or by detecting platform (search setTitleBarWidget)

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
-----------

    - TODO: add a space to store and visualize results

Plugins
-------

Most of them are independent (they can work alone).
For a minimal application to works with project, just set *applets = ['EditorManager', 'ProjectManager']* in the lab.

But there is still some problems:

    - EditorManager and ProjectManager are dependents of each others (TO FIX)
    - File management must move into EditorManager (TODO)
    - ProjectWidget depends of EditorManager (TO FIX)
    - with only EditorManager, visualea doesn't work: he need packagemanager
