#!/usr/bin/env bash

## Unattended setup script for bootstrapping my dev/shell container

packages=(
	coreutils
	cmake

	diff-so-fancy

	fd-find
	fontconfig-devel
	freetype-devel
	fzf

	lazygit
	libxkbcommon-x11

	openssl-devel

	neovim
	ripgrep

	xclip
	xdotool
	xsel
	xwininfo

	wezterm
)

repos=(
	atim/lazygit
	wezfurlong/wezterm-nightly
)

for repo in "${repos[@]}"; do
	sudo dnf -y copr enable "$repo"
done

sudo dnf -y install "${packages[@]}"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs |
	sh -s -- -q -y --no-modify-path

. "$HOME/.cargo/env"

OPTBIN=$HOME/.local/opt/bin
NNVIM_DIR=$OPTBIN/nvim-nightly-bin

if [[ ! -x $NNVIM_DIR/bin/nvim-nightly-bin ]]; then
	curl --proto '=https' \
		--tlsv1.2 \
		-sSLf 'https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz' |
		tar --overwrite \
			--transform 's/-linux64/-nightly-bin/' \
			--transform 's/nvim$/nvim-nightly-bin/' \
			-C "$OPTBIN" \
			-xzf -
fi

cargo_packages=(
	atuin
	mise
	starship
)

for package in "${cargo_packages[@]}"; do
	cargo install "$package"
done

cargo_git_packages=('https://github.com/neovide/neovide')

for package in "${cargo_git_packages[@]}"; do
	cargo install --git "$package"
done

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX="$HOME/.local"
rm -rf ble.sh

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply redbeardymcgee
