## Unattended setup script for bootstrapping my dev/shell container

if [[ ! -x /usr/bin/lazygit ]]; then
	sudo dnf copr enable atim/lazygit -y
	sudo dnf install lazygit -y
fi

if [[ ! -x /usr/bin/wezterm ]]; then
	sudo dnf copr enable wezfurlong/wezterm-nightly -y
	sudo dnf install wezterm -y
fi

if [[ ! -x ~/.cargo/bin/rustup ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --profile minimal --no-modify-path
fi

if [[ ! -x /usr/bin/nvim ]]; then
	curl --proto '=https' --tlsv1.2 -sSLf 'https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz' | tar --transform 's/-linux64/-nightly/' --transform 's/nvim$/nvim-nightly-bin/' -C ~/.local/bin -xzf -
fi

if [[ ! -x ~/.cargo/bin/neovide ]]; then
	cargo install -f --git https://github.com/neovide/neovide
fi

if [[ ! -x ~/.cargo/bin/mise ]]; then
	cargo install -f mise
fi

if [[ ! -x ~/.cargo/bin/atuin ]]; then
	cargo install -f atuin
fi

if [[ ! -x ~/.cargo/bin/starship ]]; then
	cargo install -f starship
fi

if [[ ! -r ~/.local/share/blesh/ble.sh ]]; then
	git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
	make -C ble.sh install PREFIX="$HOME"
	rm -rf ble.sh
fi
