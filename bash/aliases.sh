alias mlh-cloud="ssh -i ~/.ssh/aws-mlh.pem ec2-user@23.23.186.107"
alias vi="vim"
alias gka="gitk --all"

alias ct="ctags -R . --exclude=target --exclude=vendor"
alias ctags="`brew --prefix`/bin/ctags"

alias discourse="ssh -i ~/.ssh/discourse.pem ubuntu@discourse.gtty.in"
alias devtools="ssh -i ~/.ssh/devtools.pem ec2-user@devtools.gtty.in"
function beta() { ssh -i ~/.ssh/dsa-beta.pem root@$@ ;}
function prod() { ssh -i ~/.ssh/dsa-prod.pem root@$@ ;}

alias dsa="cd ~/dev/gyi/dsa"
alias gy="cd ~/dev/gyi"
alias dgh="cd ~/dev/gh"
alias dp="cd ~/dev/p"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias v="mvim ."
alias h="history"
alias j="jobs"

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
#alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
#alias la="ls -la ${colorflag}"

#alias ls="command ls ${colorflag}"
#export LS_COLORS='di=93'
#export LS_COLORS='no=00:fi=00:di=92;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
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
alias ip='IP=`dig +short myip.opendns.com @resolver1.opendns.com`; growlnotify -s -a terminal -t "IP Address" -m "${IP}"'
alias lip='IP=`ipconfig getifaddr en0`; growlnotify -s -a terminal -t "Local IP" -m "${IP}"'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

