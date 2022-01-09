# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh
# Env
export LANG=en_US.UTF-8
export EDITOR='nvim'
export GIT_EDITOR="${EDITOR}"

# History config
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt long_list_jobs
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
setopt interactivecomments
zstyle ':completion:*' rehash true

# Alias
alias l='ls -alhF --color=auto'
alias ll='ls -alhF --color=auto'
alias lu='cd ..;ls -alhF --color=auto'
alias tls='tmux ls'
alias ta='tmux a -t'
alias vim='nvim'
alias vi='nvim'
alias lg='lazygit'
alias df='df -ahT'
alias pwd='pwd -P'

# Key binds
bindkey	"^[[A"		history-substring-search-up
bindkey	"^[[B"		history-substring-search-down
bindkey "\e[1;5D"	backward-word
bindkey "\e[1;5C"	forward-word
bindkey  "^[[H"		beginning-of-line
bindkey  "^[[F"		end-of-line
## Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

# Path
export PATH="$HOME/bin/:/usr/local/sbin:$PATH"
export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/.rbenv/bin:$HOME/.fnm:$HOME/.pyenv:$PATH"
eval "`fnm env`"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export GTAGSLABEL=pygments
export PATH="/usr/local/opt/curl/bin:$PATH"
#export HTTP_PROXY=socks5://127.0.0.1:7890
#export HTTPS_PROXY=socks5://127.0.0.1:7890
export HOMEBREW_CORE_GIT_REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

# Zplug Install
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/extract", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug 'plugins/extract', from:oh-my-zsh
zplug 'plugins/autojump', from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
zplug "sharkdp/fd", from:gh-r, as:command, rename-to:fd, use:"*x86_64-unknown-linux-gnu.tar.gz"
source $ZPLUG_HOME/repos/junegunn/fzf/shell/completion.zsh
source $ZPLUG_HOME/repos/junegunn/fzf/shell/key-bindings.zsh

# -----------App Configuration--------------
## Zsh Theme Powerlevel10k
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf settings. Uses sharkdp/fd for a faster alternative to `find`.
FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git --exclude .cache'
FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
