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

    # UI Tab colors (from colors.json ui.tab)
    tab_inactive_bg='#01111d'
    tab_inactive_fg='#5f7e97'
    tab_active_bg='#0b2942'
    tab_active_fg='#d2dee7'

    # ============================================================
    # STATUS BAR - GLOBAL SETTINGS
    # ============================================================
    tmux set-option -g status-position top
    tmux set-option -g status-style "fg=${white}"
    tmux set-option -g status-justify left

    # ============================================================
    # STATUS BAR - LEFT SECTION (Catppuccin-style pill)
    # ============================================================
    # Shows session icon and name in a pill with prefix indicator
    # Format breakdown:
    #   1. Left pill border (color changes with prefix)
    #   2. Pill background and text change when prefix is active
    #   3. Session icon and name with padding
    #   4. Right pill border (color changes with prefix)
    #   5. Space after pill
    
    # Session pill colors
    session_normal_bg="${bright_blue}"        # Bright blue background when prefix not active
    session_normal_fg="${black}"              # Black text when prefix not active
    session_active_bg="${bright_magenta}"     # Bright magenta background when prefix active
    session_active_fg="${black}"              # Black text when prefix active
    
    local status_left=""
    # Left pill border - changes color based on prefix state
    status_left+="#{?client_prefix,#[bg=${black}]#[fg=${session_active_bg}],#[bg=${black}]#[fg=${session_normal_bg}]}"
    status_left+="${icon_pill_left}"
    # Pill content - background and foreground change based on prefix state
    status_left+="#{?client_prefix,#[bg=${session_active_bg}]#[fg=${session_active_fg}],#[bg=${session_normal_bg}]#[fg=${session_normal_fg}]}"
    status_left+=" ${icon_session} #{session_name} "
    # Right pill border - changes color based on prefix state
    status_left+="#{?client_prefix,#[bg=${black}]#[fg=${session_active_bg}],#[bg=${black}]#[fg=${session_normal_bg}]}"
    status_left+="${icon_pill_right} "

    tmux set-option -g status-left "${status_left}"
    tmux set-option -g status-left-length 30

    # ============================================================
    # WINDOW LIST - PILL-SHAPED STYLING
    # ============================================================
    # Inactive window colors
    inactive_bg="${tab_inactive_bg}"
    inactive_fg="${tab_inactive_fg}"

    # Active window colors
    active_bg="${tab_active_bg}"
    active_fg="${tab_active_fg}"

    # Inactive window format (Catppuccin-style pills)
    # Format breakdown:
    #   1. Left pill border (using inactive bg color)
    #   2. Window info (index, name, flags) with inactive styling and padding
    #   3. Right pill border
    #   4. Space between pills
    local inactive_format=""
    inactive_format+="#[bg=${black},fg=${inactive_bg}]"        # Set colors for left border
    inactive_format+="${icon_pill_left}"                       # Left pill border icon
    inactive_format+="#[bg=${inactive_bg},fg=${inactive_fg}]"  # Set colors for window content
    inactive_format+=" #{window_index}:#{window_name}"         # Window index and name with left padding
    inactive_format+="#{window_flags} "                        # Window flags with right padding
    inactive_format+="#[bg=${black},fg=${inactive_bg}]"        # Set colors for right border
    inactive_format+="${icon_pill_right}"                      # Right pill border icon

    tmux set-option -g window-status-format "${inactive_format}"

    # Active window format (Catppuccin-style pills)
    # Format breakdown:
    #   1. Left pill border (using active bg color)
    #   2. Window info (index, name, flags) with active/highlighted styling and padding
    #   3. Right pill border
    #   4. Space between pills
    local active_format=""
    active_format+="#[bg=${black},fg=${active_bg}]"            # Set colors for left border
    active_format+="${icon_pill_left}"                         # Left pill border icon
    active_format+="#[bg=${active_bg},fg=${active_fg}]"        # Set colors for window content
    active_format+=" #{window_index}:#{window_name}"           # Window index and name with left padding
    active_format+="#{window_flags} "                          # Window flags with right padding
    active_format+="#[bg=${black},fg=${active_bg}]"            # Set colors for right border
    active_format+="${icon_pill_right}"                        # Right pill border icon

    tmux set-option -g window-status-current-format "${active_format}"

    # ============================================================
    # STATUS BAR - RIGHT SECTION
    # ============================================================
    # Shows time with seconds
    # Format breakdown:
    #   1. bright_black text color for subtle appearance
    #   2. Time format: hour:minute:second AM/PM
    local status_right=""
    status_right+="#[fg=${bright_black}]"                      # Set bright_black text color
    status_right+="%l:%M:%S %p"                                # Time format (12-hour with seconds)

    tmux set-option -g status-right "${status_right}"
    tmux set-option -g status-interval 1                       # Update every second
}

main