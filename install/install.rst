============
Installation
============

Install on Mac OS X
-------------------

.. toctree::
   :maxdepth: 1

   osx

Known issues
------------

**pkg_resources.DistributionNotFound: openalea.container**

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


