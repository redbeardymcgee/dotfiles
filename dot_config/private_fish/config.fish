if status is-interactive

    abbr -a gp gtrash put
    abbr -a rm echo "Use `gp` (`gtrash put`)"
    abbr -a vim nvim

    devbox global shellenv | source
    starship init fish | source
    atuin init fish | source
    zoxide init fish --cmd cd | source
    direnv hook fish | source
end
