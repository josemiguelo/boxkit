#!/bin/bash

set -ouex pipefail

export PATH="$PATH":"$HOME/.local/bin"

. download-starship.sh
. setup-git.sh
. setup-chezmoi.sh
. download-chezmoi-dotfiles.sh
ASDF_TOOL_LIST="python neovim" . setup-asdf.sh
# . setup-qmk.sh
