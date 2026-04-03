#!/usr/bin/env bash

set -euo pipefail

echo "🧰 Instalando ferramentas opcionais de desenvolvimento..."

sudo apt-get install -y \
  jq \
  make \
  python3-pip \
  ripgrep

echo "✅ Ferramentas opcionais instaladas"
