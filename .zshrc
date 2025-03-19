# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit ice wait lucid
zinit snippet OMZP::sudo

# Load completions
autoload -Uz compinit
if [ -f ~/.zcompdump ]; then
    compinit -C
else
    compinit
fi

# To customize prompt, edit ~/.config/oh-my-posh/config.toml
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/myconfig.toml)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/myconfig.json)"
#eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/catpuccin.json)"
#eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/tokyo.json)"

# Keybindings
bindkey "^[OA" history-search-backward  # Up arrow
bindkey "^[OB" history-search-forward   # Down arrow

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
export PATH=$PATH:/usr/bin
