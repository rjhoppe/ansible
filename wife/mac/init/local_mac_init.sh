#!/usr/bin/env zsh
echo "Installing xcode"
xcode-select --install

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/rhoppe/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/rhoppe/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Check if installation was successful
if [[ $(uname -m) == 'arm64' ]]; then
    BREW_PATH="/opt/homebrew/bin/brew"
else
    BREW_PATH="/usr/local/bin/brew"
fi

if [ ! -f "$BREW_PATH" ]; then
    echo "Homebrew installation failed - brew executable not found at $BREW_PATH"
    exit 1
fi

echo "Homebrew installation completed. Brew path: $BREW_PATH"

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