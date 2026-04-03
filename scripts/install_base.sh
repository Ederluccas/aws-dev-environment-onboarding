#!/usr/bin/env bash

set -euo pipefail

echo "📦 Instalando pacotes base..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git \
  gnupg \
  lsb-release \
  software-properties-common \
  unzip
