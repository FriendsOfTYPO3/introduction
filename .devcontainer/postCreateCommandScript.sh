#!/bin/bash
set -eu

# post start script
echo "BEGIN: postCreateCommandScript.sh"

source .devcontainer/docker/parseDotEnv.sh

# check if docker containers are already running only if docker cli is installed
if [ -n `which docker` ] && [ "${DB_SERVER_TYPE:-sqlite}" != "sqlite" ] || [[ "${COMPOSE_PROFILES}:-frankenphp" =~ "nginx" ]]; then
  echo "postCreateCommandScript: Checking if docker containers are already running"
  if [ `docker compose ls -q --filter "name=^${COMPOSE_PROJECT_NAME}$" | wc -l` -eq 0 ]; then
    compose_filename="${WORKSPACE_ROOT}/.devcontainer/docker/docker-compose.backend.yaml"
    export COMPOSE_PROFILES+=", ${DB_SERVER_TYPE}"
    # start docker containers for initialization
    echo "postCreateCommandScript: Starting docker containers for ${COMPOSE_PROJECT_NAME} with database server type ${DB_SERVER_TYPE}"
    docker compose -f ${compose_filename} up -d --wait || [ $? -eq 1 ] && echo "Maybe something went wrong starting docker containers. Please check docker ps output and logs for ${COMPOSE_PROJECT_NAME}."
  else
    echo "Docker containers for ${COMPOSE_PROJECT_NAME} are already running."
  fi
fi

# ignite TYPO3 environment for the first time
echo "postCreateCommandScript: Ignite TYPO3 environment for the first time"
${WORKSPACE_ROOT}/.devcontainer/docker/igniteEnvironment.sh postCreateCommand

echo "END: postCreateCommandScript.sh"
