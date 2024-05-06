local M = {}

function M.startup(wezterm, workspace_name)
	local mux = wezterm.mux
	local config_dir = wezterm.home_dir .. ".config"

	local df_tab, df_pane, df_window = mux.spawn_window({
		workspace = workspace_name,
		cwd = config_dir,
		args = { "nvim-nightly", "." },
	})

	df_tab:set_title("dotfiles")

	df_pane:split({ direction = "Right" })

	df_pane:activate()
end
