.. _label-user_model:

======
Models
======

Create New Model
================

To create a model, you can:

  - create new one from scratch
  - open an existing file

Create a new model:

.. image:: ../../images/new_model.png
    :height: 400px
    :align:   center

Open an existing model:

.. image:: ../../images/open_model.png
    :height: 400px
    :align:   center

Now you can edit it, run it, ...

Add Model to the current project
================================

Once you have your model, you must incorporate it inside your working project.
So, it will be accessible to the other models of your project.

.. image:: ../../images/add_model_to_proj.png
    :height: 400px
    :align:   center

Drag and Drop
=============

To access to a model, just drag object from panel "project" on the left in the GUI and drop it in an other model.

.. image:: ../../images/drag2.png
    :height: 400px
    :align:   center

.. image:: ../../images/drag3.png
    :height: 400px
    :align:   center

Using models inside other models
================================

Each model, whatever his *type* can be called inside whatever other model.

For instance, We define here an *L-system model* inside our project:

.. image:: ../../images/model_lpy.png
    :height: 400px
    :align:   center

Then we can call this model from a *python model*. For this, we realize a simple drag and drop from the project viewer (at left) to our current model.

.. image:: ../../images/model_py.png
    :height: 400px
    :align:   center

We can use it inside a *workflow model* too:

.. image:: ../../images/model_wf.png
    :height: 400px
    :align:   center


.. seealso::

    Developer's documentation :ref:`label-api_model`.
