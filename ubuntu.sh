#!/bin/sh

apt-get update
apt install -y apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    wget

# git ppa
add-apt-repository -y ppa:git-core/ppa

# java ppa
add-apt-repository -y ppa:linuxuprising/java

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

add-apt-repository -y \
   "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ \
   $(lsb_release -cs)-pgdg \
   main"

add-apt-repository -y "deb [arch=amd64] https://packages.confluent.io/deb/4.1 stable main"

wget -qO - https://packages.confluent.io/deb/4.1/archive.key | sudo apt-key add -
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update

# docker
apt-get install -y \
    build-essential \ 
    zsh \
    git \
    docker-ce \
    oracle-java10-set-default \
    autojump \
    kubectl
    
apt autoremove

curl -sL git.io/antibody | sh -s

apt-get install oracle-java10-installer
apt-get install oracle-java10-set-default

pushd /tmp
git clone https://github.com/tj/n.git
pushd n
make install
popd
curl -LO https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.10.2.linux-amd64.tar.gz
popd

curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

