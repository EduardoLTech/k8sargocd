#!/bin/bash

echo "Iniciando a remoção do Docker Desktop e arquivos residuais do macOS..."

# Fechar o Docker Desktop se estiver em execução
echo "Encerrando o Docker Desktop..."
osascript -e 'quit app "Docker"'

# Remover o aplicativo Docker Desktop
echo "Removendo o aplicativo Docker Desktop..."
rm -rf /Applications/Docker.app

# Remover arquivos de configuração e dados residuais
echo "Removendo arquivos de configuração e dados..."
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/Library/Application\ Support/Docker
rm -rf ~/Library/Group\ Containers/group.com.docker
rm -rf ~/.docker
rm -rf ~/Library/Logs/Docker

# Remover o socket Docker e outros arquivos temporários
echo "Removendo socket Docker e arquivos temporários..."
rm -rf /var/run/docker.sock

# Remover ferramentas instaladas pelo Homebrew (se aplicável)
if command -v brew &> /dev/null; then
  echo "Removendo ferramentas relacionadas ao Docker instaladas pelo Homebrew..."
  brew uninstall --ignore-dependencies docker docker-compose docker-cli docker-buildx docker-credential-helper
else
  echo "Homebrew não encontrado, pulando esta etapa."
fi

# Esvaziar a Lixeira
echo "Esvaziando a Lixeira..."
rm -rf ~/.Trash/*

echo "Remoção completa! O Docker Desktop foi removido do seu sistema."
