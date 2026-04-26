# Modify $PATH
add_to_path() {
    [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

add_to_path "$HOME/.local/bin"

if [ -z "$SSH_CLIENT" ]; then
	# xset r rate 130 40; xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
	set-x-settings -d 5 &
fi
