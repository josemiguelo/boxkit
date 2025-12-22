#!/bin/sh

# Symlink distrobox shims
./set-distrobox-shims.sh

# Update the container and install packages
dnf update -y
grep -v '^#' ./fedora.packages | xargs dnf install -y
