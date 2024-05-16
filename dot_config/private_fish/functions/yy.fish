function yy
    set tmp (mktemp -p $XDG_RUNTIME_DIR yazi-cwd.XXXXXX)
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd "$cwd"
    end
end
