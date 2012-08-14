export WORKON_HOME=$HOME/.virtualenvs
source $HOME/.virtualenvwrapper
export PATH=$PATH:/chromedriver

alias irc='ssh -L20000:localhost:20000 dburns@people.mozilla.com'
alias buildspec='cat *_*.html > webdriver-spec.html'
alias ls='ls -G'
alias got='git'
alias gut='git'
alias pythom='python'
alias depression='ack TODO'
alias mongo='~/Downloads/mongodb-osx-i386-2.0.0/bin/./mongod'
# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH=$PATH:/chromedriver
export WORKON_HOME=$HOME/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source $HOME/.virtualenvwrapper

export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=automatedtester.pem
export EC2_CERT=automatedtester.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

t

source $HOME/.zsh/git-prompt/zshrc.sh

export PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}:: $(git_super_status) %{\e[1;32m%} %~> %{\e[1;00m%} '
[ -x "/Applications/MacVim.app/Contents/MacOS/Vim" ] && alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
