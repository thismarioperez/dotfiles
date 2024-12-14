-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua
local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- Apply config
function module.apply_to_config(config)
    -- Font
    config.font = wezterm.font("MonoLisa Nerd Font", {
        weight = "Bold"
    })
    config.font_size = 16.0
    config.cell_width = 0.8

    -- Colors
    config.color_scheme = 'Night Owl (Gogh)'
    -- Color Overrides
    config.colors = {
        -- @see https://github.com/sdras/night-owl-vscode-theme/blob/main/themes/Night%20Owl-color-theme.json

        cursor_bg = "#7e57c2",
        cursor_border = "#7e57c2",
        scrollbar_thumb = "#575656",

        -- tab bar
        tab_bar = {
            background = "#011627",

            -- The active tab is the one that has focus in the window
            active_tab = {
                -- The color of the background area for the tab
                bg_color = '#0b2942',
                -- The color of the text for the tab
                fg_color = '#d2dee7',

                -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
                -- label shown for this tab.
                -- The default is "Normal"
                intensity = 'Bold',

                -- Specify whether you want "None", "Single" or "Double" underline for
                -- label shown for this tab.
                -- The default is "None"
                underline = 'None',

                -- Specify whether you want the text to be italic (true) or not (false)
                -- for this tab.  The default is false.
                italic = false,

                -- Specify whether you want the text to be rendered with strikethrough (true)
                -- or not for this tab.  The default is false.
                strikethrough = false
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = '#01111d',
                fg_color = '#5f7e97'

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab`.
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over inactive tabs
            inactive_tab_hover = {
                bg_color = '#7e57c2',
                fg_color = '#909090',
                italic = true

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab_hover`.
            },

            -- The new tab button that let you create new tabs
            new_tab = {
                bg_color = '#01111d',
                fg_color = '#5f7e97'

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `new_tab`.
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over the new tab button
            new_tab_hover = {
                bg_color = '#7e57c2',
                fg_color = '#909090',
                italic = true

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `new_tab_hover`.
            }
        }
    }
    -- Background
    config.window_background_gradient = {
        -- Can be "Vertical" or "Horizontal".  Specifies the direction
        -- in which the color gradient varies.  The default is "Horizontal",
        -- with the gradient going from left-to-right.
        -- Linear and Radial gradients are also supported; see the other
        -- examples below
        orientation = {
            Linear = {
                angle = -45.0
            }
        },

        -- Specifies the set of colors that are interpolated in the gradient.
        -- Accepts CSS style color specs, from named colors, through rgb
        -- strings and more
        colors = {'#011627', '#01111d'},

        -- Instead of specifying `colors`, you can use one of a number of
        -- predefined, preset gradients.
        -- A list of presets is shown in a section below.
        -- preset = "Warm",

        -- Specifies the interpolation style to be used.
        -- "Linear", "Basis" and "CatmullRom" as supported.
        -- The default is "Linear".
        interpolation = 'Linear',

        -- How the colors are blended in the gradient.
        -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
        -- The default is "Rgb".
        blend = 'Rgb'

        -- To avoid vertical color banding for horizontal gradients, the
        -- gradient position is randomly shifted by up to the `noise` value
        -- for each pixel.
        -- Smaller values, or 0, will make bands more prominent.
        -- The default value is 64 which gives decent looking results
        -- on a retina macbook pro display.
        -- noise = 64,

        -- By default, the gradient smoothly transitions between the colors.
        -- You can adjust the sharpness by specifying the segment_size and
        -- segment_smoothness parameters.
        -- segment_size configures how many segments are present.
        -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
        -- 1.0 is a soft edge.

        -- segment_size = 11,
        -- segment_smoothness = 0.0,
    }
end

-- return our module table
return module
