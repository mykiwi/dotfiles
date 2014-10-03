export UPDATE_ZSH_DAYS=42

ZSH=$DOTFILES/zsh/oh-my-zsh
ZSH_THEME="pure"
PURE_CMD_MAX_EXEC_TIME=2
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git)
setopt rmstarsilent

source $ZSH/oh-my-zsh.sh
source $DOTFILES/alias

setopt APPEND_HISTORY

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
