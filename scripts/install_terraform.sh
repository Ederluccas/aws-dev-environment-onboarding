#!/usr/bin/env bash

set -euo pipefail

if command -v terraform >/dev/null 2>&1; then
  echo "✅ Terraform já está instalado"
  terraform version | head -n 1
  exit 0
fi

echo "🧠 Instalando Terraform..."

sudo install -m 0755 -d /etc/apt/keyrings
TMP_GPG="$(mktemp)"
trap 'rm -f "${TMP_GPG}"' EXIT
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor > "${TMP_GPG}"
sudo install -m 0644 "${TMP_GPG}" /etc/apt/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list >/dev/null
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y terraform

terraform version | head -n 1
