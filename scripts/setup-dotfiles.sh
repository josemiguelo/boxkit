#!/bin/sh

# Only run if we are NOT root (ensures it goes to your user)
if [ "$(id -u)" -ne 0 ]; then
  if [ ! -d "$HOME/.local/share/chezmoi" ]; then
    echo "🚀 Initializing dotfiles in isolated home: $HOME"
    # --force handles cases where Distrobox might have created dummy config files
    chezmoi init --apply --verbose --force https://github.com/josemiguelo/.dotfiles.git
  fi
fi
