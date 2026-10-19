#!/usr/bin/env bash
set -e

DIR="~/dxtfiles"
PKGS="$DIR/dxtfiles-scripts/packages"

clean() { grep -vE '^\s*(#|$)' "$1"; }
install_list() { clean "$1" | sudo pacman -S --needed -; }

# --- Official ---
for f in core system theming cli; do
    install_list "$PKGS/$f.txt"
done

# --- GPU ---
if lspci | grep -qi nvidia; then
    install_list "$PKGS/nvidia.txt"
else
    install_list "$PKGS/osgdrivers.txt"
fi

# --- CPU Microcode ---
if grep -qi GenuineIntel /proc/cpuinfo; then
    sudo pacman -S --needed intel-ucode
elif grep -qi AuthenticAMD /proc/cpuinfo; then
    sudo pacman -S --needed amd-ucode
fi

# --- AUR ---
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si)
fi
clean "$PKGS/aur.txt" | yay -S --needed -

# --- Oh-My-Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
clone_plugin() {
    [ -d "$ZSH_CUSTOM/plugins/$2" ] || git clone --depth 1 "$1" "$ZSH_CUSTOM/plugins/$2"
}
clone_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting

# --- Shell n services ---
[ "$SHELL" != "$(command -v zsh)" ] && chsh -s "$(command -v zsh)"
sudo systemctl enable sddm NetworkManager bluetooth

echo "You can now reboot"