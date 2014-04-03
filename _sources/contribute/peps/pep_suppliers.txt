==================
Contract Suppliers
==================

In applications, some classes have a central role and are used by numerous other 
classes.

.. code-block:: python
    :filename: interface.py

    class IHelper(Interface):
        def __init__(self):
            pass

        def seText(text):
            pass

IReader is an interface that describe a contract.

.. code-block:: python
    :filename: implementations.py

    class Helper1(object):
        def __init__(self):
            pass

        def setText(text):
            print text

    class Helper2(object):
        def __init__(self):
            self._log = []

        def setText(text):
            self._log.append(text)

        def log():
            return '\n'.join(self._log)

Reader supplies IReader contract.

.. code-block:: ini
    :filename: suppliers.ini

    [General]
    # Options common to all supplier managers
    user_path = ~/home/guillaume/plugins

    [General.backend]
    IHelper = 'Helper1'

    [General.backend.IReader]
    tags = PyQt4, PySide

    [TissueLab]
    user_path = ~/home/guillaume/plugins/tests/

    [TissueLab.backend]
    IHelper = "Helper2"

    [TissueLab.helper]
    user_path = ~/home/guillaume/plugins/tests/


>>> from openalea.vpltk.catalog.controller import Controller
>>> controller = Controller()

Two appraoches are available. First one uses methods to search suppliers. It
allows to pass numerous parameters to specify research.
The second one use attributes approach. Syntax is easier but less powerful.


Method approach
---------------

To get a supplier of IReader :
To get a facotry of IHelper suppliers (for example to create several instances) :
To get interface class :

>>> service = controller.supplier('IHelper')
>>> facotry = controller.factory('IHelper')
>>> interface = controller.interface('IHelper')

>>> suppliers = controller.suppliers('IHelper')
>>> factories = controller.factories('IHelper')

>>> service_xyz = controller.service(identifier='Xyz')

Advanced search
~~~~~~~~~~~~~~~

>>> service = controller.supplier('IHelper', tags=['PyQt4'])
>>> service = controller.supplier('IHelper', tags=['PyQt4'])

Direct approach
---------------

>>> service = controller.helper
>>> factory = controller.Helper
>>> interface = controller.IHelper

>>> suppliers = controller.helpers
>>> factories = controller.Helpers

>>> controller.tags = ['PyQt4']

>>> controller.IHelper.tags = ['PyQt4']
>>> service = controller.helper

>>> controller.IHelper.name = 'Xyz'
>>> service_xyz = controller.helper
