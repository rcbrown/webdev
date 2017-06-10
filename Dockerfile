FROM ubuntu:17.10

LABEL author="Russ Brown" \
      version="0.0.1" \
      description="Contains React development stack and test server, plus AWS CLI" \
      source="https://github.com/rcbrown/webdev"

RUN apt-get update \
    && apt-get install -y \
       vim=2:8.0.0197-4ubuntu2 \
       git=1:2.11.0-4 \
       nodejs=4.8.2~dfsg-1ubuntu1 \
       npm=3.5.2-0ubuntu4 \
    && npm install -g create-react-app@1.3.1 \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && echo 'set -o vi' > /root/.bashrc \

WORKDIR /www
