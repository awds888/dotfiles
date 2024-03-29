# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh
# Env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='vim'
export GIT_EDITOR="${EDITOR}"

# History config
export HISTFILE=~/.zsh_history
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
alias l='exa -abgFHl --git --time-style=long-iso --group-directories-first'
alias ll='exa -abgFhHliS --git --time-style=long-iso --group-directories-first'
alias lsm='exa -abgFhHli --git --time-style=long-iso --sort=modified'
alias lsc='exa -abgFhHli --git --time-style=long-iso --changed --sort=changed'
alias lt='exa -abgFHlT --git --time-style=long-iso --group-directories-first -L'
alias lu='cd ..;exa -abgFHl --git --time-style=long-iso --group-directories-first'
alias tls='tmux ls'
alias ta='tmux a -t'
alias lg='lazygit'
alias df='df -ahT'
alias pwd='pwd -P'
alias li='ls -laiF --color=auto'
alias vim='lvim'

# Key binds
# bindkey	"^[[A"		history-substring-search-up
# bindkey	"^[[B"		history-substring-search-down
bindkey "\e[1;5D"	backward-word
bindkey "\e[1;5C"	forward-word
bindkey  "^[[H"		beginning-of-line
bindkey  "^[[F"		end-of-line
## Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

# Path
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/opt/homebrew/bin:$HOME/bin/:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"
export PATH="$HOME/.rbenv/bin:$HOME/.fnm:$HOME/.pyenv/bin:$PATH"
eval "`fnm env`"
eval "$(rbenv init -)"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export GTAGSLABEL=pygments
export PATH="/usr/local/opt/curl/bin:$PATH"
#export HTTP_PROXY=socks5://127.0.0.1:7890
#export HTTPS_PROXY=socks5://127.0.0.1:7890

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
zplug "wting/autojump"
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions"

# -----------App Configuration--------------
## Zsh Theme Powerlevel10k
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
