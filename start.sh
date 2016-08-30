#!/bin/bash

if [ -z $FACTORIO_VERSION ]; then
  echo "You must set the FACTORIO_VERSION variable."
  exit 1
fi

echo "Downloading the Factorio $FACTORIO_VERSION"
echo "------------------------------------------"
wget https://www.factorio.com/get-download/$FACTORIO_VERSION/headless/linux64 -O /tmp/factorio.tgz
tar -xzf /tmp/factorio.tgz -C /
rm /tmp/factorio.tgz

echo "Launching Factorio"
echo "------------------"
exec /factorio/bin/x64/factorio $@
