set -e

if [ -z "$__DEVBOX_INIT_HOOK_e720f63ce999bdf50361d3bf8749d8a9d0919c8f1f234382876214e0874a328b" ]; then
    . /var/home/josh/.local/share/devbox/global/default/.devbox/gen/scripts/.hooks.sh
fi

grep -qF '.npm-packages' ~/.npmrc || echo 'prefix=~/.npm-packages' >> ~/.npmrc
grep -qF '.npm-packages' ~/.zshrc || echo 'export PATH=$PATH:~/.npm-packages/bin' >> ~/.zshrc
grep -qF '.npm-packages' ~/.bashrc || echo 'export PATH=$PATH:~/.npm-packages/bin' >> ~/.bashrc
mkdir -p ~/.npm-packages
