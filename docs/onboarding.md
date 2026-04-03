# Guia de Onboarding

Este guia ajuda desenvolvedores a preparar um ambiente local de desenvolvimento AWS usando os scripts deste repositório.

## Pré-requisitos

- Ubuntu, Debian ou WSL com apt disponível
- acesso sudo
- acesso à internet para baixar pacotes

## Passos

1. Clone o repositório.
2. Torne os scripts executáveis.
3. Execute o script de setup.
4. Configure as credenciais de AWS SSO.
5. (Opcional) Ajuste o shell padrão para zsh.

## Comandos

```bash
git clone https://github.com/Ederluccas/aws-dev-environment-onboarding.git
cd aws-dev-environment-onboarding
chmod +x scripts/*.sh
./scripts/setup.sh
aws configure sso
chsh -s "$(command -v zsh)" "$USER"
```

## Validação

Verifique as versões instaladas:

```bash
aws --version
terraform version
git --version
```
