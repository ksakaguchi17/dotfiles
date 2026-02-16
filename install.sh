#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link_file() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  # 既に同じシンボリックリンクなら何もしない
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok: $dst -> $src"
    return 0
  fi

  # 実体ファイル/ディレクトリがあるなら退避（シンボリックリンクは退避不要）
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    local backup="${dst}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "backup: $dst -> $backup"
  fi

  ln -sfn "$src" "$dst"
  echo "link: $dst -> $src"
}

link_file "$DOTFILES_DIR/.config/git/config"        "$HOME/.config/git/config"
link_file "$DOTFILES_DIR/.config/git/git-prompt.sh" "$HOME/.config/git/git-prompt.sh"