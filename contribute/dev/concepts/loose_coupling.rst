==============================
Loose coupling between objects
==============================

To be modular, objects (widgets, data, models, ...) must be independents. That means to be able to create one object without creating numerous other objects each time.
Problems occur when objects affect or need information from other objects.
Link between object must be loose or indirect but also reliable.

For example, we want a widget able to run shell commands, like a terminal.

First naive approach, is to consider it as a simple class that does everything. It is easy but ...
Some people use computation clusters without graphical environnement and cannot run widgets (but need to run shell commands). 
Features developed to decorate output messages could be used also to decorate logs... and so on.

For these goals, we choose to split "command runner" in two parts.
One, really run shell command. The other displays outputs in a Widget.

These two parts have sense and are really independents: 
  - it is possible to run command without outputs (background mode). 
  - it is also possible to display simple text in the widget, comming from other origins.

This is only an example, nor the best, nor the only one.

The real question is : how to link these two parts while keeping its independents ?

.. seealso::

    For vocabulary, please have a look at :ref:`glossary`.
    For real use cases, see :ref:`coupling-use-cases`.

Easiest
=======

.. code-block:: python

   class Shell(object):
       def __init__(self, display):
           self.display = display

       def run(self, cmd):
           output = run_cmd(cmd)
           for new_line in output:
               self.display.appendText(new_line)


   widget = Widget()
   shell = Shell(widget)


Advantages:

  - Very easy

Drawbacks:

  - Tight coupling
  - Contract is not explicit
  - If widget API changes, application is broken
  - shell cannot work alone

Oberverd/Listeners
==================



.. code-block:: python

    class Shell(Observed):
        def run(cmd):
            output = run_cmd(cmd)
            for new_line in output:
                self.notifiy_listeners('new_output_line', new_line)

    class Widget(Listener):
        def notify(self, event, value):
            if event == 'new_output_line':
                self.appendText(value)

    listener = Widget()

    observed = Shell()
    observed.register_listener(listener)


Advantages:

  - This approach allow to run widget alone, shell alone or both together
  - Multiple listeners can be registered.

Drawbacks:

  - Need to register manually
  - Widget must implements listener interface
  - Shell must implements observed interface
  - Can be slow


Callbacks
=========

Some toolkits achieve communication between widgets using callbacks. 
A callback is a pointer to a function, 
so if you want a processing function to notify you about some event you pass a pointer to another function 
(the callback) to the processing function. 
The processing function then calls the callback when appropriate. 

.. code-block:: python


   class Shell(object):
       def __init__(self, display):
           self.display = display

       def run(self, cmd, callback):
           output = run_cmd(cmd)
           for new_line in output:
               callback(new_line)

   widget = Widget()

   shell = Shell()
   shell.run('ls', callback=widget.appendText)

Drawbacks :

  - Implicit contract
  - Strongly coupled to the processing function (the processing function must know which callback to call)
  - Complexifies program structure "Spaghetti code"

Qt Signals/Slots
================

As Qt documentation says, signals and slots are used for communication between objects. 
The signals and slots mechanism is a central feature of Qt and probably the part that differs most from the features provided by other frameworks.
In GUI programming, when we change one widget, 
we often want another widget to be notified. 
More generally, we want objects of any kind to be able to communicate with one another. 
A signal is emitted when a particular event occurs. 
A slot is a function that is called in response to a particular signal. 

The signals and slots mechanism is type safe: 
The signature of a signal must match the signature of the receiving slot. 
Signals and slots are loosely coupled: 
A class which emits a signal neither knows nor cares which slots receive the signal. 
Signals and slots can take any number of arguments of any type.
Slots can be used for receiving signals, but they are also normal member functions. 
Just as an object does not know if anything receives its signals, a slot does not know if it has any signals connected to it. 
This ensures that truly independent components can be created with Qt.


.. code-block:: python

    from PySide import Signal

    class Shell(QObject):
        newOutuputLineAvailable = Signal(str)

        def run(self, cmd):
            output = run_cmd(cmd)
            for new_line in output:
                self.newOutuputLineAvailable.emit(new_line)

    shell = Shell()
    widget = Widget()

    shell.newOutuputLineAvailable.connect(widget.appendText)
    # newOutuputLineAvailable is the signal with one str value
    # appendText is the slot with one str parameter


Drawbacks:

  - Qt dependency

Services
========

Here, idea is that every object can provide a service, ie, each object say that 
it is able to do something.  For example, a shell provide a service "run command", a
text editor provide services "edit text" and "display text", ...
Each object providing a service register itself in a catalog (or manager) of services.

When an object (a caller) needs to do something that it cannot do internally, it
asks catalog for a service. If catalog knows an object (a provider) able to provide that service, 
it returns it and so, caller can use it.

In Shell/Widget example, we could imagine Shell provides a service "run command" and
Widget calls for this service or the opposite, Widget provides a service "displays command outputs" and
shell uses it.

Sample code for the second case :

.. code-block:: python

    import services

    class ServiceDisplayCommandOutputs(object):
        def display_new_line(new_line):
            raise NotImplementedError

    class Widget(object):
        provides(ServiceDisplayCommandOutputs)

        def display_new_line(new_line):
            self.appendText(new_line)

    class Shell(object):
        def run(cmd):
            output = run_cmd(cmd)
            display = services.getService('ServiceDisplayCommandOutputs')
            if display :
                for new_line in output:
                    display.display_new_line(new_line)


Service Catalog
---------------

The important part of this approach is how to call a service ?
What criteria, how, where, ...


Backends
========




..
    Singleton
    Interface criteria
    DBUS avec wrapping dynamique en python ?
    Webservice
    
    dbus_kwrite = getDbusService('kwrite') => dbus(kwrite)
    dbus_kwrite.call('open', 'test.txt')
    
    dbus_kwrite = getService('vplant:KWrite')
    dbus_kwrite.call('open', 'test.txt')





Authors
=======

Parts of this documentation are copyright :
  - Qt-project : `Qt Signals and Slots Documentation <https://qt-project.org/doc/qt-5.0/qtcore/signalsandslots.html>`_

