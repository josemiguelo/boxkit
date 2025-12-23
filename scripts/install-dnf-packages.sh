#!/bin/bash

set -ouex pipefail

dnf5 install -y @development-tools

PACKAGES=(
    # CLI Tools
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

    # Development Tools
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

echo "Updating system and installing ${#PACKAGES[@]} items..."

dnf5 install -y "${PACKAGES[@]}"

dnf5 install -y 'dnf-command(copr)' && \
    dnf5 copr enable -y atim/starship && \
    dnf5 install -y starship

dnf5 clean all

echo "🚀 Installation complete!"