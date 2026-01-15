#!/bin/bash

set -ouex pipefail

SHELL_TYPE="zsh"
BIN_DIR="$HOME/.local/bin"

echo "Starting Starship installation..."
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$BIN_DIR"
else
    echo "Starship is already installed, skipping download."
fi
echo "Finishing Starship installation..."
