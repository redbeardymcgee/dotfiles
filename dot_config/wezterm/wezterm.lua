local wezterm = require("wezterm")
local config = wezterm.config_builder()

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

-- config.ssh_domains = {
-- 	{
-- 		name = "mcgeedia",
-- 		remote_address = "media.mcgee.network",
-- 		remote_wezterm_path = "/home/josh/devbox/.local/bin/wezterm",
-- 	},
-- }

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
