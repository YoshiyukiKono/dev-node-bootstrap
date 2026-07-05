#!/usr/bin/env bash
set -euo pipefail

echo "=== NVIDIA SMI ==="
if command -v nvidia-smi >/dev/null 2>&1; then
  nvidia-smi
else
  echo "nvidia-smi not found"
  exit 1
fi
