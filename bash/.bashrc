#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend
shopt -s checkwinsize

# Completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
fi

# Color aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# Git
alias g='git'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'

# Tmux
alias t='tmux attach || tmux new-session'

# Nav
alias ..='cd ..'
alias ...='cd ../..'

# Bluetooth aliases
alias bt-connect='bluetoothctl connect 2C:BE:EE:F4:6C:93'
alias bt-disconnect='bluetoothctl disconnect 2C:BE:EE:F4:6C:93'
alias bt-connect1='bluetoothctl connect 5C:44:3E:0E:0B:F8'
alias bt-disconnect1='bluetoothctl disconnect 5C:44:3E:0E:0B:F8'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]             && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ]    && \. "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Starship prompt
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="/home/sri/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/share/../bin/env"
