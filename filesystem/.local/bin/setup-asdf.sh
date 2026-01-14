#!/bin/sh

set -ouex pipefail

##################
## INSTALLATION ##
##################

cd $HOME

ASDF_VERSION="0.18.0"
BIN_DIR="$HOME/.local/bin"
ASDF_DATA_DIR="$HOME/.asdf"

if command -v asdf >/dev/null 2>&1; then
  echo "🚀 asdf version $(asdf --version) is already installed. Skipping download."
else
  echo "asdf not found. Starting installation of v${ASDF_VERSION}..."

  ARCH=$(uname -m)
  case ${ARCH} in
  x86_64) ARCH_TYPE="amd64" ;;
  aarch64) ARCH_TYPE="arm64" ;;
  *)
    echo "Unsupported architecture: ${ARCH}"
    exit 1
    ;;
  esac

  mkdir -p "$BIN_DIR"
  mkdir -p "$ASDF_DATA_DIR"/{installs,plugins,shims}

  URL="https://github.com/asdf-vm/asdf/releases/download/v${ASDF_VERSION}/asdf-v${ASDF_VERSION}-linux-${ARCH_TYPE}.tar.gz"

  echo "Downloading from: ${URL}"
  curl -sSL "$URL" | tar -xz -C "$BIN_DIR" asdf

  chmod +x "${BIN_DIR}/asdf"
  chmod -R 777 "$ASDF_DATA_DIR"

  echo "🚀 Installation complete. asdf binary placed in ${BIN_DIR}/asdf."
  echo "version $(asdf --version)"
fi

#############
## PLUGINS ##
#############

asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git
asdf install asdf-plugin-manager 1.5.0 # sync this version with asdf config files

PLUGIN_MANAGER="$ASDF_DATA_DIR/shims/asdf-plugin-manager"
echo "🚀 installed asdf-plugin-manager version $($PLUGIN_MANAGER version)"

$PLUGIN_MANAGER add-all

if [[ "${NO_ASDF_TOOL_INSTALLATION:-}" == "true" ]]; then
  echo "Skipping asdf tools installation."
elif [[ -n "${ASDF_TOOL_LIST:-}" ]]; then
  echo "Installing tools for these plugins: $ASDF_TOOL_LIST"
  for tool in $ASDF_TOOL_LIST; do
    asdf install "$tool" || { echo "❌ Failed to install asdf tool: $tool"; }
  done
else
  echo "Installing all tools from ~/.tool-versions"
  export CFLAGS="-std=gnu11 -Wno-error=incompatible-pointer-types" # avoid error on older python versions
  asdf install

  (cd ~/.local/share/chezmoi && git remote set-url origin git@github.com:josemiguelo/.dotfiles.git)
fi
