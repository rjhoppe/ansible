#!/usr/bin/env bash
echo "Installing Python..."
pyenv install 3.12.0
pyenv global 3.12.0

echo "Installing Ansible..."
python3 -m pip install --upgrade pip

# Make and source venv
# Never installs ansible ????

pip install -r ./requirements.txt

echo "Verifying Ansible installation..."
ansible --version