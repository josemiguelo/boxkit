#!/bin/bash

set -ouex pipefail

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
