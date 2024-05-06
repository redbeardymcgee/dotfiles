
# dotfiles

***Warning: Probably incomplete, may break at literally any moment.***

To install `chezmoi` for bootstrapping the dotfiles:
`sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"`

To use these dotfiles, you must have a repo named `dotfiles` (`git@github.com:<GITHUB_USERNAME>/dotiles.git`):
`chezmoi init --apply --ssh <GITHUB_USERNAME>`

For the devbox:
`distrobox assemble create --replace --file ~/.config/distrobox/dev.ini`

## Software

- [atuin](https://atuin.sh/)
- [bat](https://github.com/sharkdp/bat)
- [ble.sh](https://github.com/akinomyoga/ble.sh)
- [chezmoi](https://chezmoi.io)
- [distrobox](https://distrobox.io)
- [eza](https://eza.rocks/)
- [fzf](https://github.com/junegunn/fzf)
- [FiraCode Mono](https://www.nerdfonts.com/)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [mise](https://mise.jdx.dev/)
- [Neovide](https://neovide.dev/)
- [neovim](https://neovim.io/)
- [starship](https://starship.rs/)
- [Wezterm](https://wezfurlong.org/wezterm/index.html)
