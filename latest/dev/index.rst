=====================
Development documents
=====================

RoadMap
=======
    - Project
    - Application
    - Service Oriented Architecture
    - Manager
    - Controls / GUI
    - Viewer
    - 3D World
    - Models/ Paradigms


Concepts
========

Project
-------

Resp: J. Coste

Due Date: 18/04/2014

Objective: Project in OpenAleaLab

Issue: None

Tasks:
++++++
    - Project Documentation 
        + Get OpenAlea PEP
        + Move vpltk doc here
        + Tutorial / Screenshots
    - GUI integration
        # view 
        # edit
        # create
    - Test on real project

What's Next: 
++++++++++++
    - refactoring
        * define the role of a project
        * abstract project vs concrete ones
            + Project: Python project. Might be used in any scientific software.
            + LabProject(Project), 
            + Independant Widget from the Application 
        * Lazy load: load in memory only what is edited.
    - features
        * vcs inetgration (svn, git) (P1)
        * different storage/representation strategies: directory, hdf5, bup, gzip, wheels, eggs, ftp
        * Import using import hooks (PEP-0302)


Application
-----------


