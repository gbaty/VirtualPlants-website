================
Model Management
================

Simulator
=========

The simulator manage execution of models and communication between the World and the models.

It is a workflow where each node is a model. The creation of this workflow is implicit but can be edited by hand too.
When user make a *run* on a model, application capture it and create a node in the workflow.
Edges are created between model1 and model2 when a model2 take an input from the world that has been created by the model1.

Model (Knowledge Source)
========================

Definition
----------

A Model is a modelling code that can be implemented from various paradigms (Python, LSystem, Workflow...)

A model has:
  - inputs that can come from the world
  - outputs that can be put in the world
  - a desirable *time step* and a real time step
  - an internal state
  - some specific methods:
        - *run* to execute the model
        - *reset* to come back to initial internal state

API
---

.. code-block:: python

    class Model(object):
        default_name = ""
        default_file_name = ""
        pattern = ""
        extension = ""
        icon = ""

        def __init__(self, name, code="", inputs=[], outputs=[]):
            """
            :param name: name of the model (name of the file?)
            :param code: code of the model, can be a string or an other object
            :param inputs: list of identifier of inputs that come from outside model (from world for example)
            :param outputs: list of objects to return outside model (to world for example)
            """
            self.name = name
            self.code = code
            self.inputs = inputs
            self.outputs = outputs

        def repr_code(self):
            """
            :return: a string representation of model to save it on disk
            """
            pass

        def run(self, interpreter):
            """
            execute model
            """
            pass

        def reset(self, interpreter):
            """
            go back to initial step
            """
            pass

        def step(self, interpreter):
            """
            execute only one step of the model
            """
            pass

        def stop(self, interpreter):
            """
            stop execution
            """
            pass

        def animate(self, interpreter):
            """
            run model step by step
            """
            pass


World
=====

Definition
----------

The world is an object container. Each model can put objects in the world or use objects from the world.
This communication object store object and what model created it.

API
---

.. code-block:: python

    class World(OrderedDict):
        """
        Contain objects of the world.
        """
        pass


    class WorldObject(object):
        """
        Object of the world.
        """
        def __init__(self, obj, model_id, output_id):
            """
            :param obj: object to store
            :param model_id: identifier of the model used to create this object
            :param output_id: identifier of output of the model used to create this object
            :param in_scene: set to True if it is a part of the scene (so it is viewable)
            """
            self.obj = obj
            self.model_id = model_id
            self.output_id = output_id
