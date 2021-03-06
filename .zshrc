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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:/usr/local/go/bin
export PATH="$PATH:/Users/ming-changsung/.composer/vendor/bin"
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
RPROMPT='$(_vi_status)%{$(echotc UP 1)%}%t $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
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
#export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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
alias gcdp='git checkout develop && git pull --rebase'
alias gffs='git flow feature start'
alias gffp='git flow feature publish'
alias gffpc='gffp ${$(git rev-parse --abbrev-ref HEAD)#feature/}'
alias gstart='gcdp && gffs'
alias gcdpc='current=$(git rev-parse --abbrev-ref HEAD) && gcdp && gc $current'
alias gfff='git flow feature finish '
alias gfffc='gfff ${$(git rev-parse --abbrev-ref HEAD)#feature/}'
alias gr='git rebase'
alias grd='git rebase develop'
alias gpu='git pull'
alias gpur='git pull --rebase'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gt='git log --graph --pretty=oneline --abbrev-commit'
alias grenew='gpu --rebase && gcdpc && grd && gp -f'
alias gremovemerged='git checkout develop && git branch --merged | grep -v "\*" | grep "/" | xargs -n 1 git branch -d && git fetch --prune'
alias gfinish='current=$(git rev-parse --abbrev-ref HEAD) && gcd && git merge $current && gb -d $current && git push origin --delete $current'


alias gofinish='current=$(git rev-parse --abbrev-ref HEAD) && gco && git merge $current && gb -d $current && git push origin --delete $current'
alias gco='git checkout olc-develop'
alias gro='git rebase olc-develop'
alias gcop='git checkout olc-develop && git pull --rebase'
alias gcopc='current=$(git rev-parse --abbrev-ref HEAD) && gcop && gc $current'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'
 
alias dpa='docker-compose exec workspace php artisan'

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
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
. "$(brew --prefix nvm)/nvm.sh"

# -------------------------------------------------------------------
# Working setting 
# -------------------------------------------------------------------

alias cf='cd ~/gofreight/fms'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Fix GoFreight reset_db "RE error: illegal byte sequence" bug
#export LC_CTYPE=C 
#export LANG=C
