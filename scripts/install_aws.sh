#!/usr/bin/env bash

set -euo pipefail

if command -v aws >/dev/null 2>&1; then
  echo "✅ AWS CLI já está instalado"
  aws --version
  exit 0
fi

echo "☁️ Instalando AWS CLI v2..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

ARCH="$(uname -m)"
case "${ARCH}" in
  x86_64)
    AWSCLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
    ;;
  aarch64|arm64)
    AWSCLI_URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip"
    ;;
  *)
    echo "❌ Arquitetura não suportada para instalação automática do AWS CLI: ${ARCH}"
    exit 1
    ;;
esac

curl -fsSL "${AWSCLI_URL}" -o "${TMP_DIR}/awscliv2.zip"
unzip -q "${TMP_DIR}/awscliv2.zip" -d "${TMP_DIR}"
sudo "${TMP_DIR}/aws/install"

aws --version
