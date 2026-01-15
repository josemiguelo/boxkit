#!/bin/bash

set -ouex pipefail

SHELL_TYPE="zsh"
BIN_DIR="$HOME/.local/bin"

echo "Starting Starship installation..."
curl -sS https://starship.rs/install.sh | sh -s -- -y -b "$BIN_DIR"
echo "Finishing Starship installation..."
