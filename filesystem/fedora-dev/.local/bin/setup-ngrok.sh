#!/bin/sh

set -ouex pipefail

BIN_DIR="$HOME/.local/bin"

URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"

echo "Downloading ngrok from: ${URL}"
curl -sSL "$URL" | tar -xz -C "$BIN_DIR" ngrok

chmod +x "${BIN_DIR}/ngrok"
