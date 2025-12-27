#!/bin/sh

set -ouex pipefail

ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman
