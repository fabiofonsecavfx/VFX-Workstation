# Add to PATH
export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH/bin

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Colors
export ADW_BG_MAIN='#1d1d20'
export ADW_BG_LIGHT='#222226'
export ADW_WHITE='#ffffff'
export ADW_ACCENT="#3584e4"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

export PAGER='less'
export LESS='-R'

export MANPAGER="nvim +Man!"

# FZF Configuration
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS="\
--color=fg:7,bg:$ADW_BG_MAIN,hl:4 \
--color=fg+:$ADW_BG_WHITE,bg+:8,hl+:$ADW_ACCENT \
--color=info:7,prompt:$ADW_ACCENT,pointer:$ADW_ACCENT \
--color=marker:10,spinner:14,header:15 \
--color=border:8,gutter:0,scrollbar:8 \
--color=preview-fg:15 \
--color=preview-border:0,preview-scrollbar:8 \
--border=sharp \
--height=60% \
--layout=reverse \
--info=inline \
--prompt='󰍉 ' \
--pointer='▶' \
--marker='●' \
--separator='─' \
--scrollbar='│' \
--preview-window=right:50%:wrap \
--bind 'ctrl-/:toggle-preview' \
--bind 'ctrl-u:preview-page-up' \
--bind 'ctrl-d:preview-page-down' \
--bind 'ctrl-a:select-all' \
--bind 'ctrl-t:toggle-all' \
--bind 'alt-up:preview-up' \
--bind 'alt-down:preview-down'"

export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="\
--preview 'bat --color=always --line-range :300 {}' \
--preview-window=right:60%:wrap:border-left \
--color=preview-fg:15 \
--border=sharp \
--bind 'ctrl-/:toggle-preview' \
--bind 'ctrl-u:preview-page-up' \
--bind 'ctrl-d:preview-page-down' \
--bind 'ctrl-y:execute-silent(echo {} | pbcopy)'
--prompt='󰱼 '"

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="\
--preview 'tree -C -L 2 {} 2>/dev/null || ls -la {}' \
--preview-window=right:50%:wrap:border-left \
--color=preview-fg:15 \
--border=sharp \
--prompt='󰉒 '"

export FZF_CTRL_R_OPTS="--prompt=' '"

# Bat settings
export BAT_THEME="ansi"
export BAT_STYLE="changes,header"

# Vi-mode
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  export ZVM_VI_HIGHLIGHT_FOREGROUND=$ADW_WHITE
  export ZVM_VI_HIGHLIGHT_BACKGROUND=$ADW_ACCENT
}


