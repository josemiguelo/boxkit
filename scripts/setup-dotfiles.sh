#!/bin/sh

# Install chezmoi if it's not there (this can stay in the build script)
if ! command -v chezmoi >/dev/null 2>&1; then
  sudo dnf5 install -y chezmoi
fi

# Only init if the source directory doesn't exist
if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  echo "Configuring dotfiles for $USER..."
  chezmoi init --apply --verbose https://github.com/josemiguelo/.dotfiles.git
else
  echo "Dotfiles already initialized."
fi
