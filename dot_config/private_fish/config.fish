if status is-interactive
    devbox global shellenv | source

    abbr -a gp gtrash put
    abbr -a rm gp
    abbr -a vim nvim

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    starship init fish | source
    atuin init fish | source
    zoxide init fish --cmd cd | source
    direnv hook fish | source
end
