#!/bin/bash

if [ -z "$SSH_CLIENT" ]; then
	xset r rate 130 40; xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
fi
