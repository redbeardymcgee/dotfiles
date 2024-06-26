local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mcgeedia = require("workspaces.mcgeedia")
local utils = require("utils")

local function is_inside_vim(pane)
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, _, _ = wezterm.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t"
			.. wezterm.shell_quote_arg(tty)
			.. " | "
			.. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|[n?]vim?(-nightly)?x?)(diff)?$'",
	})

	return success
end

local function is_outside_vim(pane)
	return not is_inside_vim(pane)
end

local function bind_if(cond, key, mods, action)
	local function callback(win, pane)
		if cond(pane) then
			win:perform_action(action, pane)
		else
			win:perform_action(act.SendKey({ key = key, mods = mods }), pane)
		end
	end

	return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

-- not inheriting `devbox` env properly
-- flatpak problem?
-- config.default_prog = {
-- 	"fish",
-- 	"-c",
-- 	"/var/home/josh/.local/share/devbox/global/default/.devbox/nix/profile/default/bin/nu",
-- }

config.scrollback_lines = 3500

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.harfbuzz_features = {
	"zero", -- 0
	"cv17", -- ~
	"ss05", -- @
	"cv16", -- *
	-- "cv27", -- []
	"cv29", -- {}
	"cv31", -- ()
	"cv30", -- ||
	"cv23", -- >=
	"ss08", -- == === != !==
	"ss09", -- >>= <<= ||= |=
	"cv25", -- .-
	"cv26", -- :-
	"cv32", -- .=
	"cv28", -- {. .}
	"ss06", -- \\
	"ss07", -- =~ !~
}

config.window_background_opacity = 0.85

config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.9,
	brightness = 0.4,
}

config.color_scheme = "Catppuccin Mocha"

config.window_frame = {
	active_titlebar_bg = "#1e1e2e",
	inactive_titlebar_bg = "#11111b",
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local edge_background = "#313244"
	local background = "#313244"
	local foreground = "#bac2de"
	if tab.is_active then
		background = "#585b70"
		foreground = "#cdd6f4"
	elseif hover then
		background = "#6c7086"
		foreground = "#9399b2"
	end
	local edge_foreground = background
	local title = tab_title(tab)
	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

local function create_ssh_domain_from_ssh_config(ssh_domains)
	if ssh_domains == nil then
		ssh_domains = {}
	end
	for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
		table.insert(ssh_domains, {
			name = host,
			remote_address = config.hostname .. ":" .. config.port,
			username = config.user,
			assume_shell = "Posix",
		})
	end
	return { ssh_domains = ssh_domains }
end

-- config.ssh_domains = utils.merge_tables(config, create_ssh_domain_from_ssh_config(config.ssh_domains))

config.ssh_domains = {
	{
		name = "McGeedia",
		remote_address = "media.mcgee.network",
		assume_shell = "Posix",
	},
}

config.keys = {
	bind_if(is_outside_vim, "h", "CTRL", act.ActivatePaneDirection("Left")),
	bind_if(is_outside_vim, "l", "CTRL", act.ActivatePaneDirection("Right")),
	bind_if(is_outside_vim, "j", "CTRL", act.ActivatePaneDirection("Down")),
	bind_if(is_outside_vim, "k", "CTRL", act.ActivatePaneDirection("Up")),
}

wezterm.on("update-status", function(window, pane)
	local meta = pane:get_metadata() or {}
	if meta.is_tardy then
		local secs = meta.since_last_response_ms / 1000.0
		window:set_right_status(string.format("tardy: %5.1fs⏳", secs))
	end
end)

wezterm.on("update-status", function(window, pane)
	local meta = pane:get_metadata() or {}
	local overrides = window:get_config_overrides() or {}
	if meta.password_input then
		overrides.color_scheme = "Red Alert"
	else
		overrides.color_scheme = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- wezterm.on("mux-startup", function()
-- mcgeedia.startup(wezterm)
-- end)

return config
