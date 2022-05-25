#!/usr/bin/env sh

SRCDIR=$(dirname -- "$( readlink -f -- "$0"; )");

ln -sf "$SRCDIR/.zshrc" "$SRCDIR/.p10k.zsh" "$SRCDIR/.antigenrc" "$HOME"
