#!/bin/sh

set -ouex pipefail

/tmp/scripts/set-distrobox-shims.sh
/tmp/scripts/install-dnf-packages.sh