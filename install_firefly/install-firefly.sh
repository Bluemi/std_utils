#!/bin/bash

sudo pacman -Syu            # full upgrade
# sudo pacman -S --needed linux-rt linux-rt-headers   # low‑latency kernel (optional)
sudo pacman -S --needed alsa-utils alsa-firmware \
     libffado ffado-tools ffado-dbus-server ffado-mixer \
     jack2 jack2-dbus qjackctl \
     pipewire pipewire-alsa pipewire-jack pipewire-ffado wireplumber
sudo usermod -aG audio $USER

