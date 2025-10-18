bindkey -e

# FZF
# Add custom function for directories
fzf-dir-widget() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git . | \
    fzf --preview 'ls -la --color=always {} | head -20' \
        --preview-window=right:60%:wrap:border-left \
        --color=preview-fg:15 \
        --border=rounded \
        --bind 'ctrl-/:toggle-preview' \
        --bind 'ctrl-u:preview-page-up' \
        --bind 'ctrl-d:preview-page-down' \
        --bind 'ctrl-y:execute-silent(echo {} | pbcopy)' \
        --prompt='󰥨 ')
  if [[ -n $dir ]]; then
    LBUFFER="${LBUFFER}${dir}"
    zle reset-prompt
  fi
}

zle -N fzf-dir-widget
bindkey -r '^G'
bindkey '^G' fzf-dir-widget

# Emacs Keybindings Cheat Sheet
emacs_cheat() {
    cat << 'EOF'
╭─────────────────────────────────────────────────────────────╮
│                 ZSH EMACS KEYBINDINGS CHEAT SHEET          │
╰─────────────────────────────────────────────────────────────╯

🚀 CURSOR MOVEMENT
  Ctrl+A    Beginning of line        Ctrl+E    End of line
  Ctrl+F    Forward character        Ctrl+B    Backward character  
  Alt+F     Forward word             Alt+B     Backward word

✏️  EDITING
  Ctrl+D    Delete char forward      Ctrl+H    Delete char backward
  Ctrl+K    Kill to end of line      Ctrl+U    Kill to start of line
  Alt+D     Kill word forward        Ctrl+W    Kill word backward
  Ctrl+Y    Yank (paste) killed text Ctrl+T    Transpose characters
  Alt+T     Transpose words

📚 HISTORY
  Ctrl+P    Previous command         Ctrl+N    Next command
  Ctrl+R    Reverse search           Ctrl+S    Forward search
  Alt+.     Insert last argument     Alt+_     Insert last argument

🔧 UTILITY
  Ctrl+L    Clear screen             Ctrl+C    Cancel current line
  Ctrl+Z    Suspend process          Ctrl+G    Cancel current action
  Ctrl+X Ctrl+E  Edit in $EDITOR     Tab       Auto-complete

💡 PRO TIPS
  • Most keybindings work in bash/zsh by default
  • Use Ctrl+R then type to search command history
  • Ctrl+K + Ctrl+Y is great for moving text around
  • Alt key bindings might need terminal configuration

Type 'bindkey -e' to ensure emacs mode is enabled
EOF
}
