#!/bin/bash

set -ouex pipefail

apt-get install -y libusb-dev
python3 -m pip install --user qmk

"$HOME/.local/bin/qmk" setup josemiguelo/qmk_firmware -y
