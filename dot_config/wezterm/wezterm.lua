local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.scrollback_lines = 3500

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.harfbuzz_features = {
	"zero",
	"cv17",
	"ss05",
	"cv16",
	"cv31",
	"cv29",
	"cv30",
	"cv23",
	"ss08",
	"ss09",
	"cv25",
	"cv26",
	"cv32",
	"cv27",
	"cv28",
	"ss06",
	"ss07",
}

config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.85

config.ssh_domains = {
	{
		name = "mcgeedia",
		remote_address = "media.mcgee.network",
	},
}

config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.9,
	brightness = 0.4,
}

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

return config
