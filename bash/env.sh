export TM_RUBY=/usr/local/bin/ruby

export GOPATH=~/go2
export GO15VENDOREXPERIMENT=1
export PATH=$GOPATH/bin:$PATH

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

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

eval "$(hub alias -s)"

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

export EDITOR="vim"
export UBER_LDAP_UID="mlh"
