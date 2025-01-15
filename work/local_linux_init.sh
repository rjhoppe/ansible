#!/usr/bin/env bash
echo "Updating system packages..."
apt-get update -y && apt-get upgrade -y

echo "Installing required dependencies..."
apt-get install -y \
    ssh \
    curl \
    git \
    build-essential

# Install pyenv
echo "Installing Python and related ansible dependencies"
curl -fsSL https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile

exit 0