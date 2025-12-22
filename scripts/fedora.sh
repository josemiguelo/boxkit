#!/bin/sh

# Symlink distrobox shims
./set-distrobox-shims.sh

# Update the container and install packages
dnf5 update -y
grep -v '^#' ./fedora.packages | xargs dnf5 install -y

# set asdf
./set-asdf.sh
