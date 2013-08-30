export TM_RUBY=/usr/local/bin/ruby
export GOROOT=/usr/local/Cellar/go/1.0.3
export GOPATH=~/dev/go
export PGDATABASE=postgres

# Colors in Vim.
export TERM='xterm-256color'

# No duplicates in history.
export HISTCONTROL=ignoredups

export AWS_CREDENTIAL_FILE=~/.ssh/gyi-aws-cred
export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ssh/gyi-production.pem | /usr/bin/head -1)"

source ~/.ssh/gyi-aws-cred.env
