#!/usr/bin/env bash
## Unattended setup script for bootstrapping my dev/shell container

set -euo pipefail

packages=(
	bat

	coreutils
	cmake

	eza

	fd-find
	fontconfig-devel
	freetype-devel
	fzf

	git-delta

	lazygit
	libxkbcommon-x11
	libXcursor

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

sh -c "$(curl -fsLS get.chezmoi.io)" -- \
	-b "$HOME/.local/bin" \
	init redbeardymcgee \
	--apply \
	--ssh \
	--force \
	--promptDefaults \
	--source "$HOME/../.local/share/chezmoi" \
	--cache "$HOME/../.cache/chezmoi"

curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -q -y --no-modify-path

PATH=$HOME/.cargo/bin:$PATH

cargo_packages=(
	atuin
	mise
	starship
)

curl -L \
	--proto '=https' \
	--tlsv1.2 \
	-sSf 'https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh' |
	bash

for package in "${cargo_packages[@]}"; do
	cargo binstall -y "$package"
done

cargo_git_packages=('https://github.com/neovide/neovide')

for package in "${cargo_git_packages[@]}"; do
	cargo binstall -y --git "$package" neovide
done

OPTBIN=$HOME/.local/opt/bin
NNVIM_DIR=$OPTBIN/nvim-nightly-bin

if [[ ! -x $NNVIM_DIR/bin/nvim-nightly-bin ]]; then
	mkdir -p "$OPTBIN"
	curl --proto '=https' \
		--tlsv1.2 \
		-sSLf 'https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz' |
		tar --overwrite \
			--transform 's/-linux64/-nightly-bin/' \
			--transform 's/nvim$/nvim-nightly-bin/' \
			-C "$OPTBIN" \
			-xzf -
fi

rm -rf "$HOME/.local/share/blesh"
git clone --recursive --depth 1 --shallow-submodules 'https://github.com/akinomyoga/ble.sh.git'
make -k -C ble.sh install PREFIX="$HOME/.local"
rm -rf ble.sh

curl --proto '=https' \
	--tlsv1.2 \
	-sSLf 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.tar.xz' |
	tar -C ~/.local/share/fonts -xJf -

fc-cache
