#!/bin/bash

pushd "$(dirname "${0}")" >/dev/null || exit 1
docker-compose --file render-docs.yaml run --rm t3docmake
popd >/dev/null || exit 1

echo "Rendering has done, find the results in .build/docs"
