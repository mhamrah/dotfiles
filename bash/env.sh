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
export DOCKER_HOST=tcp://10.211.55.4:2375
export FLEETCTL_TUNNEL=10.211.55.4:22
export ETCDCTL_PEERS=http://10.211.55.4:4001

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
