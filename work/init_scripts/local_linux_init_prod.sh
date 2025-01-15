#!/usr/bin/env bash
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install -y \
    ssh \
    curl \
    git \
    build-essential

# Install pyenv
curl -fsSL https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init - bash)"' >> ~/.profile

source "$SHELL"
pyenv install 3.12
pyenv global 3.12

echo "Installing Ansible..."
python3 -m pip install --upgrade pip
pip install -r ./requirements.txt

echo "Verifying Ansible installation..."
ansible --version

cd playbooks
ansible-playbook -i /ansible/hosts /ansible/playbooks/linux_main.yaml