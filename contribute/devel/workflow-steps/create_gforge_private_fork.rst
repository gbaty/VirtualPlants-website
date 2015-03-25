Create your private area
========================

Do this step only one time, once created, never do it again.

To create a private area on gforge, you need a **@inria.fr** email address. Be sure this address is used, 
else, you can `change your gforge email address <https://gforge.inria.fr/account/change_email.php>`_.

Please respect naming convention below

#. `Register a new project <https://gforge.inria.fr/register>`_ :
  - Full name: private git Firstname Familyname
  - Description: private repositories (you can write what you want here)
  - Unix name: usernamegit (username is your gforge account login, just add git at the end)
  - Source code: select git button
  - Start from empty project

Create your fork
================

The official project you want to fork in order to contribute will be called "upstream".
To be able to contribute to this "upstream" project, you need to "fork it" (make a private clone of it).
To fork it, do these steps (do it only one time for a project)

#. Go to `My page <https://gforge.inria.fr/my>`_
#. click on your **private repositories** project
#. click on **administration** tab
#. click on **tools** tab
#. enable **source code management** (SCM) by checking it, then update
#. click on **SCM/Code source**
#. click on **administration** tab
#. click on "SCM/Code source"
  - repository name: same as repository you want to fork (ex: `oalab-tissue`)
  - description: fork full-address-to-forked repository (ex: `fork git+ssh://username@scm.gforge.inria.fr//gitroot/project/oalab-tissue.git`)
  - Initial clone URL: erase name, field must be empty

Wait at least one hour!

#. Click on "SCM/Source code"
#. Copy git command (something like `git clone git+ssh://username@scm.gforge.inria.fr//gitroot/usernamegit/usernamegit.git`)
#. Paste this command in a terminal to clone project on your disk