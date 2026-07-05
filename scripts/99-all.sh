#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/00-detect-environment.sh"
bash "$SCRIPT_DIR/01-base-packages.sh"
bash "$SCRIPT_DIR/03-python-uv.sh"
bash "$SCRIPT_DIR/05-gpu-check.sh"
