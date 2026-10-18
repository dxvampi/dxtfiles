#!/usr/bin/env bash
set -e
sudo pacman -S --needed --noconfirm git base-devel
sudo pacman -S --needed --noconfirm - < packages/pkglist.txt

if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    (cd /tmp/yay-bin && makepkg -si --noconfirm)
fi
yay -S --needed --noconfirm - < packages/aur.txt
