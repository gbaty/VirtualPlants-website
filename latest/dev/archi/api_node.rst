=====
Nodes
=====

Node Declaration
================

To simplify node declaration, other syntax can be used.

Factory approach
----------------

Inputs and outputs are declared in the factory.


.. testcode::

    from openalea.core import Factory
    f = Factory(name = 'mynode',
                inputs = (dict(name="x", interface=None, value=0.),),
                outputs = (dict(name="y", interface=None),), 
                nodemodule = 'mymodule',
                nodeclass = 'myclass')


Real funct
# mymodule.py

.. testcode::

    def myclass(a, b):
        return a + b

Metaclass approach
------------------

.. code-block:: python

    class MetaNode(object):
        pass

    class MyNode(object):

        __metaclass__ = MetaNode
        __inputs__ = [ Port(name="x", interface=None, value=0.) ]
        __outputs__ = [ Port(name="y", interface=None) ]
 
        def __call__(self, inputs):
            return inputs


