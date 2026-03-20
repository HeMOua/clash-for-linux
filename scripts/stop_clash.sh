#!/usr/bin/env bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# shellcheck disable=SC1091
source "$PROJECT_DIR/scripts/service_lib.sh"

mode="$(detect_mode)"

case "$mode" in
  systemd)
    stop_via_systemd
    echo "[OK] stopped via systemd"
    ;;
  script)
    stop_via_script
    echo "[OK] stopped via script"
    ;;
  *)
    echo "[WARN] nothing is running"
    ;;
esac