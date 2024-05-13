if status is-interactive
    devbox global shellenv | source

    abbr -a gp gtrash put
    abbr -a rm echo "Use `gp` (`gtrash put`)"
    abbr -a vim nvim

    starship init fish | source
    atuin init fish | source
    zoxide init fish --cmd cd | source
    direnv hook fish | source
end
