make_completions() {
	# Bash
	local bash_comp_dir="$XDG_DATA_HOME"/bash-completion/completions
	mkdir -p "$bash_comp_dir"
	$ rustup completions bash >"$bash_comp_dir"

	# Bash (macOS/Homebrew)
	# $ rustup completions bash >"$(brew --prefix)"/etc/bash_completion.d/rustup.bash-completion

	# Fish
	local fish_comp_dir="$XDG_CONFIG_HOME/fish/completions/rustup.fish"
	mkdir -p "$fish_comp_dir"
	$ rustup completions fish >"$fish_comp_dir"

	# Zsh
	# $ rustup completions zsh > "$XDG_CONFIG_HOME/zsh/functions"
}
