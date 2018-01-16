.. include:: Includes.txt

Maintenance
===========

This chapter is for developers who want to contribute and maintain the extension.
It can also act as a kick start for other extension authors who want to create
own distributions.

The basic setup of ext:introduction and distributions in general is described
in the :ref:`TYPO3 Core API. <t3coreapi:distribution>` It is a good idea to
read this as an introduction to the concept of distributions.


General restrictions
--------------------

The extension is created in a way that as soon as the data import (files & db) has
been performed by a user, the extension can be unloaded and removed from the system.
This should be kept. It means that all relevant data needs to either reside in
:file:`fileadmin/introduction` or in the database. No code should link to :php:`EXT:introduction/...`.

The extension is based on :php:`ext:bootstrap_package` which brings the main
site setup. Dealing with :php:`ext:introduction` thus means dealing only with
the content - pages, tt_content, assets and so on.


Content administration
----------------------

To prepare and change existing content, a series of steps is required to end
up with a clean data export:

* Install a fresh and empty TYPO3 core, easiest way is to clone current core master and composer install

* Install base system, select "Do nothing, just get me to the Backend." in last installer step

* Go to extension manager "Get Extensions" and let it fetch the full extension list. This
  is needed for the :php:`ext:bootstrap_package` requirement.

* Clone :php:`ext:introduction` to :file:`typo3conf/ext/`

* Go back to extension manager "Installed Extensions" and load :php:`ext:introduction`. This will
  install all current content and assets.

* Do your content munging, execute update wizards, do whatever is needed. Keep core version constraints
  in mind if you do something that is specific for some core versions. Continue with data export.
  Keep in mind to only use files that reside in :file:`fileadmin/introduction`. Keep an eye on file
  size. If possible, the extension should stay below 10MB after export.


Update data export
------------------

The distribution data handling is based on core extension :php:`ext:impexp`. The extension manager
will use that extension for data import upon loading :php:`ext:introduction`. There are three main
areas:

* :file:`Initialisation/data.xml` - All main DB data. pages, tt_content and so on

* :file:`Initialisation/data.xml.files/` - All assets reference in content elements. Only files
  from within :file:`fileadmin/introduction` should be in there. A reference outside of this
  fileadmin sub folder is *not* allowed. Check this during export.

* :file:`Initialisation/Files/` - Contains files that will be copied to :file:`fileadmin/introduction`.
  Only files not directly referenced by content elements should be in here, since those referenced
  files come with :file:`Initialisation/data.xml.files/`. Do not blindly copy everything. Examples
  for good-to-go files in here are a couple of logos that are used in TypoScript templates, and a
  default :php:`ext:form` contact form .yml file.

Step by step export guide:

* Load the :file:`Resources/Private/ImportExportPreset.sql` into the database table :php:`tx_impexp_presets`.
  Example for command line to the target database "cmsintroduction":

  .. code-block:: sql

    mysql cmsintroduction < Resources/Private/ImportExportPreset.sql

* After content administration is done, select "More -> Export" on the root page "Congratulations"

* Load the "Introduction Package" preset

* Check the exported data does NOT contain backend users, especially not the user you are currently
  logged in with

* Update the preset if it had to be changed. Dump the table and update file :file:`Resources/Private/ImportExportPreset.sql`

* Perform the export

* Copy or move :file:`fileadmin/user_upload/_temp_/importexport/data.xml` to :file:`ext:introduction/Initialisation/data.xml`

* Delete directory :file:`ext:introduction/Initialisation/data.xml.files`

* Move directory :file:`fileadmin/user_upload/_temp_/importexport/data.xml.files/`
  to :file:`ext:introduction/Initialisation/data.xml.files`

* Verify if :file:`ext:introduction/Initialisation/Files/` needs updates

* Move the entire extension to some safe place and perform a full new test installation on a blank
  system as outlined in :ref:`distribution testing <t3coreapi:distribution-testing>`. Verify content
  is displayed as expected and all files are displayed and rendered. If not, repeat steps above.

* Commit code changes to github or create pull request.


Release
-------

* Adapt TYPO3 core & other dependencies if needed in :file:`ext_emconf.php` and :file:`composer.json`.
  Push changes.

* Align on a new version (major, minor, patch level). Adapt version number in :file:`ext_emconf.php` and
  :file:`Documentation/Settings.cfg`. Push changes with "[TASK] Bump version x.y.z"

* Tag new version, git push --tags - this will update packagist.org with the new release

* Upload extension to TER, extension owner is user "typo3v4"

* Wait until TER processed upload and test distribution installation using extension manager
  "Get preconfigured distribution"

* Quickly do another release because something was wrong, or party hard if all is good
