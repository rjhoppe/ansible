#!/usr/bin/env bash
handle_reload() {
    # Source bashrc
    if [ -f ~/.bashrc ]; then
        echo "Reloading bashrc..."
        source ~/.bashrc
    fi
    
    # Continue with second script
    echo "Continuing with second script..."
    /ansible/local_linux_pyenv.sh
}

/ansible/local_linux_init.sh
SCRIPT1_STATUS=$?

if [ $SCRIPT1_STATUS -eq 0 ]; then
    handle_reload
else
    echo "Script1 failed with status $SCRIPT1_STATUS"
    exit 1
fi

cd playbooks
ansible-playbook -i /ansible/hosts /ansible/playbooks/linux_main.yaml