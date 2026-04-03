# 🚀 AWS Dev Environment Onboarding

Configuração automatizada de onboarding para um
**ambiente de desenvolvimento AWS pronto para uso corporativo**.

---

## 🏢 Visão Geral

Este projeto oferece uma forma padronizada de configurar um ambiente local
para fluxos de trabalho baseados em AWS.

Ele reduz o tempo de onboarding e garante consistência entre times ao
automatizar a instalação de ferramentas essenciais.

> Inspirado em práticas reais de DevOps e Engenharia de Cloud.

---

## 🎯 Objetivos

- Padronizar ambientes de desenvolvimento
- Eliminar erros de configuração manual
- Permitir configurações reproduzíveis

De acordo com boas práticas da AWS, configurar corretamente a CLI e o ambiente
é essencial para interagir programaticamente com os serviços AWS.

---

## 🛠️ Tecnologias

- AWS CLI
- Terraform
- Bash scripting
- Linux (Ubuntu / WSL)
- Git

---

## 📦 O que é instalado

- AWS CLI (v2)
- Terraform
- Git
- Curl, unzip e pacotes base
- zsh + oh-my-zsh
- Ferramentas de desenvolvimento opcionais

---

## ⚙️ Arquitetura

Máquina do Desenvolvedor (WSL/Linux)  
↓  
Script de Setup (Bash)  
↓  
AWS CLI + Terraform  
↓  
Conta AWS (acesso baseado em SSO)

Ambientes modernos devem ser reproduzíveis e automatizados, evitando
configuração manual e inconsistências.

---

## ▶️ Primeiros Passos

### 1. Clone o repositório

```bash
git clone https://github.com/Ederluccas/aws-dev-environment-onboarding.git
cd aws-dev-environment-onboarding
```

### 2. Execute o setup

```bash
chmod +x scripts/*.sh
./scripts/setup.sh
```

### 3. Configure o AWS SSO

```bash
aws configure sso
```

---

## 🌿 Git: Branches, Commit e Push

### Diferenças rápidas

- `branch`: linha paralela de trabalho para isolar mudanças sem afetar a
  principal.
- `commit`: registro local e versionado de um conjunto de alterações.
- `push`: envio dos commits locais para o repositório remoto.

### Fluxo recomendado

```bash
# 1. Criar uma branch para a tarefa
git checkout -b feature/config-terminal

# 2. Fazer as alterações desejadas

# 3. Verificar o que mudou
git status
git diff

# 4. Adicionar os arquivos
git add .

# 5. Criar o commit
git commit -m "Adiciona configuração de terminal"

# 6. Enviar a branch para o remoto pela primeira vez
git push -u origin feature/config-terminal

# 7. Nos próximos envios, basta usar
git push
```

### Quando usar cada um

- Use `branch` quando começar uma funcionalidade, correção ou experimento.
- Use `commit` quando terminar uma etapa lógica do trabalho.
- Use `push` quando quiser publicar os commits no GitHub e abrir ou
  atualizar um PR.

### Boas práticas

- Mantenha commits pequenos e objetivos.
- Use nomes de branch descritivos, como `feature/...`, `fix/...` ou `chore/...`.
- Antes do `push`, rode `git status` e confira se não há arquivos inesperados.

---

## 🧹 Lint de Markdown

Este repositório usa uma configuração local do `markdownlint-cli2` em
[.markdownlint-cli2.jsonc](.markdownlint-cli2.jsonc) para evitar falhas por
limite de linha em textos longos da documentação.

---

## 📁 Estrutura do Projeto

```text
scripts/        -> Scripts de instalação
config/         -> Modelo de variáveis de ambiente
docs/           -> Documentação
.github/        -> Workflows de CI
```

---

## 💻 Perfil VS Code AWS/DEVOPS

O perfil recomendado para trabalhar com AWS e Terraform no VS Code é o
`aws-devops`. Ele mantém apenas as extensões que fazem sentido no dia a dia
com nuvem e infraestrutura como código.

Este repositório também inclui [recomendações do workspace](.vscode/extensions.json)
para o VS Code sugerir automaticamente esse conjunto ao abrir o projeto.

### Extensões do perfil `aws-devops`

- AWS Toolkit  
  -> Gerencie recursos AWS, execute funções Lambda e interaja com
     serviços diretamente pelo editor

- Terraform (HashiCorp)  
  -> Destaque de sintaxe, IntelliSense, validação, formatação e
     integração de comandos Terraform

- HCL (HashiCorp Configuration Language)  
  -> Suporte para configurações baseadas em HashiCorp
     (Terraform, Vault, Consul)

- Docker  
  -> Gerencie containers e Dockerfiles

- YAML (RedHat)  
  -> Validação e auto-completar para YAML (muito usado em CI/CD e
     Kubernetes)

- GitLens  
  -> Recursos avançados de Git e rastreamento de histórico

### Modo completo opcional

Se você também quiser ESLint e GitHub Copilot, use o perfil `full`.

## ⚙️ Instalação via CLI

Instale o perfil padrão com:

```bash
VSCODE_PROFILE=aws-devops bash scripts/install_vscode.sh
```

Para instalar o perfil completo:

```bash
VSCODE_PROFILE=full bash scripts/install_vscode.sh
```

Se preferir instalar extensões individualmente, use:

```bash
code --install-extension amazonwebservices.aws-toolkit-vscode
code --install-extension hashicorp.terraform
code --install-extension hashicorp.hcl
code --install-extension ms-azuretools.vscode-docker
code --install-extension redhat.vscode-yaml
code --install-extension eamodio.gitlens
code --install-extension dbaeumer.vscode-eslint
code --install-extension github.copilot
```

---

## 🖥️ Configuração de Terminal (zsh + oh-my-zsh)

O setup também configura um terminal moderno para desenvolvimento:

- Instala `zsh`
- Instala `oh-my-zsh` em modo não interativo
- Permite definir o zsh como shell padrão via variável de ambiente

Para executar apenas essa etapa:

```bash
bash scripts/install_terminal.sh
```

Variáveis úteis em `config/.env`:

- `SKIP_TERMINAL_SETUP=true` para pular a configuração de terminal no
  setup completo
- `ZSH_SET_DEFAULT=true` para tentar definir o zsh como shell padrão

---

## 🧠 Explicação (nível mercado)

Essas extensões cobrem **3 pilares que empresas exigem**:

### 1. ☁️ Integração com Cloud

- AWS direto no editor

### 2. 🧠 IaC (Infra as Code)

- Terraform com autocomplete, validação e formatação

### 3. ⚙️ Produtividade & DevOps

- Docker, YAML, Git e CI/CD

---

## 🔥 Extra (diferencial)

Se quiser deixar nível empresa mesmo, adicione também:

### 🔐 Segurança & Custos (Avançado)

- Checkov  
  -> Scanner de segurança para Terraform

- Infracost  
  -> Estimativa de custos AWS diretamente no código

---

## 📄 Licença

Licença MIT. Veja [LICENSE](LICENSE).
