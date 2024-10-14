# 4.7.0

## FEATURE

- 6b597d0 [FEATURE] Update Bootstrap Package to v14 (#111)

## TASK

- f741eba [TASK] Update export
- 727f71e [TASK] Update dependencies
- 87b00a0 [TASK] Switch Documentation Rendering to PHP (#113)
- 5a0fde5 [TASK] Test various PHP and dev versions (#108)
- 3b358a1 [TASK] Streamline dependencies (#107)
- 40f054c [TASK] Add acceptance tests (#106)
- 60f9739 [TASK] Avoid using inline styles in embedded SVG (#103)
- 110a494 [TASK] Require bk2k/bootstrap-package:^14.0.0
- 6bf3c3e [TASK] Update GitHub URL of TYPO3 core (#101)
- 8ab9fc6 [TASK] Move Xdebug config to launch.json (#99)

## BUGFIX

- b158605 [BUGFIX] Allow TYPO3 versions ^12.4 || ^13.4 || 13.*.*@dev
- 798773a [BUGFIX] Add missing TYPO3_SERVER_TYPE to ddev config
- 11362d0 [BUGFIX] Also change version of bootstrap_package in emconf
- a2a1eec [BUGFIX] Add Autocomplete to Example Form (#100)
- edcadac [BUGFIX] remove empty paragraph tags (#96)
- 3332b5b [BUGFIX] Use "" for table headers (#95)
- bc7afdb [BUGFIX] Correct target PID of redirect form finisher (#94)

## MISC

- d28090d [DOCS] Add description to run tests locally (#110)
- f2115fc [DOCS] Update TER description (#109)
- f14cef8 [DOCS] Fix links (#98)
- 1bd0d3c [DOCS] Rewrite DDEV maintenance (#97)

## Contributors

- Benjamin Kott
- Elias Häußler
- Gilbertsoft
- Lina Wolf
- Oliver Hader
- Sandra Erbel

# 4.6.1

## TASK

- 6a81b55 [TASK] Make clear these introductions are for contribution (#81)

## BUGFIX

- 14452c4 [BUGFIX] Fix translations and wrong language assignment (#93)

## Contributors

- Gilbertsoft
- Lina Wolf

# 4.6.0

## FEATURE

- 0865e36 [FEATURE] Update to TYPO3 v12 (#85)
- 522570d [FEATURE] Update Bootstrap Package to v13 (#88)

## TASK

- 33f1dcd [TASK] Revert version in ext_emconf.php
- ca429a8 [TASK] Change XDebug port for DDEV
- e717511 [TASK] Update ext_emconf.php
- c5576d0 [TASK] Fix branch-alias
- 6efae00 [TASK] Simplify workflows by using choices (#91)
- 59a1f36 [TASK] Require typo3/cms-beuser (#90)
- f55605a [TASK] Update actions (#89)
- 0915192 [TASK] Avoid circular dependencies for user groups (#87)
- 0114d03 [TASK] Add typo3/cms-beuser for maintenance (#86)
- 8eaba95 [TASK] Align with new TYPO3 documentation standards (#74)
- c810b14 [TASK] Introduce typo3/coding-standards (#76)
- 43c09ac [TASK] Update DDEV configuration (#75)
- 2eca0a1 [TASK] Reconfigure release-drafter (#69)

## BUGFIX

- cf0284b [BUGFIX] Use constant TYPO3 over TYPO3_MODE

## MISC

- eca7f00 [DOCS] Add hint for extension:setup (#77)
- 03c5ace [DOCS] Change branches from master to main (#71)

## Contributors

- Alexander Nitsche
- Benjamin Kott
- Christian Kuhn
- Gilbertsoft
- Lina Wolf

# 4.4.1

## TASK

- 6569a2d [TASK] Allow PHP 8 and higher (#66)

## Contributors

- Gilbertsoft

# 4.4.0

## FEATURE

- dc19491 [FEATURE] Update to TYPO3 v11 (#55)

## TASK

- ad1530b [TASK] Fix docs configuration and links (#61)
- ecab751 [TASK] Fix Xdebug configuration (#60)

## BUGFIX

- 5434a3b [BUGFIX] Dependencies in ext_emconf.php (#65)
- db2977a [BUGFIX] Cast page uid for error handler to int (#64)
- 464d0a7 [BUGFIX] Error handling configuration (#63)
- 7433ab2 [BUGFIX] Error handling configuration (#62)

## Contributors

- Andreas Fernandez
- Gilbertsoft

# 4.3.0

## FEATURE

- 26efa9e [FEATURE] Update Bootstrap Package and add new content elements (#54)

## TASK

- b3e3d9e [TASK] Fix action input (#59)
- cc724a2 [TASK] Optimize workflows (#58)
- 6d34562 [TASK] Manual upload to TER (#57)

## Contributors

- Gilbertsoft

# 4.2.1

## TASK

- 7a72672 [TASK] Introduce workflows (#53)
- 17677ba [TASK] Streamline package name
- de1aed6 [TASK] Streamline docs configuration with latest example
- 30768a1 [TASK] Update content and fix some links
- 2fe6994 [TASK] Bump minimal Bootstrap Package version
- 4ce2344 [TASK] Migrate text and icon type options
- 12f6aa6 [TASK] Migrate felogin
- 5b724b6 [TASK] Include preset in export
- a8d733a [TASK] Add .build/bin to $PATH
- bd1e536 [TASK] Provide documentation for DDEV
- 3a9fe32 [TASK] Provide reset custom command
- 0ad43e4 [TASK] Provide default user and password
- a26f625 [TASK] Special handling for XML exports
- b5d6b53 [TASK] Provide DDEV configuration for local development
- b30d976 [TASK] Removed unused extension replace section in composer.json

## BUGFIX

- c5e2391 [BUGFIX] Docs settings
- dda48b2 [BUGFIX] XDebug configuration
- 8e5619b [BUGFIX] Temporary move form to extension
- 5c8c24c [BUGFIX] Replace invalid DistributionWelcome.png
- fc9385c [BUGFIX] Force minimal set of core packages
- e39e1fd [BUGFIX] Add missing dependencies
- 9bb21d3 [BUGFIX] Reset custom command
- aa39d97 [BUGFIX] Missing symlink creation
- c9c77ab [BUGFIX] Add dependency to EXT:impexp

## MISC

- e353752 Fix typo

## Contributors

- Benni Mack
- Chris Müller
- Florian Wessels
- Simon Gilli

# 4.2.0

## TASK

- 18253c8 [TASK] Raise requirement version of ext:bootstrap_package
- e0ee0a8 [TASK] Provide minimal sites configuration

## Contributors

- Anja Leichsenring

# 4.1.0

## TASK

- c143fc7 [TASK] Sorten out bootstrap package dependencies
- 2761b16 [TASK] Update to TYPO3 v10.0 and bootstrap package

## Contributors

- Benni Mack

# 4.0.1

## TASK

- 6ef57c8 [TASK] Raise version to v4.0.1
- 94fa2a8 [TASK] Update sha1 with lf fix
- 72d40ba [TASK] Clean up ext_localconf.php
- 7d92184 [TASK] Clean up ext_emconf.php

## BUGFIX

- f520f68 [BUGFIX] Clean up README.md

## Contributors

- Benni Mack
- Susanne Moog

# 4.0.0

## TASK

- d1baeee [TASK] Raise version to v4.0.0
- 9726a57 [TASK] Raise bootstrap package requirement
- d050090 [TASK] Raise / add requirements for v9
- 24ca76d [TASK] Update introduction package for v9 LTS
- bde11d6 [TASK] Add LICENSE.txt
- 9d15eca [TASK] Update composer.json license definition
- 16ffd8e [TASK] Fix minor doc flaws
- c66ea78 [TASK] Add maintenance docs
- 2497008 [TASK] Basic installation and removal docs
- b1a66e9 [TASK] Fix markdown link
- c326ff8 [TASK] Kickstart .rst based documentation

## BUGFIX

- 3dff0de [BUGFIX] Rename Readme.md to README.md

## MISC

- 7653ea6 rename comntactform.yaml to contactform.form.yaml in data.xml file
- d80197c Rename contactform.yaml to contactform.form.yaml

## Contributors

- Benni Mack
- Christian Kuhn
- Simon Schmidt
- Susanne Moog

# 3.1.1

## TASK

- ef72855 [TASK] Bump version 3.1.1
- b00d6e6 [TASK] Recode what-is-typo3.mp3 to 128kbit reducing it from 3 to 1MB

## Contributors

- Christian Kuhn

# 3.1.0

## TASK

- a7b3274 [TASK] Bump version 3.1.0, depends on core >=9.1.0
- f696a39 [TASK] Update content export
- 8552644 [TASK] Update export preset
- 4ce32ae [TASK] Keep some template related files in Initialisation/Files
- 9c04fb0 [TASK] Remove all Initialization/Files
- faf37ff [TASK] Core v9 version constaints

## Contributors

- Christian Kuhn

# 3.0.2

## MISC

- e94b732 Add requirement to import / export extension

## Contributors

- Helmut Hummel

# 3.0.1

## TASK

- 622560d [TASK] Raise version dependencies
- 3817c84 [TASK] Add installation instructions to README.md

## Contributors

- Benjamin Kott
- Frans Saris

# 3.0.0

## FEATURE

- 2c4a65b [FEATURE] Register additional allowedFileMounts for ext:form

## TASK

- 53eee2f [TASK] Update DistributionWelcome image
- 3d4138f [TASK] Fix composer requirements
- a26382d [TASK] Updated content for TYPO3 v8 LTS

## BUGFIX

- 891a453 [BUGFIX] Fix path for forms

## MISC

- 7651b6d Change typo3 required version
- 7a6f31c Added composer.json

## Contributors

- Benni
- Frans Saris
- zbychu555

# 2.3.0

## TASK

- ae1ad26 [TASK] Updated package to be compatible with TYPO3 v7 and TYPO3 v8

## BUGFIX

- a9a0971 [BUGFIX] Minor fine tuning on data to be exported
- 62eff1d [BUGFIX] Re-formatted database dump, updated version to 2.2.1, fixed upload directories

## Contributors

- Benjamin Mack

# 2.2.0

## MISC

- d2cf9a3 Initial commit

## Contributors

- Benjamin Mack

