#!/bin/bash

# AUTHFILE="$HOME/.local/etc/htw_vpn/auth.txt"
# 
# if [ ! -f "$AUTHFILE" ]; then
# 	echo "authfile not found: \"$AUTHFILE\""
# 	exit 1
# fi
# 
# user="$(head "$AUTHFILE" -n 1)"
# pw="$(tail "$AUTHFILE" -n 1)"
# 
# sudo openconnect --user "$user" --authgroup "HTW-SSL-VPN-Split" "vpncl.htw-berlin.de" --passwd-on-stdin <<< "$pw"

CONFIGFILE="$HOME/.local/etc/htw_vpn/openvpn-HTW-mfa-connect-config.ovpn"
AUTHFILE="$HOME/.local/etc/htw_vpn/auth"

sudo openvpn --config "$CONFIGFILE" --auth-user-pass "$AUTHFILE" --dev tun0
