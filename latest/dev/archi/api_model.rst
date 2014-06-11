.. _label-model:

======
Models
======

.. automodule:: openalea.oalab.model
    :members:
    :undoc-members:

Drag and Drop
=============

To access to a model, just drag object from panel "project" on the left in the GUI and drop it in an other model.

.. image:: ../../../images/drag2.png
    :height: 200px
    :align:   center

.. image:: ../../../images/drag3.png
    :height: 200px
    :align:   center

Using models inside other models
================================

Each model, whatever his *type* can be called inside whatever other model.

For instance, We define here an *L-system model* inside our project:

.. image:: ../../../images/model_lpy.png
    :height: 400px
    :align:   center

Then we can call this model from a *python model*. For this, we realize a simple drag and drop from the project viewer (at left) to our current model.

.. image:: ../../../images/model_py.png
    :height: 400px
    :align:   center

We can use it inside a *workflow model* too:

.. image:: ../../../images/model_wf.png
    :height: 400px
    :align:   center

Models API
==========

.. automodule:: openalea.oalab.model.model
    :members:
    :undoc-members:

.. automodule:: openalea.oalab.model.python
    :members:
    :undoc-members:



