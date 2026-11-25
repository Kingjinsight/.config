#!/bin/sh
# Symlink every config in this repo into $HOME, moving anything it replaces to ~/.dotfiles-backup.
set -e
cd "$(dirname "$0")"
DOTFILES=$(pwd)
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

git ls-files | grep -v -E '^(README\.md|Brewfile|install\.sh|\.gitignore)$|^\.claude/skills/' | while read -r f; do
  target="$HOME/$f"
  [ "$(readlink "$target")" = "$DOTFILES/$f" ] && continue
  if [ -e "$target" ] || [ -L "$target" ]; then
    mkdir -p "$BACKUP/$(dirname "$f")"
    mv "$target" "$BACKUP/$f"
  fi
  mkdir -p "$(dirname "$target")"
  ln -s "$DOTFILES/$f" "$target"
done

brew bundle --no-upgrade --file="$DOTFILES/Brewfile"
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone -q https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null
