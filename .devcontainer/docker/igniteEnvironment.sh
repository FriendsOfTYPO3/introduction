#!/bin/bash
#
# !!!! IMPORTANT: WORKSPACE_ROOT has to be set before sourcing this script
echo "BEGIN: igniteEnvironment.sh"

set -u
pushd ${WORKSPACE_ROOT}

source .devcontainer/docker/parseDotEnv.sh

# take care of file ownership esp. to support cross container functionality
echo "igniteEnvironment.sh: Update file and directory ownership"
sudo chown -Rc ${DEVCONTAINER_SERVICE_NAME}:${DEVCONTAINER_SERVICE_NAME} config .build var

echo "igniteEnvironment.sh: Reset environment"
rm -rf config .build/bin .build/public .build/vendor var
mkdir -vp .build/public /.build/run var/log/ var/lib
cp -v .devcontainer/docker/typo3/servertest.txt .build/public/servertest.txt

if [ "${DB_SERVER_TYPE}" == "sqlite" ]; then
  rm -fv ${SQLITE_DBFILE_PATH}
  mkdir -vp $(dirname ${SQLITE_DBFILE_PATH})
else
  echo "igniteEnvironment.sh: Skipping creation of SqLite datafile directory"
fi

if [ "${TYPO3_INSTALL_DB_DRIVER}" == "mysqli" ]; then
  echo "Using MySQL/MariaDB as database - resetting database"
  # Drop all database tables
  mysql -h${TYPO3_INSTALL_DB_HOST} -P${TYPO3_INSTALL_DB_PORT} -u${TYPO3_INSTALL_DB_USER} -p${TYPO3_INSTALL_DB_PASSWORD} --silent --skip-column-names -e "SHOW TABLES" ${TYPO3_INSTALL_DB_DBNAME} | \
      xargs -I% echo 'SET FOREIGN_KEY_CHECKS = 0; DROP TABLE %; SET FOREIGN_KEY_CHECKS = 1;' | \
      mysql -h${TYPO3_INSTALL_DB_HOST} -P${TYPO3_INSTALL_DB_PORT} -u${TYPO3_INSTALL_DB_USER} -p${TYPO3_INSTALL_DB_PASSWORD} -v ${TYPO3_INSTALL_DB_DBNAME}

  mysql -h${TYPO3_INSTALL_DB_HOST} -P${TYPO3_INSTALL_DB_PORT} -u${TYPO3_INSTALL_DB_USER} -p${TYPO3_INSTALL_DB_PASSWORD} --init-command='USE '${TYPO3_INSTALL_DB_DBNAME} < .devcontainer/docker/db/initdb/2_create_procedure.sql
elif [ "${TYPO3_INSTALL_DB_DRIVER}" == "sqlite" ] && [ -f ${SQLITE_DBFILE_PATH} ]; then
  echo "Using SQLite as database - resetting database"
  rm -fv ${SQLITE_DBFILE_PATH}
elif [ "${TYPO3_INSTALL_DB_DRIVER}" == "postgres" ]; then
  echo "Using PostgreSQL as database - resetting database"
  # Drop all database tables
  echo "SET CONSTRAINTS ALL DEFERRED;
        $(psql --dbname=${TYPO3_INSTALL_DB_DBNAME} -h ${TYPO3_INSTALL_DB_HOST} --port=${TYPO3_INSTALL_DB_PORT} -U ${TYPO3_INSTALL_DB_USER} -t --csv --command '\dt'|cut -d, -f2|xargs -I% echo 'DROP TABLE % CASCADE;')
        SET CONSTRAINTS ALL IMMEDIATE;" | \
    psql --dbname=${TYPO3_INSTALL_DB_DBNAME} -h ${TYPO3_INSTALL_DB_HOST} --port=${TYPO3_INSTALL_DB_PORT} -U ${TYPO3_INSTALL_DB_USER}
fi

if [ -f ${WORKSPACE_ROOT}/composer.json ]; then
  echo "igniteEnvironment.sh: Found composer.json - running initializeTYPO3.sh"
  sudo chmod -c +x .devcontainer/docker/initializeTYPO3.sh
  .devcontainer/docker/initializeTYPO3.sh
else
  echo "No composer.json found - skipping initializeTYPO3.sh and composer up"
fi

if [ "%1" == "postCreateCommand" ]; then
  echo "igniteEnvironment.sh: Post create command - skipping server restart"
else
  echo "igniteEnvironment.sh: restarting server if necessary"
  .devcontainer/postAttachCommandScript.sh
fi

echo "END: igniteEnvironment.sh"
popd
