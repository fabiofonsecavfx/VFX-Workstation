# Case-insensitive completion (e.g., `Git` matches `git`)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Group results
zstyle ':completion:*' group-name ''

# Describe each option
zstyle ':completion:*' verbose yes

# Show menu when there are multiple results
zstyle ':completion:*' menu select

# Format for descriptions
zstyle ':completion:*:descriptions' format '%B%d%b'

# List colors (you can customize this further)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Set selection cursor colors: blue background, white foreground
zstyle ':completion:*' menu select=0
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm"
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Custom group ordering - put local directory first
zstyle ':completion:*' group-order \
local-directories \
directories \
files \
functions \
aliases \
commands \
builtins \
history-words

# Color scheme for menu selection (blue background, white text)
zstyle ':completion:*' menu select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;12;38;5;231'

# zsh-completions
fpath=($ZSH_PLUGIS_PATH/zsh-completions/src $fpath)

# Initialize completion system
autoload -Uz compinit && compinit
