if status is-interactive
    devbox global shellenv | source

    fish_add_path -gPm ~/.local/lib/node_modules/bin
    fish_add_path -gPm ~/.cargo/bin
    fish_add_path -gPm ~/.local/bin

    abbr -a gp gtrash put
    abbr -a vim nvim

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    set -gx NODE_PATH ~/.local/lib/node_modules

    starship init fish | source
    atuin init fish | source
    zoxide init fish --cmd cd | source
    direnv hook fish | source
end
