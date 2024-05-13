setup_completions() {
	for shell in bash fish zsh; do
		out_dir=${XDG_DATA_HOME:-$HOME/.local/share}/$shell/completion.d

		atuin gen-completions --shell $shell --out-dir "$out_dir"

	done
}
