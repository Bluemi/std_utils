# Modify $PATH
add_to_path() {
    if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
			if [ "$2" = "end" ]; then
				export PATH="$PATH:$1"
			else
				export PATH="$1:$PATH"
			fi
		fi
}

add_to_path "$HOME/.local/bin"
add_to_path "$HOME/apps/flutter/bin" end

if [ -z "$SSH_CLIENT" ]; then
	# xset r rate 130 40; xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
	set-x-settings -d 5 &
fi
