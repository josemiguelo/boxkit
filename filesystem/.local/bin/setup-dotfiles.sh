#!/bin/sh

set -ouex pipefail

. setup-git.sh
. download-chezmoi-dotfiles.sh
. install-fonts.sh
. export-apps.sh
. setup-asdf.sh
