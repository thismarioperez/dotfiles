#!/usr/bin/env bash

main() {
    # Icons
    icon_session=$'\ueb7f'
    icon_window=$'\uf108'

    # Night Owl Color Pallette
    black='#011627'
    bright_black='#575656'
    red='#ef5350'
    bright_red='#f78c6c'
    green='#addb67'
    bright_green='#22da6e'
    yellow='#c5e478'
    bright_yellow='#ffeb95'
    blue='#82aaff'
    bright_blue='#5ca7e4'
    magenta='#7e57c2'
    bright_magenta='#c792ea'
    cyan='#21c7a8'
    bright_cyan='#7fdbca'
    white='#bec5d4'
    bright_white='#ffffff'
    gray='#44596b'
    error='#ce092f'

    # Status bar
    tmux set-option -g status-position bottom
    tmux set-option -g status-style "bg=${black},fg=${white}"
    tmux set-option -g status-justify left

    # Status bar left
    tmux set-option -g status-left "#{?client_prefix,#[bg=${bright_magenta}]#[fg=${black}],#[bg=${black}]#[fg=${bright_magenta}]}${icon_session} #{session_name} #[bg=${black}]#[fg=${bright_black}]| "
    tmux set-option -g status-left-length 20

    # Window list
    tmux set-option -g window-status-format "#[fg=${white}]${icon_window} #{window_index}:#{window_name}#{window_flags} "
    tmux set-option -g window-status-current-format "#[fg=${cyan}]${icon_window} #{window_index}:#{window_name}#{window_flags} "

    # Status right
    tmux set-option -g status-right "#[fg=${gray}]%l:%M:%S %p"
    tmux set-option -g status-interval 1
}

main