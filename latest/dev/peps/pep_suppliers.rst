=======================
PEP: Contract Suppliers
=======================

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


>>> from openalea.vpltk.catalog.catalog import Catalog
>>> catalog = Catalog()

Two appraoches are available. First one uses methods to search suppliers. It
allows to pass numerous parameters to specify research.
The second one use attributes approach. Syntax is easier but less powerful.


Method approach
---------------

To get a supplier of IReader :
To get a facotry of IHelper suppliers (for example to create several instances) :
To get interface class :

.. doctest ::
    :options: +SKIP


    >>> service = catalog.supplier('IHelper')
    >>> facotry = catalog.factory('IHelper')
    >>> interface = catalog.interface('IHelper')
    
    >>> suppliers = catalog.suppliers('IHelper')
    >>> factories = catalog.factories('IHelper')
    
    >>> service_xyz = catalog.service(identifier='Xyz')

Advanced search
~~~~~~~~~~~~~~~

.. doctest ::
    :options: +SKIP

    >>> service = catalog.supplier('IHelper', tags=['PyQt4'])
    >>> service = catalog.supplier('IHelper', tags=['PyQt4'])

Direct approach
---------------

.. doctest ::
    :options: +SKIP

    >>> service = catalog.helper
    >>> factory = catalog.Helper
    >>> interface = catalog.IHelper
    
    >>> suppliers = catalog.helpers
    >>> factories = catalog.Helpers
    
    >>> catalog.tags = ['PyQt4']
    
    >>> catalog.IHelper.tags = ['PyQt4']
    >>> service = catalog.helper
    
    >>> catalog.IHelper.name = 'Xyz'
    >>> service_xyz = catalog.helper

This approach maybe be attractive but is too implicit and so too dangerous.

.. warning::

    This approach has been rejected

