#### Configuration ####
# Re-map prefix to [left_ctrl] + [a]
set-option -g prefix C-a
unbind C-b # unbind default prefix
bind-key C-a send-prefix
set-option -g repeat-time 0

# True color settings
set -g default-terminal "$TERM" # inherit terminal colors
set -ag terminal-overrides ",$TERM:Tc"

# Start window index at 1
set -g base-index 1

# Start pane index at 1
setw -g pane-base-index 1

# Renumber windows when exiting open windows
set -g renumber-windows on

# Prevent annoying index number added to session names
set-option -g automatic-rename off

# Mouse mode
setw -g mouse on