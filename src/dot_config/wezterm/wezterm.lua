-- Pull in wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration
local config = wezterm.config_builder()

-- Apply config

-- Font
config.font = wezterm.font("MonoLisa Nerd Font", { weight = "Regular" })
config.font_size = 16.0
config.cell_width = 0.9

-- Colors
config.bold_brightens_ansi_colors = "BrightAndBold"
config.color_scheme = 'Night Owl (Gogh)'
-- Overrides
config.colors = {
    cursor_bg = "#7e57c2",
    cursor_border = "#7e57c2",
}

-- Window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
    left = "8pt",
    right = "8pt",
    top = "26pt",
    bottom = "26pt",
}
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
config.enable_scroll_bar = true

-- Tabs
config.enable_tab_bar = false

-- And finally, return the configuration to wezterm
return config
