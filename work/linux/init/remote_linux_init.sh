#!/usr/bin/env bash
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install -y \
    ssh \
    python3 \
    python3-pip \
    curl \
    git \
    build-essential

echo "Installing Ansible..."
python3 -m pip install --upgrade pip
python3 -m pip install ansible

echo "Verifying Ansible installation..."
ansible --version

# Check if SSH is installed (required for remote management)
echo "Checking for SSH..."
which ssh > /dev/null
if [ $? -ne 0 ]; then
    echo "SSH is not installed. Installing SSH..."
    sudo apt-get install -y openssh-client
else
    echo "SSH is already installed."
fi

# Ensure Python is installed (required for Ansible on remote hosts)
echo "Checking if Python3 is installed..."
which python3 > /dev/null
if [ $? -ne 0 ]; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get install -y python3
else
    echo "Python3 is already installed."
fi

# Set up SSH key pair for Ansible (if you want to use SSH keys for authentication)
echo "Checking for existing SSH key..."
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "No SSH key found. Generating a new SSH key pair..."
    ssh-keygen -t rsa -b 4096 -C "TEMPLATE@EMAIL.COM" -f ~/.ssh/id_rsa -N ""
    echo "SSH key generated. Add the public key to your remote hosts' authorized_keys."
else
    echo "SSH key already exists."
fi

# Done!
echo "Local machine is ready for running Ansible playbooks."
echo "Use 'ansible-playbook' command to run your playbooks."