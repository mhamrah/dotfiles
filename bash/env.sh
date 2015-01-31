export TM_RUBY=/usr/local/bin/ruby
export PGDATABASE=postgres

export GOPATH=~/gd/code/go
export PATH="$PATH:$GOPATH/bin"

# Colors in Vim.
export TERM='xterm-256color'
# No duplicates in history.
#export HISTCONTROL=ignoredups

export VAGRANT_CPUS=6
export VAGRANT_MEMORY=8192
export VAGRANT_NFS=0

if [ -f ~/Dropbox/Trunk/env.sh ]; then
  source ~/Dropbox/Trunk/env.sh
fi

export DB_HOST=dsa-dev
export RMQ_HOST=dsa-dev
export ES_HOST=dsa-dev
export METADATA_DB_HOST=dsa-dev

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

eval "$(hub alias -s)"

export VAGRANT_DEFAULT_PROVIDER=parallels
#export DOCKER_HOST=tcp://10.211.55.7:2375
export FLEETCTL_TUNNEL=10.252.129.61:22
#export ETCDCTL_PEERS=http://10.211.55.7:4001
export FLEETCTL_ENDPOINT=http://10.252.129.61:4001


export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/mhamrah/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

export EDITOR="vim"
