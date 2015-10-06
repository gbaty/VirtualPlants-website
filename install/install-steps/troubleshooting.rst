Multiple installation
---------------------

To be sure you are using the right installation, you can run this command:

.. code-block:: bash

  python -c 'import vplants.mars_alt; print vplants.mars_alt.__path__'


Error loading tiff images
-------------------------

Install python-libtiff

.. code-block:: bash

  sudo apt-get install python-libtiff

Check libtiff is installed correctly

.. code-block:: bash

  python -c "import libtiff"

If you get this message: `ValueError: Failed to find TIFF header file (may be need to run: sudo apt-get install libtiff4-dev)`

Diagnostic : File :download:`tiff_h_4_0_3.py <patch/tiff_h_4_0_3.py>` is missing...
Add this file in the folder : /usr/lib/python2.7/dist-packages/libtiff/

.. code-block:: bash

  sudo cp tiff_h_4_0_3.py /usr/lib/python2.7/dist-packages/libtiff/

Try again :

.. code-block:: bash

  python -c "import libtiff"


pkg_resources.DistributionNotFound: openalea.container
------------------------------------------------------

If you get an error message like this one:

.. code-block:: text

    Traceback (most recent call last):
      File "setup.py", line 54, in <module>
        "console_scripts": ["alea = openalea.core.alea:main"],
      File ".../lib/python2.7/distutils/core.py", line 152, in setup
        dist.run_commands()
      File ".../lib/python2.7/distutils/dist.py", line 953, in run_commands
        self.run_command(cmd)
      File ".../lib/python2.7/distutils/dist.py", line 972, in run_command
        cmd_obj.run()
      File ".../openalea/deploy/src/openalea/deploy/command.py", line 972, in run
        set_env()
      File ".../openalea/deploy/src/openalea/deploy/command.py", line 813, in set_env
        dyn_lib = install_lib.install_lib(dyn_lib)
      File ".../openalea/deploy/src/openalea/deploy/install_lib.py", line 220, in install_lib
        egglibdirs = set(get_all_lib_dirs(precedence=INSTALL_DIST))
      File ".../openalea/deploy/src/openalea/deploy/util.py", line 134, in get_all_lib_dirs
        for e in egg_names:
      File ".../openalea/deploy/src/openalea/deploy/util.py", line 116, in get_eggs
        pkg = pkg_resources.get_distribution(project_name)
      File ".../site-packages/pkg_resources.py", line 345, in get_distribution
        if isinstance(dist,Requirement): dist = get_provider(dist)
      File ".../site-packages/pkg_resources.py", line 224, in get_provider
        return working_set.find(moduleOrReq) or require(str(moduleOrReq))[0]
      File ".../site-packages/pkg_resources.py", line 668, in require
        needed = self.resolve(parse_requirements(requirements))
      File ".../site-packages/pkg_resources.py", line 571, in resolve
        raise DistributionNotFound(req)
    pkg_resources.DistributionNotFound: openalea.container
    Executing /usr/local/opt/python/bin/python2.7 setup.py develop ...processing


It is generally due to a partial uninstallation of python module.

For example if you've installed a package myapp that depends on mydeps, 
then you've uninstalled mydeps but you've kept myapp, this problem might appear.
pkg_resources tries to load mydeps and fails.
Solution is easy : reinstall mydeps or uninstall myapp.


Other troubles
--------------

For other troubles, see:

See `troubleshooting page <http://openalea.gforge.inria.fr/beta_doc/vplants/vtissue/doc/_build/html/user/mars_alt_v1/troubleshootings.html>`_


.. seealso::

  :ref:`Mars-alt Main Page <marsalt>`



