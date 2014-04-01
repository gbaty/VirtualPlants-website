
Plotting with Matplotlib
========================

IPython works with the `Matplotlib <http://matplotlib.org/>`__ plotting
library, which integrates Matplotlib with IPython's display system and
event loop handling.

matplotlib mode
---------------

To make plots using Matplotlib, you must first enable IPython's
matplotlib mode.

To do this, run the ``%matplotlib`` magic command to enable plotting in
the current Notebook.

This magic takes an optional argument that specifies which Matplotlib
backend should be used. Most of the time, in the Notebook, you will want
to use the ``inline`` backend, which will embed plots inside the
Notebook:

.. code:: python

    %matplotlib inline
You can also use Matplotlib GUI backends in the Notebook, such as the Qt
backend (``%matplotlib qt``). This will use Matplotlib's interactive Qt
UI in a floating window to the side of your browser. Of course, this
only works if your browser is running on the same system as the Notebook
Server. You can always call the ``display`` function to paste figures
into the Notebook document.

Making a simple plot
--------------------

With matplotlib enabled, plotting should just work.

.. code:: python

    import matplotlib.pyplot as plt
    import numpy as np
.. code:: python

    x = np.linspace(0, 3*np.pi, 500)
    plt.plot(x, np.sin(x**2))
    plt.title('A simple chirp');


.. image:: example_notebook_files/example_notebook_9_0.png


These images can be resized by dragging the handle in the lower right
corner. Double clicking will return them to their original size.

One thing to be aware of is that by default, the ``Figure`` object is
cleared at the end of each cell, so you will need to issue all plotting
commands for a single figure in a single cell.

Loading Matplotlib demos with %load
-----------------------------------

IPython's ``%load`` magic can be used to load any Matplotlib demo by its
URL:

.. code:: python

    %load http://matplotlib.org/mpl_examples/showcase/integral_demo.py
.. code:: python

    """
    Plot demonstrating the integral as the area under a curve.
    
    Although this is a simple example, it demonstrates some important tweaks:
    
        * A simple line plot with custom color and line width.
        * A shaded region created using a Polygon patch.
        * A text label with mathtext rendering.
        * figtext calls to label the x- and y-axes.
        * Use of axis spines to hide the top and right spines.
        * Custom tick placement and labels.
    """
    import numpy as np
    import matplotlib.pyplot as plt
    from matplotlib.patches import Polygon
    
    
    def func(x):
        return (x - 3) * (x - 5) * (x - 7) + 85
    
    
    a, b = 2, 9 # integral limits
    x = np.linspace(0, 10)
    y = func(x)
    
    fig, ax = plt.subplots()
    plt.plot(x, y, 'r', linewidth=2)
    plt.ylim(ymin=0)
    
    # Make the shaded region
    ix = np.linspace(a, b)
    iy = func(ix)
    verts = [(a, 0)] + list(zip(ix, iy)) + [(b, 0)]
    poly = Polygon(verts, facecolor='0.9', edgecolor='0.5')
    ax.add_patch(poly)
    
    plt.text(0.5 * (a + b), 30, r"$\int_a^b f(x)\mathrm{d}x$",
             horizontalalignment='center', fontsize=20)
    
    plt.figtext(0.9, 0.05, '$x$')
    plt.figtext(0.1, 0.9, '$y$')
    
    ax.spines['right'].set_visible(False)
    ax.spines['top'].set_visible(False)
    ax.xaxis.set_ticks_position('bottom')
    
    ax.set_xticks((a, b))
    ax.set_xticklabels(('$a$', '$b$'))
    ax.set_yticks([])
    
    plt.show()



.. image:: example_notebook_files/example_notebook_15_0.png

