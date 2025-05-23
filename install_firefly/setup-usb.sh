#!/bin/bash

# unplug FireWire, plug the USB‑B port to a USB‑2.0 controller
sudo modprobe snd-usb-audio               # autoloads on hot‑plug
dmesg | tail                              # should show “Phonic Firefly 808”
lsusb | grep -i phonic

sudo tee /etc/modprobe.d/firefly808.conf <<'EOF'
options snd-usb-audio implicit_fb=1
EOF
sudo mkinitcpio -P   # rebuild if you use an initramfs‑based kernel

aplay  -l         # playback devices
arecord -l        # capture devices

sudo pacman -S --needed pipewire pipewire-alsa pipewire-jack wireplumber qpwgraph
systemctl --user --now enable pipewire pipewire-pulse
pactl list cards short             # find card index N
pactl set-card-profile N pro-audio # exposes all 16 channels
qpwgraph                            # patch inputs ↔ outputs

jackd -P95 -dalsa -dhw:Firefly,0 -r48000 -p256 -n3 &
# or through qjackctl  →  Driver: ALSA, Interface: hw:Firefly

