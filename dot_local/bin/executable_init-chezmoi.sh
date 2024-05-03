#!/usr/bin/env bash

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init 'git@github.com:redbeardymcgee/dotfiles.git' --apply --promptDefaults --force
