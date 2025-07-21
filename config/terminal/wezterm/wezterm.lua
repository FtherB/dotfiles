local wezterm = require 'wezterm'

local config = {}

config.enable_tab_bar = false

config.term = "xterm-256color"

config.font = wezterm.font 'HackGen35 Console NF'

config.allow_square_glyphs_to_overflow_width = 'Never'
-- config.assume_emoji_double_width = true

config.colors = {
    cursor_bg = "#88d8fc",
    cursor_fg = '#101010',
    cursor_border = "#88d8fc"
}

config.cell_widths = {
  -- Powerline Symbols (U+E0B0 - U+E0B3)
  { first = 0xe0b0, last = 0xe0b3, width = 1 },

  -- Powerline Extra Symbols
  { first = 0xe0a0, last = 0xe0a3, width = 1 },
  { first = 0xe0b4, last = 0xe0d4, width = 1 },
}



-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

config.initial_cols = 200
config.initial_rows = 57

config.background = require("background")

return config
