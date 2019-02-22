if [ -n "$IN_NIX_SHELL" ]; then
  echo "In nix shell."
fi

export EDITOR=vim

# General usefulness:
alias is="env | grep -i NIX_SHELL"
alias gs="git status"
alias vim="onethirtyfive-vim -g -geometry 500x500"
alias pvim="onethirtyfive-vim"
alias rmswp="find . -name *.swp | xargs rm"

# Ruby:
alias be="bundle exec"
alias bert="bundle exec rake"

function fix-font {
  setfont latarcyrheb-sun32
}

function game-keys {
  gsettings set org.gnome.desktop.peripherals.keyboard delay 250
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 100
}

function fix-keys {
  gsettings set org.gnome.desktop.peripherals.keyboard delay 250
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 7
}

function fix-keys-dconf {
  dconf write /org/gnome/desktop/peripherals/keyboard/delay 250
  dconf write /org/gnome/desktop/peripherals/keyboard/repeat-interval 7
}

source $HOME/.dotfiles/sh/git-prompt.sh

PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
GIT_PS1_SHOWSTASHSTATE='true'
GIT_PS1_SHOWCOLORHINTS='true'

# disable freeze on ctrl-s
stty -ixon

# put this either in bashrc or zshrc
nixify() {
  if [ ! -e ./.envrc ]; then
    echo "use nix" > .envrc
    direnv allow
  fi
  if [ ! -e default.nix ]; then
    cat > default.nix <<'EOF'
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    bashInteractive
  ];
}
EOF
    ${EDITOR:-vim} default.nix
  fi
}

eval "$(direnv hook bash)"
