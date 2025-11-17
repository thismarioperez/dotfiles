#!/usr/bin/env bash

main() {
    # Icons
    icon_session=$'\uf108'
    icon_pill_left=$'\ue0b6'
    icon_pill_right=$'\ue0b4'

    # Night Owl Color Pallette
    black='#011627'
    bright_black='#575656'
    red='#ef5350'
    bright_red='#f78c6c'
    green='#addb67'
    bright_green='#22da6e'
    yellow='#addb67'
    bright_yellow='#ffeb95'
    blue='#82aaff'
    bright_blue='#5ca7e4'
    magenta='#7e57c2'
    bright_magenta='#c792ea'
    cyan='#21c7a8'
    bright_cyan='#7fdbca'
    white='#ffffff'
    bright_white='#ffffff'
    gray='#44596b'
    error='#ef5350'

    # Status bar
    tmux set-option -g status-position bottom
    tmux set-option -g status-style "bg=${black},fg=${white}"
    tmux set-option -g status-justify left

    # Status bar left
    tmux set-option -g status-left "#{?client_prefix,#[bg=${bright_magenta}]#[fg=${black}],#[bg=${black}]#[fg=${bright_magenta}]}${icon_session} #{session_name} #[bg=${black}]#[fg=${bright_black}]| "
    tmux set-option -g status-left-length 20

    # Window list - pill-shaped styling
    inactive_bg='#1a2332'
    inactive_fg='#5c7a96'
    active_bg='#0b2942'
    active_fg='#82aaff'
    tmux set-option -g window-status-format "#[bg=${black},fg=${inactive_bg}]${icon_pill_left}#[bg=${inactive_bg},fg=${inactive_fg}]#{window_index}:#{window_name}#{window_flags}#[bg=${black},fg=${inactive_bg}]${icon_pill_right}"
    tmux set-option -g window-status-current-format "#[bg=${black},fg=${active_bg}]${icon_pill_left}#[bg=${active_bg},fg=${active_fg}]#{window_index}:#{window_name}#{window_flags}#[bg=${black},fg=${active_bg}]${icon_pill_right}"

    # Status right
    tmux set-option -g status-right "#[fg=${gray}]%l:%M:%S %p"
    tmux set-option -g status-interval 1
}

main