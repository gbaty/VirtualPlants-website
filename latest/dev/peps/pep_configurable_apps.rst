=============================
PEP: Configurable application
=============================

Overview of existing technologies
=================================

IPython
-------

`IPython Configuration Documentation <http://ipython.org/ipython-doc/dev/config/index.html>`_

  - based on traitlets (`traits <http://docs.enthought.com/traits/index.html>`_)
  - auto command line generation
  - easy to handle sub class configurations
  - methods to generate and read config files
  - need to explictly save configuration
  - handle automatic namespaces based on class names : MyClass.Param1
  - JSON or Python serialization
  - support typing based on trait
  - NO unique configuration (singleton)
  

Example of code

.. code-block:: python

   from IPython.config.configurable import Configurable
   from IPython.config.application import Application
   from IPython.utils.traitlets import (Bool, Unicode, List, Dict)
   
   
   class Applet1(Configurable):
       name = Unicode(u'Guillaume', config=True, help="First name.")
       dry_run = Bool(True, config=True)
   
   class MyApp(Application):
       classes = List([Applet1])
       config_file = Unicode(u'', config=True,
                      help="Load this config file")
       
       aliases = Dict({'name':'Applet1.name'})
       # config_file is reachable only with --MyApp.config_file=... or --help-all
   
       def initialize(self, argv=None):
           self.parse_command_line(argv)
           if self.config_file:
               self.load_config_file(self.config_file)
           self.foo = Applet1(config=self.config)
   
       def start(self):
           print "app.config:"
           print self.config
   
   if __name__ == "__main__":
       app = MyApp()
       app.initialize()
       config_str = app.generate_config_file()
       app.start()
   
Default python file generated from this code :

.. code-block:: python

   # Configuration file for application.
   
   c = get_config()
   
   #------------------------------------------------------------------------------
   # MyApp configuration
   #------------------------------------------------------------------------------
   
   # This is an application.
   
   # MyApp will inherit config from: Application
   
   # Set the log level by value or name.
   # c.MyApp.log_level = 30
   
   # The Logging format template
   # c.MyApp.log_format = '[%(name)s]%(highlevel)s %(message)s'
   
   # Load this config file
   # c.MyApp.config_file = u''
   
   # The date format used by logging formatters for %(asctime)s
   # c.MyApp.log_datefmt = '%Y-%m-%d %H:%M:%S'
   
   #------------------------------------------------------------------------------
   # Applet1 configuration
   #------------------------------------------------------------------------------
   
   # First name.
   # c.Applet1.name = u'Guillaume'
   
   #
   # c.Applet1.dry_run = True


ETS AppTools
------------

`ETS AppTools Preference Documentation <http://code.enthought.com/projects/app_tools/docs/html/preferences/Preferences.html>`_


  - based on `traits <http://docs.enthought.com/traits/index.html>`_ & `ConfigObj <http://www.voidspace.org.uk/python/configobj.html>`_.
  - handle configuration inheritance
  - all parameters are stored as strings but types can be forced using a PreferenceHelper (HasTraits class) describing types for each parameter.


Example of inheritance :

>>> from apptools.preferences.preferences import Preferences
>>> pref = Preferences()
>>> pref.set('ui.color', 'black')
>>> pref.get('ui.editor.color', inherit=True)
'black'


Existing technology in OpenAlea
===============================

classes in openalea.core.settings :

Settings: singleton

.. code-block:: python

    Methods:  [
               'add_option', 'add_section', 'add_section_update_handler', 'configfile',
               'defaults', 'exists', 'get', 'getboolean', 'getfloat', 'getint', 'has_option',
               'has_section', 'instance', 'items', 'options', 'optionxform', 'read', 'readfp',
               'remove_option', 'remove_section', 'sections', 'set', 'write'
               ]



