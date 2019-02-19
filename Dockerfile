FROM node:latest

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV NODE_ENV production

RUN apt-get update

RUN apt-get install \
  git \
  curl \
  libsystemd-dev \
  build-essential \
  libssl-dev \
  net-tools

COPY package.json /root/dohnut/
COPY src/ /root/dohnut/src/

RUN cd /root/dohnut && npm install

RUN ln -s /root/dohnut/src/bin.js /usr/local/bin/dohnut

ENTRYPOINT ["dohnut"]