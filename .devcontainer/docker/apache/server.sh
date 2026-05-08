#!/bin/bash

echo "BEGIN: server.sh (apache)"

if [[ ! ${COMPOSE_PROFILES} =~ "apache" ]]; then
  echo "server.sh: No Apache environment"
  exit 0
fi

if test ! -f .build/public/.htaccess; then
  echo "server.sh (apache): Copying .htaccess to public folder"
  cp -v .devcontainer/docker/apache/.htaccess .build/public
fi

if test ! -f /etc/apache2/sites-enabled/001-typo3.conf; then
  echo "server.sh (apache): Setting up Apache virtual server for TYPO3"
  sudo cp -v .devcontainer/docker/apache/001-typo3.conf /etc/apache2/sites-available/
  sudo a2ensite 001-typo3
fi

sudo find .build/public -name .htaccess -exec chmod -c 0660 {} \;
sudo find var -name .htaccess -exec chmod -c 0660 {} \;
sudo find .build/public -name index.html -exec chmod -c 0660 {} \;
mkdir -pv var/log/apache2

echo "server.sh (apache): Restarting Apache server"
sudo /bin/bash -c "export WORKSPACE_ROOT=\"${WORKSPACE_ROOT}\" && apachectl -k restart"
echo "Devcontainer: Apache server started"

echo "END: server.sh (apache)"
exit 0
