#!/bin/bash

set -ouex pipefail

export PATH="$PATH":"$HOME/.local/bin"
ASDF_TOOL_LIST="python neovim nodejs"

. download-starship.sh
. setup-git.sh
. setup-chezmoi.sh
. download-chezmoi-dotfiles.sh
. setup-asdf.sh
