#### Keybindings ####
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