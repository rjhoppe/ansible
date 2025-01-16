FROM python:3.12-slim
ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1

RUN : \
    && apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

WORKDIR /ansible

COPY requirements.txt /ansible/
RUN pip install -r /ansible/requirements.txt

COPY . /ansible/

WORKDIR /ansible/playbooks
CMD ["ansible-playbook", "-i", "/ansible/hosts", "/ansible/playbooks/linux_main.yaml"]