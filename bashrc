if [ -n "$IN_NIX_SHELL" ]; then
  echo "In nix shell."
fi

export EDITOR=vim

# General usefulness:
alias is="env | grep -i NIX_SHELL"
alias gs="git status"
alias vim="onethirtyfive-vim"
alias rmswp="find . -name *.swp | xargs rm"

# Ruby:
alias be="bundle exec"
alias bert="bundle exec rake"

function fix-keys {
  gsettings set org.gnome.desktop.peripherals.keyboard delay 250
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 7
}

source $HOME/.dotfiles/sh/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
GIT_PS1_SHOWSTASHSTATE='true'
GIT_PS1_SHOWCOLORHINTS='true'

