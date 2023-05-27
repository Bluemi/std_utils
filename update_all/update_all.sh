#!/bin/bash

echo "--- updating yay packages ---"
MAKEFLAGS="-j$(nproc)" yay -Syu --noconfirm

echo "--- updating flatpak packages ---"
sudo flatpak update --assumeyes

echo "--- updating snap packages ---"
sudo snap refresh
sleep 1
sudo systemctl stop snapd.service

rustup update

# reapply x settings
if which set-x-settings 2> /dev/null; then
	set-x-settings
fi
