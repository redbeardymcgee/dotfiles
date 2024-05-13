if status is-interactive

    abbr -a cat bat

    abbr -a gp gtrash put
    abbr -a rm echo "Use `gp` (`gtrash put`)"
    abbr -a vim nvim

    devbox global shellenv | source

    atuin init fish | source
    starship init fish | source
    direnv hook fish | source
    zoxide init fish --cmd cd | source
end
