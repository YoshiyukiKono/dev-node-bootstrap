#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo "Python / uv Setup"
echo "========================================"

if ! command -v python3 >/dev/null 2>&1; then
  echo "ERROR: python3 not found"
  exit 1
fi

echo "Python: $(python3 --version)"

if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  echo "uv already installed: $(uv --version)"
fi

LOCAL_BIN_LINE='export PATH="$HOME/.local/bin:$PATH"'

if ! grep -Fq "$LOCAL_BIN_LINE" "$HOME/.bashrc"; then
  echo "$LOCAL_BIN_LINE" >> "$HOME/.bashrc"
  echo "Added ~/.local/bin to PATH in ~/.bashrc"
else
  echo "~/.local/bin already configured in ~/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"

echo
echo "Verification:"
echo "Python: $(python3 --version)"
echo "uv    : $(uv --version)"
echo
echo "Note: restart your shell or run:"
echo '  source ~/.bashrc'
