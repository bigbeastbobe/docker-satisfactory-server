#!/bin/bash
# Seed the network timeout settings into the server's config folder
# on first boot (only if there isn't an Engine.ini already), then hand
# over to the normal wolveix startup script.

CONFIG_DIR="/config/gamefiles/FactoryGame/Saved/Config/LinuxServer"

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_DIR/Engine.ini" ]; then
  cp /defaults/Engine.ini "$CONFIG_DIR/Engine.ini"
  echo "[liam-build] Seeded Engine.ini with longer connection timeouts."
fi

exec /init.sh "$@"
