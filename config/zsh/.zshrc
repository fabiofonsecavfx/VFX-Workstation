export ZSH_CONF_PATH="$HOME/.config/zsh/config"

source <(fzf --zsh)

# Source config files
source $ZSH_CONF_PATH/exports.zsh
source $ZSH_CONF_PATH/settings.zsh
source $ZSH_CONF_PATH/completions.zsh
source $ZSH_CONF_PATH/aliases.zsh
source $ZSH_CONF_PATH/keybindings.zsh


# Source plugins
export ZSH_PLUGINS_PATH="$HOME/.config/zsh/plugins"
source $ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Extra plugins configurations
source $ZSH_CONF_PATH/plugins_config.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(oh-my-posh init zsh --config "$HOME/.config/zsh/config/gruvbox.omp.json")"
