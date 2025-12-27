#!/bin/bash

set -ouex pipefail

###############
## DEV TOOLS ##
###############
dnf5 install -y @development-tools
DEV_PACKAGES=(
  "zlib-devel"
  "bzip2-devel"
  "readline-devel"
  "sqlite"
  "sqlite-devel"
  "openssl-devel"
  "xz-devel"
  "libffi-devel"
  "findutils"
  "tk-devel"
  "libzstd-devel"
  "autoconf"
  "gcc"
  "rust"
  "patch"
  "libyaml-devel"
  "gdbm-devel"
  "ncurses-devel"
  "perl-FindBin"
)
echo "Installing dev packages ${#DEV_PACKAGES[@]} ..."
dnf5 install -y "${DEV_PACKAGES[@]}"

###############
## CLI TOOLS ##
###############
CLI_PACKAGES=(
  "atuin"
  "btop"
  "bat"
  "chezmoi"
  "dbus-x11"
  "fzf"
  "just"
  "make"
  "ripgrep"
  "wl-clipboard"
  "zsh"
  "zoxide"
  "fd-find"
  "trash-cli"
)
echo "Installing cli packages ${#CLI_PACKAGES[@]} ..."
dnf5 install -y "${CLI_PACKAGES[@]}"

##############
## STARSHIP ##
##############
dnf5 install -y 'dnf-command(copr)' &&
  dnf5 copr enable -y atim/starship &&
  dnf5 install -y starship

##########
## YAZI ##
##########
dnf5 copr enable -y lihaohong/yazi
dnf5 install -y yazi

#############
## WEZTERM ##
#############
dnf5 install -y https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203_110809_5046fc22-1.fedora39.x86_64.rpm

## clean everything ......
dnf5 clean all
echo "🚀 Installation complete!"
