#!/bin/bash

# This file is copied into .profile

# create new poweroff script
new_poweroff="$HOME/.local/bin/poweroff"
echo "#!/bin/bash" > "$new_poweroff"
echo "gwenview $HOME/.local/important_image.jpg" > "$new_poweroff"

# download important image

