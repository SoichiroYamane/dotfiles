local wezterm = require("wezterm")

local function font_config()
	return {
		font_size = 16,
		line_height = 1.0,
		cell_width = 1.0,
		use_ime = true,

		-- use_cap_height_to_scale_fallback_fonts = true,
		font = wezterm.font_with_fallback({
			{
				family = "JetBrainsMono Nerd Font",
				scale = 1,
				assume_emoji_presentation = false,
			},
			-- {
			-- 	family = "SketchybarAppFontBg Nerd Font",
			-- 	scale = 1,
			-- 	assume_emoji_presentation = true,
			-- },
			{
				family = "Apple Color Emoji",
				scale = 1,
				assume_emoji_presentation = true,
			},
			{
				family = "FiraCode Nerd Font",
				scale = 1,
				assume_emoji_presentation = false,
			},
			{
				family = "Cica",
				scale = 1,
				assume_emoji_presentation = false,
			},
			{
				family = "JetBrainsMono Nerd Font",
				scale = 1,
				assume_emoji_presentation = true,
			},
			{
				family = "SF Mono",
				scale = 1,
				-- assume_emoji_presentation = true,
			},
			{
				family = "SF Pro",
				scale = 1,
				-- assume_emoji_presentation = true,
			},

			{
				family = "icomoon",
				scale = 1,
				-- assume_emoji_presentation = true,
			},
		}),
	}
end

return {
	font_config = font_config,
}
