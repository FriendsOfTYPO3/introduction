#!/bin/bash
set -eu

echo "BEGIN: onCreateCommandScript.sh"

echo "onCreateCommandScript: Configuring git safe directories"
git config --global --add safe.directory ${WORKSPACE_ROOT}

echo "onCreateCommandScript: Globally set ownership of workspace root"
sudo chgrp ${DEVCONTAINER_SERVICE_NAME} ${WORKSPACE_ROOT}

echo "onCreateCommandScript: Making scripts executable"
find ${WORKSPACE_ROOT}/.devcontainer -name *.sh -type f -not -executable -exec sudo chmod -c +x {} \;

echo "END: onCreateCommandScript.sh"
