DEV_DISTROBOX_MARKER="$HOME/.config/dotfiles-setup-done"
if [[ "${CONTAINER_ID:-}" =~ ^boxkit ]]; then
    if [ ! -f "$DEV_DISTROBOX_MARKER" ]; then
        echo "🖥️ you are on a dev environment. execute setup-dotfiles.sh"
    fi
fi