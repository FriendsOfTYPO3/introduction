#!/bin/bash

# post start script
echo "BEGIN: Apache preStop.sh"

pushd ${WORKSPACE_ROOT}
trap "popd" EXIT

# needed as directory check moans about wrong permissions
chmod -c +x .build/typo3/dumpData.sh
.build/typo3/dumpData.sh

popd
echo "END: Apache preStop.sh"
