#!/usr/bin/env bash

echo "Installing xcode"
xcode-select --install

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing ansible dependencies..."
brew install openssl readline sqlite3 xz zlib tcl-tk@8
brew install pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
source "$SHELL"

pyenv install 3.12
pyenv global 3.12

brew install ansible
brew install ansible-lint