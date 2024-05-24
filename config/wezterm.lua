local wezterm = require 'wezterm'

local config = {}

local home = os.getenv( "HOME" ) 

config.enable_tab_bar = false

config.font = wezterm.font 'Hack Nerd Font Mono'

config.background = {
    {
        source = {
            File = home .. "/OneDrive/pictures/wallpapers/remram1.jpg",
        },
        repeat_x = 'NoRepeat',
        hsb = {
            brightness = 0.3,
            saturation = 0.9,
        },
        attachment = {
            Parallax = 0,
        },
    }
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

return config
