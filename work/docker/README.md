## INFO
Directory to test Ansible playbooks in various Docker configs

### py.Docker
The py.Dockerfile is intended to test the execution of the playbooks
Comment out playbooks as needed to reduce scope

### deb.Docker
This a full integration test designed to test a full configuration of a brand new Debian based machine. This involves the installation of Python (via pyenv) and then the completion of 3 bash scripts designed to download the dependencies necessary to apply the Ansible configuration.