#!/bin/sh

# Symlink distrobox shims
/tmp/scripts/set-distrobox-shims.sh

# Update the container and install packages
dnf5 update -y
grep -v '^#' /tmp/packages/fedora.packages | xargs dnf5 install -y

# set asdf
/tmp/scripts/set-asdf.sh
