# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias isitmfbt="wget -qO - isitmfbt.com | grep 'theTime' | sed -e 's/<[^>]*>//g'"
alias ls='ls -l'
alias e='subl .'
alias mt="hg qref -m 'try: -b do -p emulator,panda -u marionette-webapi -t none'"
alias dt="hg qref -m 'try: -b do -p linux,macosx64,win32,linux_gecko,linux64_gecko -u marionette,marionette-webapi,gaia-ui-test -t none'"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenvwrapper github node npm brew web-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/mozconfigwrapper.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin:~/android-sdk-macosx/platform-tools/

alias irc='ssh -L20000:localhost:20000 dburns@people.mozilla.com'
alias lin='ssh -L 20001:localhost:20000 automatedtester@secure.theautomatedtester.co.uk'
alias buildspec='cat *_*.html > webdriver-spec.html'
alias ls='ls -G'
alias got='git'
alias gut='git'
alias pythom='python'
alias depression='ack TODO'
unsetopt correct_all

pr () {
  local url="$1"
    if [ "$url" == "" ] && type pbpaste &>/dev/null; then
        url="$(pbpaste)"
      fi
    if [[ "$url" =~ ^[0-9]+$ ]]; then
        local us="$2"
        if [ "$us" == "" ]; then
              us="origin"
              fi
              local num="$url"
              local o="$(git config --get remote.${us}.url)"
              url="${o}"
              url="${url#(git:\/\/|https:\/\/)}"
              url="${url#git@}"
              url="${url#github.com[:\/]}"
              url="${url%.git}"
              url="https://github.com/${url}/pull/$num"
            fi
          local p='^https:\/\/github.com\/[^\/]+\/[^\/]+\/pull\/[0-9]+$'
        if ! [[ "$url" =~ $p ]]; then
            echo "Usage:"
            echo " pr <pull req url>"
            echo " pr <pull req number> [<remote name>=origin]"
            type pbpaste &>/dev/null &&
                  echo "(will read url/id from clipboard if not specified)"
            return 1
          fi
        local root="${url/\/pull\/+([0-9])/}"
      local ref="refs${url:${#root}}/head"
    echo git pull $root $ref
  git pull $root $ref
  }
