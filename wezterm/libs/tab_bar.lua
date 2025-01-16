local wezterm = require("wezterm")

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local function tab_bar_config(config)
	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local edge_background = "#24283b"
		local background = "#414868"
		local foreground = "#0DB9D7"

		if tab.is_active then
			background = "#8c4351"
			foreground = "#eee8d5"
		elseif hover then
			background = "#0DB9D7"
			foreground = "#24283b"
		end

		local edge_foreground = background
		local title = wezterm.truncate_right(tab.active_pane.title, max_width - 5)

		return {
			{ Background = { Color = edge_foreground } },
			{ Foreground = { Color = edge_background } },
			{ Text = SOLID_RIGHT_ARROW },
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = " " },
			{ Text = title },
			{ Text = " " },
			{ Background = { Color = edge_background } },
			{ Foreground = { Color = edge_foreground } },
			{ Text = SOLID_RIGHT_ARROW },
		}
	end)

	config.use_fancy_tab_bar = true

	local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
	local bar_config = {
		position = "top",
		max_width = 32,
		padding = {
			left = 1,
			right = 1,
		},
		separator = {
			space = 1,
			left_icon = wezterm.nerdfonts.fa_long_arrow_right,
			right_icon = wezterm.nerdfonts.fa_long_arrow_left,
			field_icon = wezterm.nerdfonts.indent_line,
		},
		modules = {
			tabs = {
				active_tab_fg = 4,
				inactive_tab_fg = 6,
			},
			workspace = {
				enabled = false,
				icon = wezterm.nerdfonts.cod_window,
				color = 8,
			},
			leader = {
				enabled = true,
				icon = wezterm.nerdfonts.oct_rocket,
				color = 2,
			},
			pane = {
				enabled = true,
				icon = "",
				-- icon = "\u{E000}",
				color = 2,
			},
			username = {
				enabled = true,
				-- icon = wezterm.nerdfonts.fa_user,
				icon = "",
				color = 3,
			},
			hostname = {
				enabled = true,
				icon = wezterm.nerdfonts.cod_server,
				color = 4,
			},
			clock = {
				enabled = true,
				icon = wezterm.nerdfonts.md_calendar_clock,
				color = 5,
			},
			cwd = {
				enabled = false,
				icon = wezterm.nerdfonts.oct_file_directory,
				color = 7,
			},
			spotify = {
				enabled = false,
				icon = wezterm.nerdfonts.fa_spotify,
				color = 3,
				max_width = 64,
				throttle = 15,
			},
		},
	}
	bar.apply_to_config(config, bar_config)

	config.colors = config.colors or {}

	config.colors.tab_bar = { background = "#24283b" }
	config.colors.tab_bar.new_tab = {
		bg_color = "#24283b",
		fg_color = "#0DB9D7",
	}
	config.colors.tab_bar.new_tab_hover = {
		bg_color = "#24283b",
		fg_color = "#0DB9D7",
	}
end

return {
	tab_bar_config = tab_bar_config,
}
