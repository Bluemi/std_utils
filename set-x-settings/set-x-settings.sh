#!/bin/bash

function set_xinput_props {
  case "$HOSTNAME" in
    lightbox)
			xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1
			xinput set-button-map 10 1 2 3 5 4 6 7
			;;
		blackbox)
			mouse_id=$(xinput list | grep 'Logitech MX Vertical Advanced Ergonomic Mouse' | grep -v keyboard | grep -o 'id=[0-9]*' | cut -d= -f2 | head -n1)
			natural_scrolling_id="$(xinput list-props "$mouse_id" | grep -i 'natural scrolling' | grep -v 'Default' | grep -oP '\(\K[0-9]+')"

			# inverse scroll direction for mouse
			xinput set-prop "$mouse_id" "$natural_scrolling_id" 1
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
