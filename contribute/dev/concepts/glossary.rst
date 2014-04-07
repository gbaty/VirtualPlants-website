
.. _glossary:

========
Glossary
========


Object
======


Software entity. An object may belong to different interfaces

Component
=========


  * An object providing Input/Output ports defined by interfaces
  * A component can be handled only by passing information through its ports
  * The information expected from a port must comply with the port interface
  * A component can be itself an output port (e.g. the type of the instance of a class is the class).

Port
====


A port of a component is a place where information is specified that allows to connect or use a component from external world.

N.B.: The notion of port has been introduced to limit the usage of objects to their declared interface and not to their implementation. Thus, a component is a black box object.

Information
===========



Information can be :
  * method name
  * object

Interface
=========

Name and specified information expected from a port.
Assumption: the name of information is specific to it specification

Note: here, methods are not defined from a given component but refer to an ontology

Service
=======

Software component that implements an application functionality.
Several components can provide this functionality.

Adapter
=======

Component that get an object T to follow an interface I.

Register
========

Map a T-interface to an I-interface and might name this relation.
Example of register based on dict : key: (T, I) -> object "adapt_T_I"

To adapt
========


Service transforming a T object (object that follow T interface) into an object following I interface.
(Also: supply a T object adapted to I interface)
"adapt" uses register to find corresponding adapter.

Note:
"Adhere to interface" or "Follow interface" ?