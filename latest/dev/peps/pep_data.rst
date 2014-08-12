.. _label-pep_data:

=========
PEP: Data
=========

.. code-block:: text

    Data
      -> Model 
            -> PythonModel
            -> LPyModel
            -> RModel
            -> ...
      -> BinaryData
      -> TextData

A model is a data with optional inputs and outputs and that can be run.

.. code-block:: python

    d = data(path)
    data('img1.tiff')
    -> Data('img1', 'img1.tiff', datatype='tiff')

    d = Data(name, path, datatype)
    d = Data('img1', 'ssh://...', datatype='tiff')
    