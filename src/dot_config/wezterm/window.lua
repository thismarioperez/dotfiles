-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua
local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- Helper to get the current working directory
-- @see https://fredrikaverpil.github.io/blog/2024/10/20/session-management-in-wezterm-without-tmux/
local function get_current_working_dir(tab)
    local current_dir = tab.active_pane and tab.active_pane.current_working_dir or {
        file_path = ""
    }
    local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

    return current_dir == HOME_DIR and "." or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

-- Apply config
function module.apply_to_config(config)
    config.window_decorations = "RESIZE"
    config.window_padding = {
        left = "8pt",
        right = "8pt",
        top = "8pt",
        bottom = "8pt"
    }
    config.use_fancy_tab_bar = false
    config.window_background_opacity = 0.9
    config.macos_window_background_blur = 16
    config.enable_scroll_bar = true -- this allows for more customization
    config.hide_tab_bar_if_only_one_tab = false

    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        local has_unseen_output = false
        if not tab.is_active then
            for _, pane in ipairs(tab.panes) do
                if pane.has_unseen_output then
                    has_unseen_output = true
                    break
                end
            end
        end

        local cwd = wezterm.format({{
            Text = get_current_working_dir(tab)
        }})

        local title = string.format(" [%s] %s", tab.tab_index + 1, cwd)

        if has_unseen_output then
            return {{
                Text = title
            }}
        end

        return {{
            Text = title
        }}
    end)
end

-- return our module table
return module
