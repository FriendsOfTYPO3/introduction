.. include:: Includes.txt

Installation
============

TYPO3 download based instance
-----------------------------

If you downloaded and unpacked a full TYPO3 core from `typo3.org <https://typo3.org>`_
or `get.typo3.org <https://get.typo3.org>`_, just :ref:`install the system <t3install:start>` as usual.
In the last installation step you can select the option *Yes, download the list of distributions.* On
first backend login, you will be redirected to the extension manager "Get preconfigured
distribution" and can install the "The Official TYPO3 Introduction Package" with one click.

If you want to test the distribution in an existing instance, just select the extension
manager in the backend, go to "Get preconfigured distribution" and select "The Official TYPO3 Introduction Package".

Note the extension can be unloaded and removed from the system after initial import,
all business code is within the bootstrap_package extension that comes along with the
introduction extension, all required content data is loaded into the database and
required files are put into :file:`fileadmin/introduction` upon first installation.


Composer based instance
-----------------------

If you base your TYPO3 instance on a modern composer based installation, just require
the package via composer:

.. code-block:: bash

    composer require typo3/cms-introduction

Then go to the backend extension manager and load the extension in "Installed Extensions".
Note the introduction extension can be removed after first installation again, while
the extension bootstrap_package needs to stay loaded for a working frontend site.


Removal
-------

To remove the package from the instance, the following steps are needed:

* Unload extensions "introduction" and "bootstrap_package"

* Delete the two extension in the extension manager

* Remove the page tree starting with root page "Congratulations"

* Remove all files from fileadmin/introduction using the backend Filelist module

* (Optional) If you want to re-install ext:introduction on an instance that had ext:introduction
  loaded before, the data import is only performed if you (manually) remove the keys
  marked with :php:`extensionDataImport` in column :php:`entry_namespace` from database table
  :php:`sys_registry` that are related to the introduction paths.
  Note it is often easier to just install TYPO3 from scratch if you just want to play around.
