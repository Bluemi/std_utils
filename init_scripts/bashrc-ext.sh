alias clear_pyc='rm -v $(find -name "*.pyc")'
alias py="ipython3 --no-banner"
alias i3lock="i3lock -i $HOME/Bilder/papa_backgrounds/DSC_0023.png"
alias l="ls -hAlt"
alias cop="cd src && . op -c && cd .."
alias g="grep -rnI"
alias vi="nvim"
alias goto=". goto"
alias ms="mount_strubbel"
alias okular="silent okular"
alias vlc="silent vlc"
alias lo="silent libreoffice"
alias gimp="silent gimp"
alias gw='silent gwenview'
alias reqs="pip install -U pip && pip install -r requirements.txt"
alias upip="pip install -U pip"

function c() {
	if [ -f ./compile.sh ]; then
		./compile.sh "$@"
	elif [ -f ./build.sh ]; then
		./build.sh "$@"
	else
		echo "neither ./compile.sh nor ./build.sh could be found!"
	fi
}

function r() {
	if [ -f ./run.sh ]; then
		./run.sh "$@"
	elif [ -f ./main.py ]; then
		./main.py "$@"
	else
		echo "neither ./run.sh nor ./main.py could be found!"
	fi
}

function redp() {
	goto redshift-pomodoro
	venv/bin/python redshift-pomodoro/cli/main.py
}

function docker_remove_containers() {
	docker stop -t 1 $(docker ps -a -q)
	docker rm $(docker ps -a -q)
}

function mkvenv() {
	python -m venv venv
	. venv/bin/activate
}

. "$HOME/.local/bin/goto" -c  # for goto autocompletion

export EDITOR="nvim"
export VISUAL="nvim"

if [ -z "$HISTCONTROL" ]; then
	export HISTCONTROL="ignoreboth:erasedups"
else
	export HISTCONTROL="ignoreboth:erasedups:$HISTCONTROL"
fi

# All terminals get history
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '

function merge_history() {
	history -a  # Append current session's history to HISTFILE
	history -n  # Read the history file, merging any new entries from other sessions
}

trap merge_history EXIT

if [ -z "$SSH_CLIENT" ]; then
	# xset r rate 130 40; xinput --set-prop "Microsoft Microsoft® Classic IntelliMouse®" "libinput Natural Scrolling Enabled" 1
	set-x-settings
fi

