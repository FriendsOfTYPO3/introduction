@echo off

pushd %~dp0
docker-compose --file render-docs.yaml run --rm t3docmake
popd

echo Rendering has done, find the results in .build/docs
