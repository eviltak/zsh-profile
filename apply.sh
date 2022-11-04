#!/usr/bin/env sh

SRCDIR=$(dirname -- "$( readlink -f -- "$0"; )");

curl -L git.io/antigen > $HOME/antigen.zsh
ln -sf "$SRCDIR/.zshrc" "$SRCDIR/.p10k.zsh" "$SRCDIR/.antigenrc" "$HOME"
mv $HOME/.config/leftwm/config.toml $HOME/.config/leftwm/config.toml.bak
cp leftwm-config.toml $HOME/.config/leftwm/config.toml
