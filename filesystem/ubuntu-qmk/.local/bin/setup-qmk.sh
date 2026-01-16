#!/bin/bash

set -ouex pipefail

sudo apt-get install -y libusb-dev
python3 -m pip install --user qmk

"$HOME/.local/bin/qmk" setup josemiguelo/qmk_firmware -y

cd "$HOME/qmk_firmware"

git remote set-url origin git@github.com:josemiguelo/qmk_firmware.git

git fetch origin jm:jm
git checkout jm
git submodule update --init --recursive

qmk config user.keyboard=bastardkb/charybdis/4x6_trackball_left/v2/splinky_3
qmk config user.keymap=jm

sudo cp ./util/udev/50-qmk.rules /etc/udev/rules.d/
