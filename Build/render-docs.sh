#!/bin/bash

pushd "$(dirname "${0}")" >/dev/null || exit 1
docker pull ghcr.io/t3docs/render-documentation:v3.0.dev30
docker tag ghcr.io/t3docs/render-documentation:v3.0.dev30 t3docs/render-documentation:develop
docker-compose --file render-docs.yaml run --rm t3docmake
popd >/dev/null || exit 1

echo "Rendering has done, find the results in .build/docs"
