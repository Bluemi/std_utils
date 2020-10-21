#!/bin/bash

MUSIC_PATH='/home/alok/Musik'

# mount music
mkdir -p "$MUSIC_PATH"

sshfs alok@Strubbel:/Musik/MusicBruno17 "$MUSIC_PATH"
result=$?

if [ "$result" -eq "0" ]; then
	# start cmus
	/home/alok/.local/bin/cmus
else
	echo "failed to mount $MUSIC_PATH"
	sleep 3
fi

# umount music
fusermount -u "${MUSIC_PATH}" && rm -d "${MUSIC_PATH}"
