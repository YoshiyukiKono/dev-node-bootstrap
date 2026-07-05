#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$REPO_ROOT/lib/system.sh"

KEY_PATH="${GITHUB_SSH_KEY_PATH:-$HOME/.ssh/id_ed25519_github}"
KEY_COMMENT="${GITHUB_SSH_KEY_COMMENT:-$(git config --global user.email || echo "github-key")}"
KEY_TITLE="${GITHUB_SSH_KEY_TITLE:-$(get_github_key_title)}"

echo "========================================"
echo "GitHub SSH Wizard"
echo "========================================"
echo

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

if [[ -f "$KEY_PATH" ]]; then
  echo "SSH key already exists:"
  echo "  $KEY_PATH"
else
  echo "Creating SSH key:"
  echo "  $KEY_PATH"
  ssh-keygen -t ed25519 -C "$KEY_COMMENT" -f "$KEY_PATH"
fi

chmod 600 "$KEY_PATH"
chmod 644 "$KEY_PATH.pub"

cat > "$HOME/.ssh/config" <<EOF_CONFIG
Host github.com
  HostName github.com
  User git
  IdentityFile $KEY_PATH
  IdentitiesOnly yes
EOF_CONFIG

chmod 600 "$HOME/.ssh/config"

echo
echo "Public key:"
echo "----------------------------------------"
cat "$KEY_PATH.pub"
echo "----------------------------------------"
echo
echo "Add this public key to GitHub:"
echo "  GitHub > Settings > SSH and GPG keys > New SSH key"
echo
echo "Suggested title:"
echo "  $KEY_TITLE"
echo
echo "After adding the key, run:"
echo "  ssh -T git@github.com"
