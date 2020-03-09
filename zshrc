# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
EDITOR=vim
HGEDITOR=$EDITOR

export HISTSIZE=10000000
export HISEFILESIZE=10000000

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="half-life"

alias relspec="git push w3c master && git push origin master && git co gh-pages && git merge master && git push origin gh-pages && git push w3c gh-pages && git co master"
alias fuck='$(thefuck $(fc -ln -1))'
alias zshconfig="vim ~/.zshrc"
alias isitmfbt="wget -qO - isitmfbt.com | grep 'theTime' | sed -e 's/<[^>]*>//g'"
alias ls='ls -l'
alias ato="git ci --author='Andreas Tolfsen <ato@mozilla.com>' --signoff"
alias e='atom .'
alias mt="hg qref -m 'try: -b do -p emulator,emulator-jb,emulator-kk,linux32_gecko,linux64_gecko,macosx64_gecko,win32_gecko -u marionette,marionette-webapi,gaia-ui-test,gaia-integrationi, gaia-ui-test-accessibility,gaia-ui-test-functional-1,gaia-ui-test-functional-2,gaia-ui-test-functional-3 -t none'"
alias dt="hg qref -m 'try: -b do -p linux,macosx64,macosx64_gecko,win32,linux_gecko,linux64_gecko,linux64-mulet -u marionette,marionette-webapi,gaia-ui-test,gaia-integration,web-platform-tests,crashtest-1,crashtest-2,crashtest-3,reftest-1,reftest-2,reftest-3,reftest-4,reftest-5,reftest-6,reftest-7,reftest-8,reftest-9,reftest-10,reftest-11,reftest-12,reftest-13,reftest-14,reftest-15,reftest-16,reftest-17,reftest-18,reftest-19,reftest-20 -t none'"
alias blobber="./mach clobber;./mach build"
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
plugins=(git github node npm brew web-search zsh-syntax-highlighting mercurial osx frontend-search)

source $ZSH/oh-my-zsh.sh
source /usr/local/bin/mozconfigwrapper.sh
# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin:~/android-sdk-macosx/platform-tools/:/usr/local/Cellar/ruby/2.1.0/bin:/usr/local/opt/ccache/libexec
export ANDROID_HOME=/Users/dburns/android-sdk-macosx
export JAVA_HOME=$(/usr/libexec/java_home )

alias irc='ssh -L 22091:localhost:22091 dburns@people.mozilla.com'
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

# added by travis gem
[ -f /Users/dburns/.travis/travis.sh ] && source /Users/dburns/.travis/travis.sh
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export NVM_DIR=~/.nvm
export PATH="/usr/local/opt/nss/bin:$PATH"

export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin
source $(brew --prefix nvm)/nvm.sh
source $HOME/.cargo/env
autoload -U bashcompinit && bashcompinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

