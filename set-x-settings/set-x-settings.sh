#!/bin/bash

if [ -z "$SSH_CLIENT" ]; then
	case "$1" in
		"")
			xset r rate 130 40
			# silent xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
			silent xinput --set-prop "pointer:Logitech MX Vertical" "libinput Natural Scrolling Enabled" 1
			xinput set-button-map 10 1 2 3 5 4 6 7
			;;
		"normal")
			xset r rate 660 25
			# silent xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
			silent xinput --set-prop "pointer:Logitech MX Vertical" "libinput Natural Scrolling Enabled" 1
			xinput set-button-map 10 1 2 3 5 4 6 7
			;;
		*)
			echo "unknown option \"$1\""
			;;
	esac
fi
