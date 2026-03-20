#!/usr/bin/env bash
set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_FILE="$PROJECT_DIR/logs/clash.log"
SERVICE_NAME="clash-for-linux.service"

if [ "${1:-}" = "-f" ]; then
  if command -v journalctl >/dev/null 2>&1; then
    journalctl -u "$SERVICE_NAME" -f
  else
    tail -f "$LOG_FILE"
  fi
else
  if command -v journalctl >/dev/null 2>&1; then
    journalctl -u "$SERVICE_NAME" -n 50 --no-pager
  else
    tail -n 50 "$LOG_FILE"
  fi
fi