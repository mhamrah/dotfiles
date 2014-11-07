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

if [ -f /usr/local/bin/boot2docker ]; then
 # export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
 export DOCKER_HOST=tcp://192.168.59.104:2376
 export DOCKER_CERT_PATH=/Users/mhamrah/.boot2docker/certs/boot2docker-vm
 export DOCKER_TLS_VERIFY=1
fi

#export IP_ADDR=`/sbin/ifconfig en0 | grep 'inet ' | cut -d: -f2 | awk '{ print $2}'`

eval "$(hub alias -s)"
