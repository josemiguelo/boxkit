#!/bin/bash

set -ouex pipefail

if ! command -v chezmoi &> /dev/null; then
    echo "Chezmoi is not installed, downloading..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    echo "Chezmoi downloaded successfully."
else
    echo "Chezmoi is already installed, skipping download."
fi
