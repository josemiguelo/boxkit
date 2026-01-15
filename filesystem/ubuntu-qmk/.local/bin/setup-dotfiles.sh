#!/bin/sh

set -ouex pipefail

. setup-git.sh
. download-chezmoi-dotfiles.sh
ASDF_TOOL_LIST="python neovim" . setup-asdf.sh
# . setup-qmk.sh