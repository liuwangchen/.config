# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/liuwangchen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# robbyrussell
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose kubectl go helm redis-cli)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#------------------------------------------startup------------------------------------------
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
figlet -w 100 hello~ $(whoami)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#------------------------------------------envirment------------------------------------------
export GOPATH=/Users/liuwangchen/work/go/gopath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:~/bin:$HOME/.pub-cache/bin:/usr/local/Cellar/pkg-config/0.29.2/bin:
export GO111MODULE=auto
export KUBECONFIG=~/.kube/config.yaml
export KUBE_EDITOR="/usr/local/bin/code --wait"
export ANDROID_HOME=/Users/liuwangchen/Library/Android/sdk
export ETCDCTL_API=3
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export DRACULA_THEME=/Users/liuwangchen/work/bash/zsh
export EDITOR='/usr/local/bin/nvim'

#------------------------------------------alias------------------------------------------
alias ll='ls -lh'
alias sf='shfmt -w'
alias update='source ~/.zshrc'
alias ansibleroot='ansible -bKk'
alias t='tree'
alias shfmt='shfmt -w'
alias vhosts='sudo vim /etc/hosts'
alias startgroovy='docker run -it -v ~/test:/work/ groovy /bin/bash'
alias cesquery='code ~/work/elk'
alias crestful='code ~/work/http'
alias cassist='code ~/assist'
alias cdoc='code /Users/liuwangchen/Documents/360/interface'
alias crosChrome='open -n /Applications/Google\ Chrome.app/ --args --disable-web-security  --user-data-dir=/Users/liuwangchen/Documents/testchrome'
alias cprofile='code ~/.zshrc'
alias rest='rest&'
alias faken='faken -i en7&'
alias kub='kubectl'
alias kcn='kubectl config set-context $(kub config current-context) --namespace'
alias gogogo='/Users/liuwangchen/work/go/gogogo/tool/gogogo.sh'
alias et='etcdctl'
alias ra='ranger'
alias nv='nvim'
alias f='fzf'
alias c='clear'
alias s='neofetch --color_blocks off'
alias vim='nvim'
alias vi='nvim'

#------------------------------------------fzf------------------------------------------
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --bind alt-k:down,alt-i:up --exact'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color fg:#D8DEE9,hl:#A3BE8C,fg+:#D8DEE9,hl+:#A3BE8C
--color pointer:#A3BE8C,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'
export FZF_COMPLETION_TRIGGER='**'

fk() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
fh() {
  $(history | f -m |awk -F " " '{for(i=2;i<=NF;i++){ printf("%s ",$i);} printf("\n")}')
}

j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

#------------------------------------------zsh bindkey------------------------------------------
bindkey '^[i' up-line-or-search
bindkey '^[k' down-line-or-search

#------------------------------------------function------------------------------------------
json() {
  if [[ "$#" -ne 0 ]]; then
      echo $@ | jq .
  fi
}
