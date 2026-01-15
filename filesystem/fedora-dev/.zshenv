DEV_DISTROBOX_MARKER="$HOME/.config/dotfiles-setup-done"
if [[ "${CONTAINER_ID:-}" == "fedora-dev" ]]; then
    if [ ! -f "$DEV_DISTROBOX_MARKER" ]; then
        echo "🖥️  you are on a dev environment. execute setup-dotfiles.sh"
    fi
fi