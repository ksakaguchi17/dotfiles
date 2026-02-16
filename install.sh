#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/git"

ln -sf "$DOTFILES_DIR/.config/git/config" "$HOME/.config/git/config"
ln -sf "$DOTFILES_DIR/.config/git/git-prompt.sh" "$HOME/.config/git/git-prompt.sh"
