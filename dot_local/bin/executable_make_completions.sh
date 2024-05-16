make_completions() {
	# Bash
	$ rustup completions bash >~/.local/share/bash-completion/completions/rustup

	# Bash (macOS/Homebrew)
	$ rustup completions bash >$(brew --prefix)/etc/bash_completion.d/rustup.bash-completion

	# Fish
	$ mkdir -p ~/.config/fish/completions
	$ rustup completions fish >~/.config/fish/completions/rustup.fish

	# Zsh
	# $ rustup completions zsh > ~/.zfunc/_rustup

}
