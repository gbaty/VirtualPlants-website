=====================
Development documents
=====================

RoadMap
=======
    - Project
    - Viewer
    - 3D World
    - Application: archi + GUI
    - Service Oriented Architecture
    - Manager
    - Controls / GUI
    - Models/ Paradigms
    - Config / Session
    - Interaction


Concepts
========

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
    - Finish applet migration

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

Resp.: G. Baty and J. Costes

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


