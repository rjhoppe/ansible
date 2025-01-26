#!/usr/bin/env zsh
handle_reload() {
    # Source zshrc
    if [ -f ~/.zshrc ]; then
        echo "Reloading zshrc..."
        source ~/.zshrc
    fi
    
    # Continue with second script
    echo "Continuing with second script..."
    ./local_mac_pyenv.sh
}

./local_mac_init.sh
SCRIPT1_STATUS=$?

if [ $SCRIPT1_STATUS -eq 0 ]; then
    handle_reload
else
    echo "Script1 failed with status $SCRIPT1_STATUS"
    exit 1
fi

cd playbooks
ansible-playbook -i hosts /playbooks/mac_main.yaml