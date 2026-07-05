#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
  build-essential \
  curl \
  wget \
  git \
  jq \
  unzip \
  zip \
  ca-certificates \
  gnupg \
  lsb-release \
  htop \
  tree \
  make \
  pkg-config
