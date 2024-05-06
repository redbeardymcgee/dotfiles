local M = {}

function M.startup(wezterm)
	local mux = wezterm.mux
	local containers_dir = "/opt/containers"
	local workspace_name = "McGeedia"

	local mcgeedia_tab, mcgeedia_pane, mcgeedia_window = mux.spawn_window({
		domain = {
			DomainName = "mcgeedia",
		},
		workspace = workspace_name,
	})

	mcgeedia_window:set_title("McGeedia")
	mcgeedia_tab:set_title("Shell")

	local containers_tab, containers_pane, _ = mcgeedia_window:spawn_tab({
		workspace = workspace_name,
		cwd = containers_dir,
	})

	containers_tab:set_title("Containers")

	containers_pane:split({ direction = "Right", args = { "nvim-nightly", "." } })

	mux.set_active_workspace(workspace_name)
end
return M
