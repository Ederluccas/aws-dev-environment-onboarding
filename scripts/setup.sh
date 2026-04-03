#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

if [[ -f "${REPO_DIR}/config/.env" ]]; then
	set -a
	# shellcheck disable=SC1091
	source "${REPO_DIR}/config/.env"
	set +a
fi

if ! command -v apt-get >/dev/null 2>&1; then
	echo "❌ Este setup foi projetado para distribuições com apt-get (Ubuntu/Debian/WSL)."
	exit 1
fi

echo "🚀 Iniciando setup do ambiente de desenvolvimento AWS..."

"${SCRIPT_DIR}/install_base.sh"
"${SCRIPT_DIR}/install_aws.sh"
"${SCRIPT_DIR}/install_terraform.sh"

if [[ "${SKIP_TERMINAL_SETUP:-false}" == "true" ]]; then
	echo "⏭️  Pulando configuração de terminal (zsh + oh-my-zsh)"
else
	"${SCRIPT_DIR}/install_terminal.sh"
fi

if [[ "${SKIP_VSCODE:-false}" == "true" ]]; then
	echo "⏭️  Pulando configuração do VS Code"
else
	echo "💻 Configurando VS Code..."
	"${SCRIPT_DIR}/install_vscode.sh"
fi

if [[ "${SKIP_DEV_TOOLS:-false}" == "true" ]]; then
	echo "⏭️  Pulando ferramentas opcionais de desenvolvimento"
else
	"${SCRIPT_DIR}/install_dev_tools.sh"
fi

echo "✅ Setup concluído!"
echo "➡️ Execute: aws configure sso"
