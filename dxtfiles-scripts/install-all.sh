#!/usr/bin/env bash
set -e

DIR="$HOME/dxtfiles"
PKGS="$DIR/dxtfiles-scripts/packages"

clean() { grep -vE '^\s*(#|$)' "$1"; }
install_list() { clean "$1" | sudo pacman -S --needed -; }

# --- AUR ---
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si)
fi
clean "$PKGS/aur.txt" | yay -S --needed -

echo "You can now reboot"
