test -z $DEVBOX_COREPACK_ENABLED || corepack enable --install-directory "/var/home/josh/.local/share/devbox/global/default/.devbox/virtenv/nodejs/corepack-bin/"
test -z $DEVBOX_COREPACK_ENABLED || export PATH="/var/home/josh/.local/share/devbox/global/default/.devbox/virtenv/nodejs/corepack-bin/:$PATH"
/var/home/josh/.local/share/devbox/global/default/.devbox/virtenv/python3Full/bin/venvShellHook.sh
. ${DEVBOX_GLOBAL_ROOT}/init.sh