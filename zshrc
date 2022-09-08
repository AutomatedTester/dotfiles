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

alias zshconfig="vim ~/.zshrc"
alias e='code .'
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
plugins=(bazel fzf iterm2 python rust git github node npm brew web-search mercurial macos frontend-search)

source $ZSH/oh-my-zsh.sh
alias ls='exa'
source /usr/local/bin/mozconfigwrapper.sh
# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:/usr/X11/bin:/usr/local/Cellar/ruby/2.1.0/bin:/usr/local/opt/ccache/libexec
export JAVA_HOME=$(/usr/libexec/java_home )

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
export NVM_DIR=~/.nvm
export PATH="/usr/local/opt/nss/bin:$PATH"

source $(brew --prefix nvm)/nvm.sh
source $HOME/.cargo/env

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

#dotnet
export PATH="/usr/local/share/dotnet:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
# Bazel
export PATH=$PATH:/Users/davidburns/development/buildtools/bazel-bin/buildifier/darwin_amd64_stripped/buildifier

eval "$(rbenv init -)"
