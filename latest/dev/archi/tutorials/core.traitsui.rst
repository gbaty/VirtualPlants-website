=============================
Generate widget with traitsui
=============================

.. code-block:: python

    from openalea.core import Node, Factory, IBool, IInt, IStr
    from openalea.core.node import FuncNode
    from openalea.core.traitsui import View, Group, Item
    from openalea.visualea.node_widget import DefaultNodeWidget

    view = View(
        Group('Custom Control',
            Group('AB Group', Item('a'), Item('b'), layout="-"),
            Group('C Group', Item('c')),
            layout='|'),
        )

    inputs = [
        {'interface': IBool, 'name': 'a', 'value': False, 'desc': ''},
        {'interface': IInt, 'name': 'b', 'value': 0, 'desc': ''},
        {'interface': IStr, 'name': 'c', 'value': '', 'desc': ''}
        ]

    node_factory = Factory(name='toto',
                    authors=' (wralea authors)',
                    description='',
                    category='Unclassified',
                    nodemodule='lib',
                    nodeclass='f',
                    inputs=inputs,
                    view=view,
                    )

    if __name__ == '__main__':
        from openalea.vpltk.qt import QtGui
        app = QtGui.QApplication([])
        node = node_factory.instantiate()
        w = DefaultNodeWidget(node, parent=None)
        w.show()
        app.exec_()
