#!/bin/sh

set -ouex pipefail

if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  echo "🚀 Initializing dotfiles in isolated home: $HOME"
  sudo chown -R $USER:$USER "$HOME/.local"
  chezmoi init --apply --verbose --force https://github.com/josemiguelo/.dotfiles.git

  echo "return { color_scheme = 'Tokyo Night Day' }" >"$HOME/.config/wezterm/private.lua"
else
  echo "🚀 Dotfiles have already been initialized!"
fi
