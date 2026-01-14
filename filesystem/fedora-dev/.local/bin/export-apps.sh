#!/bin/sh

set -ouex pipefail

distrobox-export --app wezterm
distrobox-export --app antigravity
distrobox-export --app code
