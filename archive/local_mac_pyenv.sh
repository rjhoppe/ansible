#!/usr/bin/env zsh
echo "Installing Python..."
pyenv install 3.12.0
pyenv global 3.12.0

echo "Installing Ansible..."
brew install ansible

echo "Verifying Ansible installation..."
ansible --version