alias dcb1="ssh -i ~/.ssh/dsa-beta.pem dsauser@sea-beta-dsa-content-01"
alias dcb2="ssh -i ~/.ssh/dsa-beta.pem dsauser@sea-beta-dsa-content-02"

alias dcc1="ssh -i ~/.ssh/dsa-beta.pem dsauser@sea-stg-dsa-content-01"
alias dcc2="ssh -i ~/.ssh/dsa-beta.pem dsauser@sea-stg-dsa-content-02"

alias dcp1="ssh -i ~/.ssh/dsa-prod.pem dsauser@sea-prod-dsa-content-01"
alias dcp2="ssh -i ~/.ssh/dsa-prod.pem dsauser@sea-prod-dsa-content-02"
alias dcp3="ssh -i ~/.ssh/dsa-prod.pem dsauser@sea-prod-dsa-content-03"

alias work="ssh mhamrah@nyclm6610"
alias mlh-cloud="ssh root@michaelhamrah.com"
alias adubs="ssh -i ~/.ssh/dsa-beta.pem ec2-user@adubs.gettyimages.io"

#Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias j=jump

#frequent commands
alias more="less"
alias mount_tas="sudo mount -t nfs fresutasnas.amer.gettywan.com:/tas/fs2/fadefs /mnt/tas/editorial && sudo mount -t nfs fresutasnas.amer.gettywan.com:/tas/fs2/fadcfs /mnt/tas/creative"
alias vi="vim"
alias ct="ctags ." #recurse and ignore is set in ctags
alias h="history"
alias hs="h | ag"
alias al="vim ~/.dotfiles/bash/aliases.sh"
alias pal="vim ~/Dropbox/Trunk/alias.sh"
#alias gr="grep -i"
alias s="source ~/.zshrc"
#alias ta="tmux attach || tmux "
alias es="env | grep"
alias server="serve ."

# Copy my public key to the pasteboard
#alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
function del() { sed $@d ~/.ssh/known_hosts > ~/.ssh/known_hosts; }

#vagrant commans (v*)
#alias vs="vagrant ssh"
#alias vu="vagrant up"
#alias vr="vagrant reload"
#alias vp="vagrant provision"
#alias vbl="vagrant box list"
#alias vbr="vagrant box remove"
#alias vd="vagrant destroy"
#alias vh="vagrant halt"

#docker
alias drd="docker run -d"
alias drs="docker run -i -t"
alias dps="docker ps"
alias di="docker images"
alias drsc="docker ps -a -q | xargs docker rm"
alias drmi="docker images | grep '<none>' | awk '{ print $3 }' | xargs docker rmi"

#git
alias g="git"
alias gs="git status "
alias gc="git add . --all && git commit -m "
alias gp="git push"
alias gd="git diff"
#alias glist='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk '"'! a["'$0'"]++'"
alias gmlh="glist | grep Hamrah"
alias gclean="git branch --merged | grep -v '^* master$' | grep -v '^  master$' | xargs git branch -d"
alias grclean="git checkout master && git branch -r --merged | grep -v master | sed -e 's/origin\//:/' | xargs git push origin"

# Detect which `ls` flavor is in use
#if ls --color > /dev/null 2>&1; then # GNU `ls`
#	colorflag="--color"
#else # OS X `ls`
#	colorflag="-G"
#fi

# List all files colorized in long format
#alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
#alias la="ls -la ${colorflag}"

#alias ls="command ls ${colorflag}"
#export LSCOLORS="exGxBxDxCxEgEdxbxgxcxd"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
#alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

#homebrew
alias hrm="brew cleanup --force -s"
#alias bc="brew cask"

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


# IP addresses
#don't care about growl
#alias ip='IP=`dig +short myip.opendns.com @resolver1.opendns.com`; growlnotify -s -a terminal -t "IP Address" -m "${IP}"'
#alias lip='IP=`ipconfig getifaddr en0`; growlnotify -s -a terminal -t "Local IP" -m "${IP}"'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

#functions

#serve a directory locally
function serve() {
  local port="${1:-4040}"
  open "http://localhost:${port}/"
  twistd -n web --path . -p "$port"
}
#alias serve="ruby -run -e httpd . -p 9090"
#also python/twistd: twistd -n web --path .
#node has a serve npm
#http://get-serve.com/documentation/usage

#Fleet
alias flu="fleetctl list-units"
alias fluf="fleetctl list-unit-files"
alias fst="fleetctl status"
alias fj="fleetctl journal -follow -lines 30"
alias fs="fleetctl start"
alias fd="fleetctl destroy"
