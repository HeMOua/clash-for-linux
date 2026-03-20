#!/usr/bin/env bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# shellcheck disable=SC1091
source "$PROJECT_DIR/scripts/service_lib.sh"

mode="$(detect_mode)"

echo "=== Clash Status ==="
echo "Project : $PROJECT_DIR"
echo "Mode    : $mode"

case "$mode" in
  systemd)
    echo "Running : yes (systemd)"
    ;;
  script)
    echo "Running : yes (script)"
    ;;
  systemd-installed)
    echo "Running : no (installed but not started)"
    ;;
  *)
    echo "Running : no"
    ;;
esac