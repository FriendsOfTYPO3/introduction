#!/bin/bash

echo "BEGIN: server.sh (frankenphp)"

if [[ ! "${COMPOSE_PROFILES}" =~ "frankenphp" ]]; then
  echo "server.sh: No frankenphp environment"
  exit 0
fi

if [ "$1" == "restart" ]; then
  echo "server.sh: Checking for running frankenphp"
  if [ $(pidof frankenphp| wc -w) -ne 0 ]; then
    echo "restartFrankenphp: Stopping running frankenphp"
    sudo pidof frankenphp | sudo xargs kill -9
    sleep 1
  fi
fi

if [ $(sudo pidof frankenphp| wc -w) -eq 0 ]; then
  echo "server.sh: Copy TYPO3 PHP configuration for frankenphp"
  sudo cp -fv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
  sudo cp -fv ${WORKSPACE_ROOT}/.devcontainer/docker/typo3/php.ini /usr/local/etc/php/conf.d/typo3.ini
  echo "server.sh: Starting frankenphp in daemon mode"
  nohup frankenphp run --config ${WORKSPACE_ROOT}/.devcontainer/docker/typo3/typo3.caddyfile >/dev/null 2>&1 &
  #nohup frankenphp run --config ${WORKSPACE_ROOT}/.devcontainer/docker/typo3/typo3.caddyfile >>${WORKSPACE_ROOT}/frankenphp.log 2>&1 &
  echo "Devcontainer: frankenphp server started (PID: $!))"
else
  echo "Devcontainer: frankenphp server already running (PID: $(sudo pidof frankenphp))"
fi

echo "END: server.sh (frankenphp)"
exit 0
