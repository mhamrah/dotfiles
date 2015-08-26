export TM_RUBY=/usr/local/bin/ruby
export PGDATABASE=postgres

export GOPATH=~/go
#export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:/Users/mhamrah/dev/go/bin:$GOROOT/bin:$GOPATH/bin"

# Colors in Vim.
export TERM='xterm-256color'
# No duplicates in history.
#export HISTCONTROL=ignoredups

export VAGRANT_CPU=6
export VAGRANT_MEMORY=8192
export VAGRANT_NFS=0

if [ -f ~/Dropbox/Trunk/env.sh ]; then
  source ~/Dropbox/Trunk/env.sh
fi

export DB_HOST=docker
export RMQ_HOST=docker
export ES_HOST=docker
export METADATA_DB_HOST=docker

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

eval "$(hub alias -s)"

#export VAGRANT_DEFAULT_PROVIDER=parallels
export FLEETCTL_ENDPOINT=http://gotham.gettyimages.io:8080
export FLEETCTL_SSH_USERNAME=core
export FLEETCTL_STRICT_HOST_KEY_CHECKING=false
#export ETCDCTL_PEERS=http://10.211.55.7:4001


#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/mhamrah/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

eval "$(docker-machine env dev)"

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

export EDITOR="vim"
