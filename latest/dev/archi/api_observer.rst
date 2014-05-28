===========================
Events (Observed/Listeners)
===========================

.. code-block:: python

    from openalea.core.observer import Observed, AbstractListener

    class Listener(AbstractListener):
        def notify(self, sender, event=None):
            print 'Listener says:', sender, event

    class Data(Observed):

        def __init__(self):
            super(Data, self).__init__()
            self.a = None

        def setA(self, a):
            self._a = a
            self.notify_listeners('achanged')

        a = property(fget=lambda self: self._a, fset=setA)

    listener = Listener()

    obj =  Data()
    obj.register_listener(listener)

    obj.a = 1

