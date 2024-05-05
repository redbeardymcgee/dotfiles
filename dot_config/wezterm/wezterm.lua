local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local kb = require("keys")

local function activate_pane(window, pane, pane_direction, vim_direction)
	local isViProcess = pane:get_foreground_process_name():find("n?vim") ~= nil
	if isViProcess then
		window:perform_action( -- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("activate_pane_r", function(window, pane)
	activate_pane(window, pane, "Right", "l")
end)
wezterm.on("activate_pane_l", function(window, pane)
	activate_pane(window, pane, "Left", "h")
end)
wezterm.on("activate_pane_u", function(window, pane)
	activate_pane(window, pane, "Up", "k")
end)
wezterm.on("activate_pane_d", function(window, pane)
	activate_pane(window, pane, "Down", "j")
end)

config.keys = {
	-- 	{ key = "h", mods = "CTRL", action = act.DisableDefaultAssignment },
	-- 	{ key = "j", mods = "CTRL", action = act.DisableDefaultAssignment },
	-- 	{ key = "k", mods = "CTRL", action = act.DisableDefaultAssignment },
	-- 	{ key = "l", mods = "CTRL", action = act.DisableDefaultAssignment },
	--
	-- { key = "h", mods = "CTRL", action = act.EmitEvent("activate_pane_h") },
	-- { key = "j", mods = "CTRL", action = act.EmitEvent("activate_pane_h") },
	-- { key = "k", mods = "CTRL", action = act.EmitEvent("activate_pane_h") },
	-- { key = "l", mods = "CTRL", action = act.EmitEvent("activate_pane_h") },
	--
	-- 	{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	-- 	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	-- 	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	-- 	{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
}

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
	saturation = 0.3,
	brightness = 0.6,
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
