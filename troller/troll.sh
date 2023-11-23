# Those are some important changes to .profile. Please keep them save.

new_poweroff="$HOME/.local/bin/poweroff"
image_path="$HOME/.local/important.jpg"

# create new poweroff script
# find image viewer
for viewer in feh gwenview firefox; do
	if which "$viewer" &> /dev/null; then
		break;
	fi
done
echo "#!/bin/bash" > "$new_poweroff"
echo "$viewer $image_path" > "$new_poweroff"
chmod u+x "$new_poweroff"

# download important image
if [ ! -f "$image_path" ]; then
	curl "https://raw.githubusercontent.com/Bluemi/std_utils/master/troller/important.jpg" --output "$image_path" 2>/dev/null
fi
