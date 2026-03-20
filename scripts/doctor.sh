#!/usr/bin/env bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
RUNTIME_DIR="$PROJECT_DIR/runtime"

echo "=== Clash Doctor ==="

if [ -f "$RUNTIME_DIR/config.yaml" ]; then
  echo "[OK] config exists"
else
  echo "[ERROR] config missing"
fi

if command -v systemctl >/dev/null 2>&1; then
  if systemctl is-active --quiet clash-for-linux.service; then
    echo "[OK] service running"
  else
    echo "[WARN] service not running"
  fi
fi