Steps to bootstrap new workstation

1. Pull out the relevant files for your OS into the workdir

Each deployment has 3 related scripts:
* env_OS_main -> local_linux_main
* env_OS_init -> local_linux_init
* env_OS_pyenv -> local_linux_pyenv

The env_OS_init and env_OS_pyenv scripts are called from the env_OS_main script

2. Grant the script files the necessary execution permissions
3. Run the env_OS_main.sh file