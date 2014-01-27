alias mlh-cloud="ssh root@michaelhamrah.com"
alias vi="vim"
alias gka="gitk --all"

#alias ct="ctags -R . --exclude=target --exclude=vendor"
#alias ctags="`brew --prefix`/bin/ctags"

function beta() { ssh -i ~/.ssh/dsa-beta.pem root@$@ ;}
function prod() { ssh -i ~/.ssh/dsa-prod.pem root@$@ ;}

alias dsa="cd ~/dev/gyi/dsa"
alias inf="cd ~/dev/gyi/infrastructure"
alias dgh="cd ~/dev/gh"
alias dp="cd ~/dev/p"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias v="mvim"
alias h="history"
alias j="jobs"
alias dot="cd ~/.dotfiles"
alias s="source ~/.bash_profile"
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vr="vagrant reload"
alias al="mvim ~/.dotfiles/bash/aliases.sh"
alias gr="grep -i"
#git
alias g="git"
alias gs="git status "
alias gc="git add . --all && git commit -m "
alias gp="git push"
alias gd="git diff"
alias gco="git checkout "
alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

#alias ls="command ls ${colorflag}"
#export LSCOLORS="exGxBxDxCxEgEdxbxgxcxd"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"


# Flush Directory Service cache
alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# IP addresses
#don't care about growl
#alias ip='IP=`dig +short myip.opendns.com @resolver1.opendns.com`; growlnotify -s -a terminal -t "IP Address" -m "${IP}"'
#alias lip='IP=`ipconfig getifaddr en0`; growlnotify -s -a terminal -t "Local IP" -m "${IP}"'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

#required for new copy-pipe with tmux/vim
alias mvim="reattach-to-user-namespace mvim"
alias vim="reattach-to-user-namespace vim"
