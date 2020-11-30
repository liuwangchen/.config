#------------------------------------------startup------------------------------------------
export ZSH="/Users/liuwangchen/.oh-my-zsh"
# robbyrussell
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose kubectl golang helm redis-cli zsh-autosuggestions tig)
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
export TERM_ITALICS=true
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
# figlet -w 100 hello~ $(whoami)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#------------------------------------------envirment------------------------------------------
export GOPATH=/Users/liuwangchen/work/go/gopath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:~/bin:$HOME/.pub-cache/bin:/usr/local/Cellar/pkg-config/0.29.2/bin:
export GO111MODULE=auto
export GOCACHE=/Users/liuwangchen/Library/Caches/go-build
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
alias vhosts='vim /etc/hosts'
alias cjj='code ~/onedrive/Documents/jj'
alias ckk='code ~/onedrive/Documents/kk'
alias crosChrome='open -n /Applications/Google\ Chrome.app/ --args --disable-web-security  --user-data-dir=/Users/liuwangchen/Documents/testchrome'
alias vprofile='vim ~/.zshrc'
alias rest='rest&'
alias faken='faken -i en7&'
alias kub='kubectl'
alias kcn='kubectl config set-context $(kub config current-context) --namespace'
alias et='etcdctl'
alias ra='ranger'
alias nv='nvim'
alias f='fzf'
alias c='clear'
alias s='neofetch --color_blocks off'
alias vim='nvim'
alias vi='nvim'
alias tl='tldr'
alias gops="$GOPATH/bin/gops"
alias lgen="/Users/liuwangchen/work/go/yoozoo/gameserver/static/tools/gen_all.sh"
alias lc='cd ~/work/go/yoozoo/csv/ && open $(f)'
alias lcu='cd ~/work/go/yoozoo/csv/ && svn update'
alias lt='/Users/liuwangchen/onedrive/Documents/kk/youzu/lt.sh'
alias lr='/Users/liuwangchen/onedrive/Documents/kk/youzu/lr.sh'
alias o='open $(f)'
alias ldata="sh ~/onedrive/Documents/kk/youzu/ldata.sh"
alias lproto="vim /Users/liuwangchen/work/go/yoozoo/gameserver/static/protos"
alias lf="redis-cli -p 9898 flushdb"
alias sc='gosearch'
alias client='/Users/liuwangchen/onedrive/Documents/kk/youzu/lclient.sh'

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
	echo $pid | xargs kill
  fi
}
# fh() {
  # $(history | f -m |awk -F " " '{for(i=2;i<=NF;i++){ printf("%s ",$i);} printf("\n")}')
# }

# j() {
    # if [[ "$#" -ne 0 ]]; then
        # cd $(autojump $@)
        # return
    # fi
    # cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
# }


#------------------------------------------function------------------------------------------
json() {
  if [[ "$#" -ne 0 ]]; then
      echo $@ | jq .
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#------------------------------------------zsh bindkey------------------------------------------
bindkey '^[i' up-line-or-search
bindkey '^[k' down-line-or-search
# bindkey '^v' edit-command-line
# bindkey -v
# bindkey -M vicmd "e" vi-insert
# bindkey -M vicmd "E" vi-insert-bol
# bindkey -M vicmd "j" vi-backward-char
# bindkey -M vicmd "l" vi-forward-char
# bindkey -M vicmd "0" vi-beginning-of-line
# bindkey -M vicmd "$" vi-end-of-line
# bindkey -M vicmd "k" down-line-or-history
# bindkey -M vicmd "i" up-line-or-history
# bindkey -M vicmd "u" undo
# bindkey -M vicmd "=" vi-repeat-search
# bindkey -M vicmd "h" vi-forward-word-end

# function zle-keymap-select {
	# if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		# echo -ne '\e[1 q'
	# elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		# echo -ne '\e[5 q'
  # fi
# }
# zle -N zle-keymap-select

# # Use beam shape cursor on startup.
# echo -ne '\e[5 q'

# # Use beam shape cursor for each new prompt.
# preexec() {
	# echo -ne '\e[5 q'
# }

# _fix_cursor() {
	# echo -ne '\e[5 q'
# }
# precmd_functions+=(_fix_cursor)


# zle -N zle-line-init
# zle -N zle-keymap-select
# KEYTIMEOUT=1
#


unix() {
	echo $(date -r $1 "+%Y-%m-%d %H:%M:%S")
}

