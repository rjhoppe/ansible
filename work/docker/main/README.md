## Usage

Alt main files to use for testing
* Move any docker_main.yaml files that are currently in the docker directory to the main directory
* Uncomment out your desired main file and move it into the docker directory
* Run the build cmd:
```
docker build -f py.Dockerfile -t ansible-playbook-test .
```