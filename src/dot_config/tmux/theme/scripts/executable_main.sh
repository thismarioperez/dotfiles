#!/usr/bin/env bash

main() {
    # set current directory variable
    current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # seperators
    left_circle=''
    left_diamond=''
    right_circle=''
    right_diamond=''

    # Night Owl Color Pallette
    black='#011627'
    bright_black='#575656'
    red='#EF5350'
    bright_red='#EF5350'
    orange='#f78c6c'
    bright_orange='#ef5350'
    green='#addb67'
    bright_green='#22da6e'
    yellow='#c5e478'
    bright_yellow='#ffeb95'
    blue='#82aaff'
    bright_blue='#5ca7e4'
    magenta='#7e57c2'
    bright_magenta='#C792EA'
    cyan='#21c7a8'
    bright_cyan='#7fdbca'
    white='#bec5d4'
    bright_white='#ffffff'
    gray='#44596b'
    error='#ce092f'

    status_bar_bg=$black
    status_bar_fg=$black
    pane_border_color=$green
    pane_active_border_color=$bright_green
    message_bg=$green
    message_fg=$black

    # sets refresh interval to every 5 seconds
    tmux set-option -g status-interval 5

    # set clock to 12 hour by default
    # tmux set-option -g clock-mode-style 12

    # set length
    # tmux set-option -g status-left-length 100
    # tmux set-option -g status-right-length 100

    # pane border styling
    tmux set-option -g pane-border-style "fg=${pane_border_color}"
    tmux set-option -g pane-active-border-style "fg=${pane_active_border_color}"

    # message styling
    tmux set-option -g message-style "bg=${message_bg},fg=${message_fg}"

    # Status bar
    tmux set-option -g status-position bottom
    tmux set-option -g status-style "bg=${status_bar_bg},fg=${status_bar_fg}"
    tmux set-option -g status-justify left

    # Status bar left
    tmux set-option -g status-left "#[fg=${magenta},bg=${status_bar_bg},nobold,nounderscore,noitalics]${right_circle}#[bg=${magenta},fg=${black}] #{session_name} #[fg=${magenta},bg=${status_bar_bg},nobold,nounderscore,noitalics]${left_diamond}"

    # Status right
    # reset
    tmux set-option -g status-right ""
    # ram info
    tmux set-option -ga status-right "#[fg=${bright_yellow},bg=${status_bar_bg},nobold,nounderscore,noitalics] ${right_circle}#[fg=${black},bg=${bright_yellow}] #($current_dir/ram_info.sh) #[fg=${status_bar_bg},bg=${bright_yellow},nobold,nounderscore,noitalics]${right_diamond}"
    # cpu info
    tmux set-option -ga status-right "#[fg=${red},bg=${status_bar_bg},nobold,nounderscore,noitalics]${right_diamond}#[fg=${black},bg=${red}] #($current_dir/cpu_info.sh) #[fg=${red},bg=${status_bar_bg},nobold,nounderscore,noitalics]${left_circle}"

    # Window list
    # tmux set-option -g window-status-current-format "#[bg=${green},fg${black}] #{window_index}:#{window_name}#{window_flags} "
    # tmux set-option -g window-status-format "#(echo" ")#{window_index}:#{window_name}#{window_flags} "
    tmux set-window-option -g window-status-separator ""
    tmux set-window-option -g window-status-current-format "#[fg=${status_bar_bg},bg=${green}]${left_diamond}#[fg=${black},bg=${green}] #I #W#{window_flags}#[fg=${green},bg=${status_bar_bg}]#{?window_end_flag,${left_circle},${left_diamond}}"
    tmux set-window-option -g window-status-format "#[fg=${status_bar_bg},bg=${bright_black}]${left_diamond}#[fg=${white}]#[bg=${bright_black}] #I #W#{window_flags}#[fg=${bright_black},bg=${status_bar_bg}]#{?window_end_flag,${left_circle},${left_diamond}}"
}

# run main function
main
