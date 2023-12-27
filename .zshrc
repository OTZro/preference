# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
 
# Example aliases
# alias zshconfig="mate ~/.zshrc"
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
#COMPLETION_WAITING_DOTS="true"
 
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)
 
source $ZSH/oh-my-zsh.sh
 
# Customize to your needs...
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/go/bin"
export PATH="$PATH:/Users/ming-changsung/.composer/vendor/bin"
export PATH="$PATH:/usr/local/mysql/bin"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:~/.platformio/penv/bin
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}%t $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#autoload predict-on 

#zle -N predict-toggle
#bindkey '^Z'   predict-toggle
#predict-toggle() {
#    ((predict_on=1-predict_on)) && predict-on || predict-off
#}
#zstyle ':predict' toggle true
#zstyle ':predict' verbose true

# -------------------------------------------------------------------
# Custom setting
# -------------------------------------------------------------------
  

# Disable the git prompt info to speed up.
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# -------------------------------------------------------------------
# Pyenv Setting
# -------------------------------------------------------------------
# export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# -------------------------------------------------------------------
# Pyenv Setting
# -------------------------------------------------------------------
export PATH=$PATH:$HOME/.local/bin


# -------------------------------------------------------------------
# Brew Setting
# -------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
alias ibrew="arch -x86_64 /usr/local/bin/brew"

# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
 
alias ga='addAndStatus'
alias gp='git push'
alias gpb='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gl='tig log'
alias gs='git status'
alias ts='tig status'
alias gd='git diff'
alias gds='git diff --cached'
alias gm='git commit -m'
alias gnm='git commit -n -m'
alias gma='git commit --amend --no-edit'
alias gmar='git commit --amend'
alias gb='git branch'
alias gc='git checkout'
alias gst='git stash'
alias gstp='git stash pop'
alias gcd='git checkout develop'
alias gcs='git checkout stage'
alias gcm='git checkout main'
alias gcdp='git checkout develop && git pull --rebase'
alias gcsp='git checkout stage && git pull --rebase'
alias gcmp='git checkout main && git pull --rebase'
alias gffs='gcdp && git flow feature start'
alias gffc='git flow feature checkout'
alias gffp='git flow feature publish'
alias gffpc='gffp ${$(git rev-parse --abbrev-ref HEAD)#feature/}'
alias gstart='gcdp && gffs'
alias gcdpc='current=$(git rev-parse --abbrev-ref HEAD) && gcdp && gc $current'
alias gcspc='current=$(git rev-parse --abbrev-ref HEAD) && gcsp && gc $current'
alias gcmpc='current=$(git rev-parse --abbrev-ref HEAD) && gcmp && gc $current'
alias gfff='git flow feature finish '
alias gfffc='gfff ${$(git rev-parse --abbrev-ref HEAD)#feature/}'
alias gr='git reset'
alias grb='git rebase'
alias grd='git rebase develop'
alias grs='git rebase stage'
alias grm='git rebase main'
alias gpu='git pull'
alias gpur='git pull --rebase'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
# git recent work
alias grw="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:             green)%(committerdate:relative)%(color:reset))'"
alias gt='git log --graph --pretty=oneline --abbrev-commit'
alias grenew='gpu --rebase && gcdpc && grd && gp -f'
alias gremovemerged='git checkout develop && git branch --merged | grep -v "\*" | grep "/" | xargs -n 1 git branch -d && git fetch --prune'
alias gfinish='current=$(git rev-parse --abbrev-ref HEAD) && gcd && git merge $current && gb -d $current && git push origin --delete $current'


# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'
 
alias dpa='docker-compose exec workspace php artisan'

# Ignore tracking file in git
alias gignore='git update-index --skip-worktree'
alias gunignore='git update-index --no-skip-worktree'
alias gignored='git ls-files -v|grep ^S'

# -------------------------------------------------------------------
# Docke aliases
# -------------------------------------------------------------------

alias dps='docker ps'
alias dkill='docker kill'
alias dkillall='docker kill $(docker ps -q)'
alias drm='docker rm'
alias drmall='docker rm $(docker ps -a -q)'

alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'

alias k='kubectl'

# git helper
function addAndStatus() { git add -A "$@"; git status; }

# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------
 
alias cl='clear'
alias pm='python manage.py'
alias p='python'
 

# -------------------------------------------------------------------
# AWS Login
# -------------------------------------------------------------------
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 478041131377.dkr.ecr.us-west-2.amazonaws.com

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
 
# return my IP address
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
     ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
     ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}


# -------------------------------------------------------------------
# GO bin SETTING 
# -------------------------------------------------------------------
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

#export PATH=$HOME/.composer/vendor/bin:/Users/ming-changsung/.nvm/versions/node/v6.0.0/bin:/usr/local/Cellar/php56/5.6.31_7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/Users/ming-changsung/.composer/vendor/bin:/Users/ming-changsung/go/bin:/Users/ming-changsung/.vimpkg/bin
#export PATH="/usr/local/opt/php@7.1/bin:$PATH"
#export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

# -------------------------------------------------------------------
# NVM SETTING 
# -------------------------------------------------------------------
#export NVM_DIR="$HOME/.nvm"
#export NVM_SYMLINK_CURRENT=true
#. "$(brew --prefix nvm)/nvm.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# -------------------------------------------------------------------
# Working setting 
# -------------------------------------------------------------------

alias cf='cd ~/gofreight/fms'
alias cg='cd ~/gofreight/go-payment'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NODE_OPTIONS="--max-old-space-size=4096"

# Fix GoFreight reset_db "RE error: illegal byte sequence" bug
#export LC_CTYPE=C 
#export LANG=C


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chang/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chang/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chang/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chang/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
