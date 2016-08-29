#!/bin/bash

if [ ! -f /factorio/saves/settings.json ]; then
  /factorio/bin/x64/factorio --create /factorio/saves/map.zip
  cp /factorio/data/server-settings.example.json /factorio/saves/settings.json
  echo "Factorio have been downloaded and prepared for you."
  echo "Please, configure the /factorio/settings.json file."
  echo "Once configured, just restart the server, and it will work as expected."
  exit 0
fi

exec "$@"
