#!/usr/bin/env bash

set -euo pipefail

echo "💻 Configurando Visual Studio Code..."

if [[ "${VSCODE_EXTENSIONS_ONLY:-false}" == "true" && ! $(command -v code >/dev/null 2>&1; echo $?) -eq 0 ]]; then
  echo "⚠️ VSCODE_EXTENSIONS_ONLY=true, mas o comando 'code' não está disponível."
  echo "👉 Instale/habilite o comando 'code' no VS Code e execute novamente."
  exit 1
fi

if ! command -v code >/dev/null 2>&1; then
  if [[ "${VSCODE_EXTENSIONS_ONLY:-false}" == "true" ]]; then
    echo "⚠️ Modo somente extensões habilitado e VS Code CLI ausente."
    exit 1
  fi

  echo "⬇️ Instalando VS Code..."
  if command -v snap >/dev/null 2>&1; then
    sudo snap install code --classic
    echo "✅ VS Code instalado"
  else
    echo "⚠️ Snap não encontrado. Pulando instalação automática do VS Code."
    echo "👉 Instale o VS Code manualmente e habilite o comando 'code' para instalar extensões."
    exit 0
  fi
else
  echo "✅ VS Code já instalado"
fi

echo "🔌 Instalando extensões..."

EXTENSIONS_CLOUD=(
  "amazonwebservices.aws-toolkit-vscode"
  "hashicorp.terraform"
)

EXTENSIONS_DEV=(
  "hashicorp.hcl"
  "ms-azuretools.vscode-docker"
  "redhat.vscode-yaml"
  "eamodio.gitlens"
  "dbaeumer.vscode-eslint"
  "github.copilot"
)

EXTENSIONS=("${EXTENSIONS_CLOUD[@]}" "${EXTENSIONS_DEV[@]}")
INSTALLED_EXTENSIONS="$(code --list-extensions)"

for ext in "${EXTENSIONS[@]}"; do
  if printf '%s\n' "${INSTALLED_EXTENSIONS}" | grep -q "^${ext}$"; then
    echo "✔ ${ext} já instalado"
  else
    echo "⬇️ Instalando ${ext}..."
    code --install-extension "${ext}"
  fi
done

echo "✅ VS Code pronto para uso!"
