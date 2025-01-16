#!/usr/bin/env zsh
echo "Installing xcode"
xcode-select --install

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing ansible dependencies..."
brew install openssl readline sqlite3 xz zlib tcl-tk@8 git curl wget

echo "Cloning ansible repo..."
mkdir repos
cd repos
git clone https://github.com/rjhoppe/ansible.git
cd ansible/work

echo "Installing pyenv..."
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
exit 0