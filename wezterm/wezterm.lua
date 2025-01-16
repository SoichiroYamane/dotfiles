local wezterm = require("wezterm")
local utils = require("libs.utils")
local font = require("libs.font")
local tab_bar = require("libs.tab_bar")
local keymap = require("libs.keymap")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Utils
for k, v in pairs(utils.combined_config()) do
	config[k] = v
end

-- Font
for k, v in pairs(font.font_config()) do
	config[k] = v
end

-- Tab bar
tab_bar.tab_bar_config(config)

-- Keymap
for k, v in pairs(keymap.keymap_config()) do
	config[k] = v
end

return config
