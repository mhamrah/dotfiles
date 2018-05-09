#!/bin/sh

# git ppa
add-apt-repository ppa:git-core/ppa

# java ppa
add-apt-repository ppa:linuxuprising/java

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

# docker
apt-get install \
    build-essential \ 
    zsh \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    oracle-java10-installer \
    git \
    docker-ce \
    oracle-java10-set-default
