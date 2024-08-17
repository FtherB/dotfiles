local wezterm = require 'wezterm'

local config = {}

local home = os.getenv( "HOME" )

config.enable_tab_bar = false

config.font = wezterm.font 'Hack Nerd Font Mono'

config.colors = {
    cursor_bg = "#88d8fc",
    cursor_fg = '#101010',
    cursor_border = "#88d8fc"
}

config.background = {
    {
        source = {
           File = home .. "/OneDrive/pictures/wallpapers/emilia/1.jpg",
           -- File = home .. "/OneDrive/pictures/wallpapers/unknown1.jpg"
        },
        repeat_x = 'NoRepeat',
        hsb = {
            brightness = 0.15,
            saturation = 0.9,
        },
        attachment = {
            Parallax = 0,
        },
    }
}

-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

config.initial_cols = 200
config.initial_rows = 57

return config
