set -e

if [ -z "$__DEVBOX_INIT_HOOK_e720f63ce999bdf50361d3bf8749d8a9d0919c8f1f234382876214e0874a328b" ]; then
    . /var/home/josh/.local/share/devbox/global/default/.devbox/gen/scripts/.hooks.sh
fi

if [ ! -f $HOME/.config/starship.toml ]
then
curl -fsSL https://devbox.getfleek.dev/config/starship/starship.toml > $HOME/.config/starship.toml
fi
