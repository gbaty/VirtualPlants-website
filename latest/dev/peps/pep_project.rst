.. _label-pep_project:

============
PEP: Project
============

A *project* is the computational brick that encompasses the notion of "*modeling project*" for the user. A project gathers in a single logical place on the system all the data, scripts, results, configuration files that are needed or produced for a particular modeling aim.

A Project can use models or script from **Python**, **LPy**, **workflow**, **R**...


Problem
=======

During a modelling work, modeller will:
  * run **models** on some **data**
  * explore **parameter** sets
  * test hypotesis
  * explore **results**
  * try with other data
  * write associated **documentation**
  * ...

Because OpenAleaLab is done for **scientists**, everything need to be **reproducible**. If somebody want to re-use existing work, he need to **deploy** this work on an other computer easily, execute it and get the same results.

To resolve this, we need a **container of your work**. This container is a **project**.

Other important things to save are *provenance* (which is the version of projects/packages/scripts/models used in this project) and "metadata"(authors, citations...). It could also be usefull to have *documentation*, *test* and *example* in a project.

**There is a real need to use an object allowing to manipulate all this heterogeneous concepts and this in a reproducible way.** This object is called the project.

Existing Work
=============

You can find here, existing work done about `Project Template <http://www.projecttemplate.net/architecture.html>`_.

Examples of projects in other softwares:
  * `RStudio Project <http://www.rstudio.com/ide/docs/using/projects>`_
  * `Blender Data system <http://wiki.blender.org/index.php/Doc:2.6/Manual/Data_System/Data_System#Overview>`_
  * `VLab environment and oofs <http://pages.cpsc.ucalgary.ca/~pwp/bmv/vlab-for-linux/html-docs/environment.html>`_ [federl99]
  * IPython Notebook Document : a representation of all content visible in the web application, including inputs and outputs of the computations, explanatory text, mathematics, images, and rich media representations of objects.

Scientific Python projects:
  * `Wakari <http://wakari.io>`_ See its `Data analysis bundle <https://wakari.io/docs/sharing.html#bundles>`_ concept
  * `Canopy <http://docs.enthought.com/canopy/#>`_
  * `Spyder <https://pythonhosted.org/spyder/projectexplorer.html>`_

Scientific workflows system have also to capture the whole experiment and store it as Workflow:
  * `MyExperiment <http://www.myexperiment.org/>`_: To find use and share workflow and research objects
     - `SHIWA <https://www.shiwa-workflow.eu>`_
     - `WF4ever <http://www.wf4ever-project.org/>`_

`BagIt <http://en.wikipedia.org/wiki/BagIt>`_ and `pybagit <https://pypi.python.org/pypi/pybagit/>`_ pack a project and use a manifest and checksum (md5)

[federl99]: P. Federl and P. Prusinkiewicz: Virtual Laboratory: an Interactive Software Environment for Computer Graphics. In Proceedings of Computer Graphics International 1999, pp. 93−100.

Proposed solution
=================

We construct a **python object** which is a **container** and **manipulator** of other objects (models, data, ...) and which contain metadata too.
This object is the Project.

To summarize, main actions that we want to do on project are:
  * create
  * load
  * edit
  * run
  * store
  * document
  * share
  * explore
  * search

Manipulate a Project
####################

Create
------

Creation of new project can be done:
  * from scratch (new)
  * from existing directory
  * from existing project by copying it
  * from existing project by *deep-copying* it
  * from existing project by inheritance (at a specific version or dynamic)

At creation of project, OALab could ask to the user if he want to version his project (with Git for example).

**Wizard** of typical project could be propose to the user at creation.

Load
----

Loading a project can be done:
  * from local folder
  * from versionning system (github, subversion...)
  * from distant repository (web)

When a project is loaded, some actions are done:
  - launch new python process ?
  - run startup and import
  - push context iinside user namespace
  - load some objects (data, scripts, ...)
  - return a python object of type *Project*

At loading, by default, all files/scripts/models will be opened.
A setting could register recent opened files and restore only them.
The third solution should be to ask to user to select what he want to open. He could do that thanks to a **preview page** in which files should be listed (near to other informations).


**technicality:**

A project is composed of a range of very vast type of objects.. Each object type has his own way to save itself (pickling, text representation, binary, ...). So all objects can't be loaded by a unical way.

How to store *"how to load me?"* of each object?

We have list here some of possibilities:
  - to use only one way to save and load objects (Pickle for instance)
  - to use only one way by extension file (Python script: raw text, Python object: Pickle, PlantGL object: BGEOM, ...)
  - to store information in header of each file (intrusive)
  - to store information in configuration file of project
    * factory (name of the class which permit to load object)
    * interface (name of the *metatype* of object. The project choose how to load an object of this metatype.)

Pros and cons:
  - impose many work to adapt every objects.
  - can cause problem if encoding are differents but extensions are the same.
  - The 3rd point is already used in some cases in *real world* (ex: "# -*- coding: utf-8 -*-") but it imposes a specific structure in each files.
  - Finally, 4. seems to be the best way.

Save
----

A project can be saved at **intial step** or at **particular step** in saving intermediary values and cache.

You can save a project:
  * in local folder
  * in github

Format for saving project could be:
  * folders
  * zip
  * notebook
  * distant repository

**technicality:**

Problems are quite the same that for loading (cf. **Load**): how to know *"how to save me?"* of each object?

Edit
----

Re-use external files could be done by 2 ways:

  * copy externl file inside project (here we have duplicated code)
  * create a link to this files (here the project is not self-content)

Discover
--------

All projects will not be saved at the same place. But, user wants to list all available projects without knowing where they are. To abstract phisical location of projects into logical one, a system to discover projects is necessary.

Discovering the projects can be done:
  * locally (on disk) automatically (list of repositories)
  * locally (on disk) semi-automatically (repository)
  * locally (on disk) manually (file)
  * distantly (on web repository)

Explore
-------

After dicovering projects, user will want to know some informations about them (authors, files used, license, ...) without having to load all of them. This is exploration.

It will permit to interrogate projects. For example, we could search what are the projects using a particular dataset.

A good exploring system will permit to create **preview** of project with a name, a path, a description, authors, citations, the licence, an icon, list of data, list of models, ...

Document
--------

A good documentation is necessary! So, we are searching how to encourage users and developpers to write one.

An *advanced* documentation could create a **guide**. This guide could drive the user when he use an existing project (1st explore this parameters, 2nd run this model, 3rd explore this result, 4th re-try with this parameter, ...).

Moreover, we are searching how to create *tutorials* and "*e-learning*" thanks
to OALab.

Version
-------

A version control system remember the hystory of the files. So it permits to get an earlier version back again if necessary. Moreover, it makes things easier to manage if several person manipulates the same files.

So a project must have the possiblity to be versionned.

It exists various version control system like `Subversion <http://subversion.apache.org/>`_ or `Subversion <http://subversion.apache.org/>`_. Git is a distributed systems and so is more powerful than a client-server system like subversion.

We will focus our work on Git compatibility.

Communication with other project (or sub-project)
-------------------------------------------------

Sometimes, user will want to re-use a (whole or subpart of) project. For instance, he can want to re-use a dataset.
To do this, he will have various possibilities:

  * Make a clone/copy of used project in your project
  * Make a link to the project
  * Create a project which *inherit* from an existing project

Considering the new project B which is using existing project A.

Make a copy of A in B is useful if you want something as simple as possible. It can be the case for students for example. But, if a bug is fixed in A, B will not benefit of corrections.

Make a link from B to A at a version V can permit to do an Update of A at a version V'. We can do that thanks to the version manager (git, svn...). Thanks to the version manager, you can benefit of changes of A if you want but you can continue to work with an older version too.

When you are working in B, if you fix a bug in A (in your local copy) you can propagate correction in A (in the master/trunk) doing a Merge.

"Applify" project
#################

Export a project into *executable project* could be useful to avoid edition of project and only permit to run it. (No-read, no-write, only execute)

Export a project into *python module* could be useful to stay compatible with all python libraries.

API
###

API v1
------

This API has not been totally implemented.

.. code-block:: python

    from openalea.core.project.manager import ProjectManager

    pm = ProjectManager()
    # Discover projects availables without loading them
    pm.discover()
    print pm.projects

    # Add distant location to find projects
    pm.find_links.append("https://github.com/openalea/projects/")
    # Re-discover
    pm.discover()
    print pm.projects

    # Search inside list of projects
    print pm.search(name="*branch*bending*")
    print pm.search(model="test.lpy")
    print pm.search(data="walnut.mtg")
    print pm.search(model="test.lpy", data="walnut.mtg")
    list_of_projects_names_with_specific_author = pm.search(authors="*Godin*")

    # Get one name of project
    project_name = list_of_projects_names_with_specific_author[0]
    # Load this project
    project1 = pm.load(project_name)

    # Access to models
    # TODO: is a model a hardcoded information of a project?
    model = project1.model['my_python_model.py']
    # or:
    # model = project1['model']['my_python_model.py']
    # or:
    # model = project1.get(category='model',name='my_python_model.py')
    project1.rename('model', 'my_lpy_model.lpy', 'my_new_lpy.lpy')

    # Save project
    project1.save()

    # Close
    project2.close()

    # Create project
    project2 = pm.create("name_of_new_project", "path") # the path is optionnal

    # Manipulate project
    project2.authors = "Me and my collegue"
    project2.description = 'This project is an "Hello World" project'
    project2.add(category="model", name="hello.py", code="print('hello world')")
    project2.run(category="model", name="hello.py")



API v2
------

API v2 is totally redefined here and totally independent from api v1.


**Service**

from openalea.vpltk.service import SERVICE

Services:

    - project
    - active_project
    - new_project
    - new_data

.. code-block:: python

    project = active_project()
    project.add('startup', filename='test.py', content='from numpy import array')
    project.add('data', path='mydata.dat')

**ProjectManager**

ProjectManager role is to discover, search and load projects.
It is not the role of the projectmanager to manipulate project data.

.. code-block:: python


    from openalea.core.project import Project, ProjectManager

    pm = ProjectManager()
    # Discover projects availables without loading them
    pm.discover()

    # Add distant location to find projects
    pm.repositories.append("https://github.com/openalea/projects/")
    # Re-discover
    pm.discover()

    # List projects
    projects = pm.projects


Load project

.. code-block:: python

    from openalea.core.project import Project, ProjectManager

    pm = ProjectManager()

    # Lazy load this project
    # List only file names in project
    project = pm.get("sample", projectdir=None)

Create a new project object in default projectdir:

.. code-block:: python

    project = pm.new('test')


Manager can define an active project. To do that, you must load it.

.. code-block:: python

    pm.set_active(project) # equivalent to old pm.cproject = project

**Project**

Create project object

.. code-block:: python

    project = Project('test', projectdir='ssh://...')

If project yet exists, load filenames and metadata.


Get project data

.. code-block:: python

    # project.get(category, name, filename=None)

    # Example: get model or data ...

    # ... by name (notice that get support model name with our without extension)
    model = project.get('model', 'model_1')
    model = project.model['model_1.py']

    data = project.get('data', 'image_1.tiff')
    data = project.data['image_1.tiff']

Save/close project data

.. code-block:: python

    # Save project
    project.save()

    # Close
    project.close()


Create project from scratch

.. code-block:: python

    # Create project
    project = pm.create(name, projectdir=None) # the projectdir path is optionnal

    # Manipulate project metadata
    project.authors = "Me and my collegue"
    project.description = 'This project is an "Hello World" project'


Add item to project

.. code-block:: python

    # Manual : for developpers only
    from openalea.vpltk.model import ModelPython
    data = ModelPython(name, filepath=path)
    project.add(category, data)

    # Using service
    from openalea.oalab.service import DataFactory
    data_obj = DataFactory(**kwargs)
    new_data_obj = project.add(category, data_obj)


    # Convenience signature to add ...
    # data_obj = project.add(...)

    # You can create a new data with only a name.
    # You must specify datatype with filename for data, with paradigm for model and startups.

    project.add('data', filename=filename, content=content)
    project.add('data', path=filepath, [filename or name])
    project.add('data', name=name, datatype=datatype, content=content)


Remove item:

.. code-block:: python

    project.remove(category, name)


Rename item:

.. code-block:: python

    project.rename(category, old_name, new_name)


Start project

Start run files in startup and define namespace.

.. code-block:: python

    project.start()


Link data in project instead of copy it

.. code-block:: python

    data = project.add(category, data, link=True)
    # here data parent path can differ from project data path




API v2.1
--------

Services

    - import_data_files([dir1, dir2])

Add tag managment and search features

.. code-block:: python

    from openalea.core.project import Project, ProjectManager
    pm = ProjectManager()

    # Search projects
    projects = pm.search(name="*branch*bending*")

    tags = pm.tags
    projects = pm.search(tags=['tutorial', 'beginner'])

Implementation
##############

TODO: Define a set of possible implementation we are or will working on.

  * Local project : manage projects on disk
  * Distributed project : access to project based on a distributed index (see `PyPI <https://pypi.python.org/pypi>`_)

The ProjectManager manipulate Project. In the application OpenAleaLab, this is the Session which manipulate ProjectManager (and directly Project?).


