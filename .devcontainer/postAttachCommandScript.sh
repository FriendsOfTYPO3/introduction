#!/bin/bash
set -eu

# post start script
echo "BEGIN: postAttachCommandScript.sh"

if [[ "${COMPOSE_PROFILES}" =~ "nginx" ]]; then
    echo "postAttachCommandScript.sh: Checking for running php-fpm"
    .devcontainer/docker/php-fpm/server.sh restart
elif [[ "${COMPOSE_PROFILES}" =~ "apache" ]]; then
    echo "postAttachCommandScript.sh: Restarting Apache"
    .devcontainer/docker/apache/server.sh
elif [[ "${COMPOSE_PROFILES}" =~ "frankenphp" ]]; then
    echo "postAttachCommandScript.sh: Restarting FrankenPHP"
    .devcontainer/docker/frankenphp/server.sh restart
fi

echo "END: postAttachCommandScript.sh"
echo ""
echo "===================================================================================="
echo "Enjoy using this TYPO3 devcontainer template"
echo "You can close this terminal without doubts if you don't need it for other activities"
echo "===================================================================================="
