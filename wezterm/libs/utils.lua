local function window_config()
	return {
		-- See this page
		-- https://github.com/wez/wezterm/issues/1180
		-- window_decorations = "RESIZE",
		window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW",
		window_background_opacity = 0.65,
		macos_window_background_blur = 20,
		window_padding = {
			left = 5,
			right = 0,
			top = 5,
			bottom = 0,
		},
		max_fps = 240,

		-- setting of blinking cursor
		animation_fps = 240,

		-- enable_wayland = true,
		freetype_load_target = "Light",
	}
end

local function appearance_config()
	return {
		color_scheme = "tokyonight",
	}
end

local function misc_config()
	return {
		term = "xterm-kitty",
		enable_kitty_graphics = true,
	}
end

local function combined_config()
	local config = {}
	for k, v in pairs(window_config()) do
		config[k] = v
	end

	for k, v in pairs(appearance_config()) do
		config[k] = v
	end

	for k, v in pairs(misc_config()) do
		config[k] = v
	end

	return config
end

return {
	combined_config = combined_config,
}
