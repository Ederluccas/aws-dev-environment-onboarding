#!/usr/bin/env bash

set -euo pipefail

echo "🖥️ Configurando terminal (zsh + oh-my-zsh)..."

if ! command -v apt-get >/dev/null 2>&1; then
  echo "⚠️ apt-get não encontrado. Pulando configuração de terminal."
  exit 0
fi

if ! command -v zsh >/dev/null 2>&1; then
  echo "⬇️ Instalando zsh..."
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y zsh
else
  echo "✅ zsh já instalado"
fi

OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
if [[ -d "${OH_MY_ZSH_DIR}" ]]; then
  echo "✅ oh-my-zsh já instalado"
else
  echo "⬇️ Instalando oh-my-zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅ oh-my-zsh instalado"
fi

if [[ "${ZSH_SET_DEFAULT:-false}" == "true" ]]; then
  ZSH_PATH="$(command -v zsh)"
  if chsh -s "${ZSH_PATH}" "${USER}"; then
    echo "✅ zsh definido como shell padrão para ${USER}"
  else
    echo "⚠️ Não foi possível definir o zsh como padrão automaticamente."
    echo "👉 Execute manualmente: chsh -s ${ZSH_PATH} ${USER}"
  fi
else
  echo "ℹ️ Shell padrão não alterado (ZSH_SET_DEFAULT=false)."
  echo "👉 Para ativar depois, execute: chsh -s $(command -v zsh) ${USER}"
fi

echo "✅ Configuração de terminal concluída"
