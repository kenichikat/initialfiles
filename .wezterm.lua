local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

config.automatically_reload_config = true
config.window_frame = {
    font = require('wezterm').font 'Roboto',
    font_size = 10.0
}
config.window_background_opacity = 0.80

config.use_ime = true

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {width=240, height=60})
    window:gui_window():set_position(0,0)
    window:set_inner_size(1600, 900)
  end)

return config
