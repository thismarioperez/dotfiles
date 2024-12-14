-- Pull in wezterm API
local wezterm = require "wezterm"
local window = require 'window'
local appearance = require 'appearance'

-- This will hold the configuration
local config = wezterm.config_builder()

-- Apply config

-- Window
window.apply_to_config(config)

-- Appearance
appearance.apply_to_config(config)

-- And finally, return the configuration to wezterm
return config
