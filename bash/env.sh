export TM_RUBY=/usr/local/bin/ruby
export PGDATABASE=postgres

export GOPATH=~/Dropbox/code/go
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

if [ -f /usr/local/bin/boot2docker ]; then
  export DOCKER_HOST=tcp://localhost:4243
fi
