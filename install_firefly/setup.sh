#!/bin/bash

sudo tee /etc/security/limits.d/audio.conf <<'EOF'
@audio   -  rtprio   95
@audio   -  memlock  unlimited
EOF

sudo modprobe firewire_ohci firewire_core
sudo modprobe snd-firewire-lib snd-firewire-stream   # ALSA FW drivers


lspci | grep -i 1394
ffado-test Discover        # should list Phonic‑Firefly
ffado-mixer &              # optional mixer GUI

jackd -P95 -dfirewire -r48000 -p256 -n3 &
# or through qjackctl → Setup → Driver: FireWire

systemctl --user --now enable pipewire pipewire-pulse
systemctl --user --now enable pipewire-ffado
qpwgraph            # patchbay for PipeWire

aplay  -l            # Firefly appears as “USB Audio”
arecord -l


# record 5 s from input 1 and play it back
# arecord -d5 -fS32_LE -r48000 -c2 /tmp/test.wav
# aplay /tmp/test.wav

