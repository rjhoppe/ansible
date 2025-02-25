# Must be a debian family image, full test of the Linux playbook suite
# Use py.Dockerfile for quicker testing of the individual playbooks
FROM debian:bookworm-slim
ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1

RUN : \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev liblzma-dev libssl-dev \
    libgdbm-dev libnss3-dev libffi-dev libsqlite3-dev libreadline-dev \
    libbz2-dev libcurl4-openssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

WORKDIR /ansible/
COPY . /ansible/

RUN : \
    && chmod +x /ansible/local_docker_pyenv.sh \
    && chmod +x /ansible/local_docker_init.sh \
    && chmod +x /ansible/local_docker_main.sh \
    && :

CMD ["/ansible/local_docker_main.sh"]