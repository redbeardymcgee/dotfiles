#!/usr/bin/env bash

# CHANGE IF NEEDED:
# - replace with other path for the Neovim server pipe
server_path=$HOME/.cache/nvim/godot-server.pipe
file=$1
line=$2
col=$3

[[ -e $server_path ]] || neovide \
	--neovim-bin ~/.local/bin/nvim-nightly-bin \
	"$file" \
	-- \
	--listen "$server_path"

nvim-nightly-bin --server "$server_path" \
	--remote-send "<C-\><C-N>:n $file<CR>:call cursor($line,$col)<CR>" "${@:4}"
