#!/bin/sh

set -ouex pipefail

. download-chezmoi-dotfiles.sh
. setup-asdf.sh
. export-apps.sh
. install-fonts.sh