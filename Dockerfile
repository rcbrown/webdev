FROM ubuntu:16.04

LABEL author="Russ Brown" \
      version="0.0.1" \
      description="Contains React development stack and test server, plus AWS CLI" \
      source="https://github.com/rcbrown/webdev"

# Add nodesource repos to apt. They want you to run their script (https://deb.nodesource.com/setup_6.x) to install
# nodejs, but there was no way to pin versions using that, so I had to reverse-engineer it.

COPY nodesource.gpg.key /

RUN apt-get update \
    && apt-get install -y apt-transport-https=1.2.20 \
    && apt-key add /nodesource.gpg.key \
    && echo 'deb https://deb.nodesource.com/node_6.x xenial main' > /etc/apt/sources.list.d/nodesource.list \
    && echo 'deb-src https://deb.nodesource.com/node_6.x xenial main' >> /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install nodejs=6.11.0-1nodesource1~xenial1

RUN apt-get install -y python3-pip=8.1.1-2ubuntu0.4 \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install -I awscli==1.11.107 \
    && pip install -I aws-shell==0.1.1
    

# Break layer here--the above is broadly useful.

RUN npm install -g create-react-app@1.3.1

# Now my personal preferences for the one true editor.

RUN apt-get install -y \
        vim=2:7.4.1689-3ubuntu1.2 \
    && echo 'set -o vi' > /root/.bashrc

EXPOSE 3000
