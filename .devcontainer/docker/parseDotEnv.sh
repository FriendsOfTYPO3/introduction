#!/bin/bash
# parse .env file of the current project
# the convention is that this file should reside in the parent dir of the project
# having the same name as the project dir extended by '.env'
#
# !!!! IMPORTANT: WORKSPACE_ROOT has to be set before sourcing this script
set +u
# quit if env vars have been already set
[ -n "${TYPO3_INSTALL_DB_DRIVER}" ] && echo ".env alread set" && return 0
set -u

dotEnvFile="${WORKSPACE_ROOT}/.devcontainer/docker/typo3/TYPO3.env"

if [[ ${DB_SERVER_TYPE} =~ (mysql|mariadb) ]]; then
    export TYPO3_INSTALL_DB_DRIVER=mysqli
    export TYPO3_INSTALL_DB_DBNAME="${DB_SERVER_DBNAME}"
    export DB_SERVER_PORT=${DB_SERVER_PORT_MYSQL_MARIADB}
elif [ "${DB_SERVER_TYPE}" == "sqlite" ]; then
    export TYPO3_INSTALL_DB_DRIVER=sqlite
    export TYPO3_INSTALL_DB_DBNAME="${SQLITE_DBFILE_PATH}"
    export DB_SERVER_PORT=0
elif [ "${DB_SERVER_TYPE}" == "postgresql" ]; then
    export PGPASSWORD=${TYPO3_INSTALL_DB_PASSWORD}
    export TYPO3_INSTALL_DB_DRIVER=postgres
    export TYPO3_INSTALL_DB_DBNAME="${DB_SERVER_DBNAME}"
    export DB_SERVER_PORT=${DB_SERVER_PORT_POSTGRESQL}
fi

if [[ ${COMPOSE_PROFILES} =~ "apache" ]]; then
    export TYPO3_INSTALL_WEB_SERVER_CONFIG="apache"
else
    export TYPO3_INSTALL_WEB_SERVER_CONFIG="other"
fi

# parse .env file
if [ -f $dotEnvFile ]; then
    echo "Parsing .env file $dotEnvFile"
    set -o allexport
    source $dotEnvFile
    set +o allexport
else
	echo "Skipping .env file $dotEnvFile"
fi
