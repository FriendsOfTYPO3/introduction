#!/bin/bash

echo "BEGIN: server.sh (nginx)"

if [[ ! ${COMPOSE_PROFILES} =~ "nginx" ]]; then
  echo "server.sh: No PHP-FPM environment for Nginx webserver"
  exit 0
fi

if [[ "$1" == "restart" ]]; then
  echo "server.sh: Checking for running php-fpm"
  if [ $(pidof php-fpm| wc -w) -ne 0 ]; then
    echo "server.sh: Stopping running php-fpm"
    sudo pidof php-fpm | sudo xargs kill -9
    sleep 1
    #pkill -f php-fpm -> generates a non zero exit code which fails the script
  fi
fi

if [ $(sudo pidof php-fpm| wc -w) -eq 0 ]; then
  echo "server.sh: Copy TYPO3 PHP configuration for php-fpm"
  sudo cp -fv ${WORKSPACE_ROOT}/.devcontainer/docker/php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
  sudo cp -fv ${WORKSPACE_ROOT}/.devcontainer/docker/typo3/php.ini ${PHP_INI_DIR}/php.ini
  echo "server.sh: Starting php-fpm in daemon mode"
  nohup php-fpm >/dev/null 2>&1 &
  echo "Devcontainer: php-fpm server started (PID: $!))"
else
  echo "Devcontainer: php-fpm server already running (PID: $(sudo pidof php-fpm))"
fi

echo "END: server.sh (nginx)"
exit 0
