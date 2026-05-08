#!/bin/bash
set -eu

# post start script
echo "BEGIN: initializeTYPO3.sh"

echo "initializeTYPO3: Removing old composer.lock file if exists"
rm -fv composer.lock

echo "initializeTYPO3: Checking if site already has been initialized"
if test ! -d .build/vendor; then
  echo "initializeTYPO3: Initialize TYPO3"
  composer config allow-plugins.helhum/dotenv-connector true
  composer require --no-scripts --no-interaction --dev "helhum/dotenv-connector"
  composer require --no-scripts --no-interaction --dev "helhum/typo3-console"
  composer config bin-dir .build/bin
  composer config vendor-dir .build/vendor
  composer config extra.typo3/cms.web-dir .build/public
  composer config extra.helhum/dotenv-connector.env-file .devcontainer/docker/typo3/TYPO3.env
  composer install
  # Add .build/bin to PATH
  [[ ":$PATH:" != *":${WORKSPACE_ROOT}/.build/bin:"* ]] && export PATH="${WORKSPACE_ROOT}/.build/bin:${PATH}"
fi

typo3_major_version=$(typo3 -V|grep "TYPO3 CMS"|perl -n -e '/\ ([\d]+)/ && print $1')
echo "initializeTYPO3: Running on TYPO3 major version ${typo3_major_version}"

echo "initializeTYPO3: DB compare"
typo3 database:updateschema --no-interaction --no-ansi || true

echo "initializeTYPO3: Update reference index"
typo3 referenceindex:update --no-interaction --no-ansi || true

#echo "initializeTYPO3: Create new backend user"
#$typo3_cli backend:createadmin ${TYPO3_INSTALL_ADMIN_USER} ${TYPO3_INSTALL_ADMIN_PASSWORD} --no-interaction --no-ansi || true

if [ ! -f config/system/additional.php ]; then
    echo "initializeTYPO3.sh: Add additional.php if not exists"
    cp .devcontainer/docker/typo3/additional.php config/system/additional.php
else
    echo "initializeTYPO3.sh: additional.php already exists - skipping"
fi

# needed as directory check moans about wrong permissions
echo "initializeTYPO3: Update file permissions"
sudo chmod -R 2770 .build config var

echo "initializeTYPO3.sh: Running composer up"
composer up

if [ "${TYPO3_INSTALL_DB_DRIVER}" == "mysqli" ]; then
    echo "initializeTYPO3.sh: Fix TYPO3 image references"
    mysql -h127.0.0.1 -P3306 -u${TYPO3_INSTALL_DB_USER} -p${TYPO3_INSTALL_DB_PASSWORD} -e 'use '${TYPO3_INSTALL_DB_DBNAME}'; call fixImgInTtContent();'
else
    echo "initializeTYPO3.sh: Fix TYPO3 image references - skipping as database driver is not mysqli"
fi

echo "END: initializeTYPO3.sh"