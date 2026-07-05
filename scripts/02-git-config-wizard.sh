#!/usr/bin/env bash
set -euo pipefail

echo "========================================"
echo "Git Configuration Wizard"
echo "========================================"
echo

current_name="$(git config --global user.name || true)"
current_email="$(git config --global user.email || true)"
current_branch="$(git config --global init.defaultBranch || true)"

echo "Current Git configuration:"
echo "  user.name          : ${current_name:-not configured}"
echo "  user.email         : ${current_email:-not configured}"
echo "  init.defaultBranch : ${current_branch:-not configured}"
echo

read -rp "Git author name [${current_name:-Yoshiyuki Kono}]: " git_name
git_name="${git_name:-${current_name:-Yoshiyuki Kono}}"

read -rp "Git email [${current_email:-}]: " git_email
git_email="${git_email:-${current_email:-}}"

if [[ -z "$git_email" ]]; then
  echo "ERROR: Git email is required."
  exit 1
fi

read -rp "Default branch [${current_branch:-main}]: " default_branch
default_branch="${default_branch:-${current_branch:-main}}"

echo
echo "Summary:"
echo "  user.name          : $git_name"
echo "  user.email         : $git_email"
echo "  init.defaultBranch : $default_branch"
echo

read -rp "Apply these settings? [Y/n]: " confirm
confirm="${confirm:-Y}"

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  git config --global user.name "$git_name"
  git config --global user.email "$git_email"
  git config --global init.defaultBranch "$default_branch"

  echo
  echo "Git configuration updated."
  git config --global --list | grep -E 'user.name|user.email|init.defaultBranch' || true
else
  echo "Canceled."
fi
