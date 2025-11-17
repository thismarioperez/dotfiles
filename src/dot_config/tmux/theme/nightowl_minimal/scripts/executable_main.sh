#!/usr/bin/env bash

main() {
    # ============================================================
    # ICONS
    # ============================================================
    icon_session=$'\uf108'       # Session icon
    icon_pill_left=$'\ue0b6'     # Left pill border
    icon_pill_right=$'\ue0b4'    # Right pill border

    # ============================================================
    # NIGHT OWL COLOR PALETTE
    # ============================================================
    # Base colors
    black='#011627'
    white='#ffffff'
    gray='#44596b'
    bright_black='#575656'
    bright_white='#ffffff'

    # Primary colors
    red='#ef5350'
    green='#addb67'
    yellow='#addb67'
    blue='#82aaff'
    magenta='#7e57c2'
    cyan='#21c7a8'

    # Bright variants
    bright_red='#f78c6c'
    bright_green='#22da6e'
    bright_yellow='#ffeb95'
    bright_blue='#5ca7e4'
    bright_magenta='#c792ea'
    bright_cyan='#7fdbca'

    # Special colors
    error='#ef5350'

    # ============================================================
    # STATUS BAR - GLOBAL SETTINGS
    # ============================================================
    tmux set-option -g status-position top
    tmux set-option -g status-style "fg=${white}"
    tmux set-option -g status-justify left

    # ============================================================
    # STATUS BAR - LEFT SECTION
    # ============================================================
    # Shows session icon and name with prefix indicator
    # Format breakdown:
    #   1. If prefix is active: magenta background + black text
    #   2. If prefix is not active: magenta text only
    #   3. Session icon and name
    #   4. Separator with muted color
    local status_left=""
    status_left+="#{?client_prefix,"                           # Conditional: if prefix key pressed
    status_left+="#[bg=${bright_magenta}]#[fg=${black}],"      # Then: bright magenta bg, black text
    status_left+="#[fg=${bright_magenta}]}"                    # Else: bright magenta text
    status_left+="${icon_session} #{session_name} "            # Session icon and name
    status_left+="#[fg=${bright_black}]| "                     # Separator

    tmux set-option -g status-left "${status_left}"
    tmux set-option -g status-left-length 20

    # ============================================================
    # WINDOW LIST - PILL-SHAPED STYLING
    # ============================================================
    # Inactive window colors
    inactive_bg='#1a2332'
    inactive_fg='#5c7a96'

    # Active window colors
    active_bg='#0b2942'
    active_fg='#82aaff'

    # Inactive window format
    # Format breakdown:
    #   1. Left pill border (using inactive bg color)
    #   2. Window info (index, name, flags) with inactive styling
    #   3. Right pill border
    local inactive_format=""
    inactive_format+="#[bg=${black},fg=${inactive_bg}]"        # Set colors for left border
    inactive_format+="${icon_pill_left}"                       # Left pill border icon
    inactive_format+="#[bg=${inactive_bg},fg=${inactive_fg}]"  # Set colors for window content
    inactive_format+="#{window_index}:#{window_name}"          # Window index and name
    inactive_format+="#{window_flags}"                         # Window flags (*, -, etc.)
    inactive_format+="#[bg=${black},fg=${inactive_bg}]"        # Set colors for right border
    inactive_format+="${icon_pill_right}"                      # Right pill border icon

    tmux set-option -g window-status-format "${inactive_format}"

    # Active window format
    # Format breakdown:
    #   1. Left pill border (using active bg color)
    #   2. Window info (index, name, flags) with active/highlighted styling
    #   3. Right pill border
    local active_format=""
    active_format+="#[bg=${black},fg=${active_bg}]"            # Set colors for left border
    active_format+="${icon_pill_left}"                         # Left pill border icon
    active_format+="#[bg=${active_bg},fg=${active_fg}]"        # Set colors for window content
    active_format+="#{window_index}:#{window_name}"            # Window index and name
    active_format+="#{window_flags}"                           # Window flags (*, -, etc.)
    active_format+="#[bg=${black},fg=${active_bg}]"            # Set colors for right border
    active_format+="${icon_pill_right}"                        # Right pill border icon

    tmux set-option -g window-status-current-format "${active_format}"

    # ============================================================
    # STATUS BAR - RIGHT SECTION
    # ============================================================
    # Shows time with seconds
    # Format breakdown:
    #   1. Gray text color for subtle appearance
    #   2. Time format: hour:minute:second AM/PM
    local status_right=""
    status_right+="#[fg=${gray}]"                              # Set gray text color
    status_right+="%l:%M:%S %p"                                # Time format (12-hour with seconds)

    tmux set-option -g status-right "${status_right}"
    tmux set-option -g status-interval 1                       # Update every second
}

main