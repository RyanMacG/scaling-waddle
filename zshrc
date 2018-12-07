## Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -d $HOME/.dotfiles/zsh.before/ ]; then
  if [ "$(ls -A $HOME/.dotfiles/zsh.before/)" ]; then
    for config_file ($HOME/.dotfiles/zsh.before/*.zsh) source $config_file
  fi
fi

if [ -d $HOME/.dotfiles/zsh ]; then
  if [ "$(ls -A $HOME/.dotfiles/zsh/)" ]; then
    for config_file ($HOME/.dotfiles/zsh/*.zsh) source $config_file
  fi
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$HOME/.cargo/bin:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=~/.npm-packages/bin:$PATH
export EDITOR=nvim

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="~/.npm-packages/share/man:$(manpath)"

eval "$(rbenv init -)"

source ~/.env.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# fo [FUZZY PATTERN] - Open the selected file with the default editor
#
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fo() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
