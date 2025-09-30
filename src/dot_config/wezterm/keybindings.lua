local wezterm = require 'wezterm'
local module = {}

function module.apply_to_config(config)
    config.keys = {
        -- Send line break on shift + enter
      {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
    }
end

return module
