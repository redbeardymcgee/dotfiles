# Nushell Config File
#
# version = "0.92.1"

use nu-themes/catppuccin-mocha.nu

$env.config.color_config = (catppuccin-mocha)

$env.config = {
    show_banner: false

    rm: {
        always_trash: true
    }
    history: {
        file_format: "sqlite"
        isolation: true
    }

    completions: {
        algorithm: "fuzzy"
    }

    filesize: {
        metric: true
    }
    use_kitty_protocol: true
    highlight_resolved_externals: true
    plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.
}
