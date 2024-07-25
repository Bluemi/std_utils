#!/bin/bash

function set_xinput_props {
  case "$HOSTNAME" in
    lightbox)
			xinput set-prop 10 329 1  # inverse trackpad scroll direction
			xinput set-button-map 10 1 2 3 5 4 6 7
			;;
		blackbox)
			silent xinput --set-prop "pointer:Logitech MX Vertical Advanced Ergonomic Mouse" "libinput Natural Scrolling Enabled" 1
			xinput set-button-map 10 1 2 3 5 4 6 7
			;;
	esac
}

if [ -z "$SSH_CLIENT" ]; then
	case "$1" in
		"")
			xset r rate 130 40
			set_xinput_props
			;;
		"normal")
			xset r rate 660 25
			set_xinput_props
			;;
		"slow")
			xset r rate 1660 10
			set_xinput_props
			;;
		*)
			echo "unknown option \"$1\""
			;;
	esac
fi
