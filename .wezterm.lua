local wezterm = require 'wezterm'

config = wezterm.config_builder()

config.automatically_reload_config = true
config.window_frame = {
    font = require('wezterm').font 'Roboto',
    font_size = 10.0
}
config.window_background_opacity = 0.80

config.use_ime = true

return config
