FROM ubuntu:16.04

LABEL author="Russ Brown" \
      version="0.0.2" \
      description="Contains React development stack and test server, plus AWS CLI" \
      source="https://github.com/rcbrown/webdev"

# Add nodesource repos to apt. They want you to run their script (https://deb.nodesource.com/setup_6.x) to install
# nodejs, but there was no way to pin versions using that, so I had to reverse-engineer it. If the dependency goes stale,
# go to https://deb.nodesource.com/node_6.x/dists/xenial/main/binary-amd64/ to find the current version.

COPY nodesource.gpg.key /

RUN apt-get update \
    && apt-get install -y git=1:2.7.4-0ubuntu1.2 \
    && apt-get install -y apt-transport-https=1.2.24 \
    && apt-key add /nodesource.gpg.key \
    && echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list \
    && echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y nodejs=6.11.2-1nodesource1~xenial1 \
    && apt-get install -y curl=7.47.0-1ubuntu2.2 \
    && apt-get install -y python3-pip=8.1.1-2ubuntu0.4 \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install -I awscli==1.11.107 \
    && pip install -I aws-shell==0.1.1 \
    && apt-get install -y jq=1.5+dfsg-1 \
    && npm install -g create-react-app@1.3.1 \
    && apt-get install -y vim=2:7.4.1689-3ubuntu1.2 \
    && echo 'set -o vi' > /root/.bashrc

WORKDIR /www
