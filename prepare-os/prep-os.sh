#!/bin/bash

setup_dir() {
	if [ -d "os" ]; then
		exit 1
	fi
	mkdir os
	cd os
}

create_sh() {
	setup_dir

	echo "#!/bin/bash" > myscript.sh
	echo "" >> myscript.sh
	echo "echo \"hello world\"" >> myscript.sh
	chmod u+x myscript.sh
}

create_c() {
	setup_dir

	echo "#include <stdio.h>" > main.c
	echo "" >> main.c
	echo "int main() {" >> main.c
	echo "    printf(\"hello world!\\n\");" >> main.c
	echo "    return 0;" >> main.c
	echo "}" >> main.c

	echo "#!/bin/bash" > build.sh
	echo "" >> build.sh
	echo "gcc -o exe main.c" > build.sh
	chmod u+x build.sh
}

case "$1" in
	sh)
		create_sh
		;;
	c)
		create_c
		;;
	"")
		echo "choose between sh and c"
		;;
esac
