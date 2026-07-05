#!/usr/bin/env bash
set -euo pipefail

echo "=== OS ==="
. /etc/os-release
echo "$PRETTY_NAME"

echo
echo "=== Kernel ==="
uname -a

echo
echo "=== Environment ==="
if grep -qi microsoft /proc/version; then
  echo "wsl"
elif command -v systemd-detect-virt >/dev/null 2>&1 && systemd-detect-virt --quiet; then
  systemd-detect-virt
else
  echo "baremetal-or-unknown"
fi

echo
echo "=== GPU ==="
if command -v nvidia-smi >/dev/null 2>&1; then
  nvidia-smi
else
  echo "nvidia-smi not found"
fi
