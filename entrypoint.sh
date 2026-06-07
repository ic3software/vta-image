#!/bin/sh

DATA_DIR="/app/vta/data"
CONFIG_FILE="/app/vta/config.toml"

if [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A $DATA_DIR 2>/dev/null)" ] || [ ! -f "$CONFIG_FILE" ]; then
  [ ! -d "$DATA_DIR" ] || [ -z "$(ls -A $DATA_DIR 2>/dev/null)" ] && echo "⚠️  No data found."
  [ ! -f "$CONFIG_FILE" ] && echo "⚠️  No config found."
  echo "👉 Please run: kubectl exec -it <pod> -- vta setup"
  echo "⏳ Holding container..."
  sleep infinity
fi

echo "✅ Data found, starting vta..."
exec vta
