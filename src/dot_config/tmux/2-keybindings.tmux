#### Keybindings ####
# Refresh tmux Configuration
bind R source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"\
    \; display-message "Reloaded tmux configuration: $XDG_CONFIG_HOME/tmux/tmux.conf"

# Switch to marked window using back tick
bind \` switch-client -t'{marked}'

# Switch panes with Alt-arrow keys
bind -nr M-Up select-pane -U
bind -nr M-Down select-pane -D
bind -nr M-Left select-pane -L
bind -nr M-Right select-pane -R

# vim-like pane switching
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# vim-like resizing pane
bind -r C-k resize-pane -U 5
bind -r C-j resize-pane -D 5
bind -r C-h resize-pane -L 5
bind -r C-l resize-pane -R 5

# Split panes using | and -
bind-key | split-window -h \
    -c "#{pane_current_path}"

bind-key - split-window -v \
    -c "#{pane_current_path}"

#### Pop Ups ####
# New Terminal
bind C-t display-popup \
    -d "#{pane_current_path}" \
    -E "zsh"

# LazyDocker
bind C-d display-popup \
    -d "#{pane_current_path}" \
    -w 90% \
    -h 90% \
    -E "zsh -i -c 'lazydocker'"

# LazyGit
bind C-g display-popup \
    -d "#{pane_current_path}" \
    -w 90% \
    -h 90% \
    -E "zsh -i -c 'lazygit'"

#### Session Management with Popups ####
# Session switcher with preview (main sessionx replacement)
# Find or create session
bind O display-popup \
    -d "#{pane_current_path}" \
    -w 80% \
    -h 80% \
    -E "bash -c '\
    session=\$(tmux list-sessions -F \"#{session_name}\" | \
        fzf --reverse --print-query \
            --prompt=\"Find or create session: \" \
            --preview=\"tmux capture-pane -ep -t {} 2>/dev/null || echo \\\"New session: {}\\\"\" \
            --preview-window=right:60% \
            --bind \"ctrl-x:execute-silent(tmux kill-session -t {})+reload(tmux list-sessions -F \\\"#{session_name}\\\")\" \
            --header \"Enter=switch/create | Ctrl-x=delete\" | \
        tail -n1); \
    [ -z \"\$session\" ] && exit 0; \
    tmux has-session -t \"\$session\" 2>/dev/null || \
        tmux new-session -d -s \"\$session\" -c \"#{pane_current_path}\"; \
    tmux switch-client -t \"\$session\"'"

# Create new session from current directory
bind N display-popup \
    -d "#{pane_current_path}" \
    -E "read -p 'New session name: ' name && \
    tmux new-session -d -s \"\$name\" -c \"#{pane_current_path}\" && \
    tmux switch-client -t \"\$name\""

# Delete session(s) interactively
bind D display-popup \
    -d "#{pane_current_path}" \
    -w 60% \
    -h 60% \
    -E "tmux list-sessions | \
    fzf --reverse --prompt='Delete session: ' \
        --multi \
        --bind 'ctrl-a:select-all' \
        --header 'Tab=select multiple | Ctrl-a=select all | Enter=delete' | \
    cut -d: -f1 | \
    xargs -I {} tmux kill-session -t {}"

# Create session from projects directory
bind F display-popup \
    -d "#{pane_current_path}" \
    -w 80% \
    -h 80% \
    -E "find ~/[Rr]epositories $XDG_DATA_HOME $XDG_CONFIG_HOME -maxdepth 1 -type d 2>/dev/null | \
    sort -u | \
    fzf --reverse --prompt='Create session from project: ' \
        --preview 'ls -la {}' \
        --preview-window=right:60% | \
    xargs -I {} bash -c 'name=\$(basename \"{}\"); \
    tmux new-session -d -s \"\$name\" -c \"{}\" 2>/dev/null || true; \
    tmux switch-client -t \"\$name\"'"

# Window switcher with preview
bind W display-popup \
    -d "#{pane_current_path}" \
    -w 80% \
    -h 80% \
    -E "tmux list-windows -F '#{window_index}: #{window_name} (#{window_panes} panes)' | \
    fzf --reverse --prompt='Switch to window: ' \
        --preview 'tmux capture-pane -ep -t {1}' \
        --preview-window=right:60% | \
    cut -d: -f1 | \
    xargs tmux select-window -t"
