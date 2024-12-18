# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if echo $OSTYPE | grep darwin >/dev/null; then
  export IS_MACOS=true
fi

if [ -z "${IS_MACOS}" ]; then
  readlinkCmd=readlink
  copyClipboardCmd="xclip -selection c"
else
  copyClipboardCmd="pbcopy"
  if ! command -v greadlink >/dev/null; then
    echo "coreutils not installed. Try running 'brew install coreutils'." >/dev/stderr
  else
    readlinkCmd=greadlink
  fi
fi

if [ "${IS_MACOS}" ]; then
  alias time="gtime"
fi

# use vim as default editor
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ -f ${ZSH}/custom/themes/spaceship.zsh-theme ]; then
  ZSH_THEME="spaceship"
  SPACESHIP_TIME_SHOW=true
  SPACESHIP_VI_MODE_NORMAL="_CMD_"
  SPACESHIP_VI_MODE_INSERT="»ins»"
fi
ZSH_THEME="${ZSH_THEME_OVERRIDE:-darkblood}"

if [ -x /usr/bin/numlockx ]; then
  /usr/bin/numlockx on
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode deno)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games/:$PATH"
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#####################
# Stefan custom stuff

# activate vi mode
bindkey -v

export KEYTIMEOUT=1
bindkey "^R" history-incremental-search-backward

# indicator for vi mode
MODE_INDICATOR="%{$fg_bold[red]%}[CMD MODE]%{$reset_color%}"

# add node_scripts to path
export PATH=~/node_scripts/.bin/:$PATH

# add composer bin to path
export PATH=~/.composer/vendor/bin/:$PATH
# global composer packages
export PATH=~/.config/composer/vendor/bin/:$PATH

# add scripts to path
export PATH=~/.oh-my-zsh/scripts/:$PATH

# add pip installed packages to path
export PATH=~/.local/bin/:$PATH

# add puppet to path
export PATH=/opt/puppetlabs/bin:$PATH

# fix grep warning
alias egrep="/bin/egrep $GREP_OPTIONS"
unset GREP_OPTIONS

#disable middle mouse
#  TODO: avoid 'device has no buttons' message
# type xinput > /dev/null && xinput set-button-map 12 1 0 3

if [ ! -f ~/.zshenv ]; then
  ln -s ~/.oh-my-zsh/.zshenv ~/.zshenv
  source ~/.zshenv
fi

###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion() {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
      COMP_LINE="$COMP_LINE" \
      COMP_POINT="$COMP_POINT" \
      pm2 completion -- "${COMP_WORDS[@]}" \
      2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion() {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
      COMP_LINE="$line" \
      COMP_POINT="$point" \
      pm2 completion -- "${words[@]}" \
      2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
bindkey "^?" backward-delete-char

export PATH="$HOME/.rbenv/bin:$PATH"
command -v rbenv >/dev/null && eval "$(rbenv init -)"

# use Brew's python as the default
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# bun completions
[ -s "/Users/stefan/.bun/_bun" ] && source "/Users/stefan/.bun/_bun"
