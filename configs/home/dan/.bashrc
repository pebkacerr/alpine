#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function gpush() {
	git add .
	git commit -a -m "$1"
	git push
}

function prequires() {
	pactree -rul $1 | xargs -n 1 pacman -Qtq
}

function pclean() {
	pacman -Qtdq | sudo pacman -Rns -
}

function ptree() {
	if [ -n "$1" ] 
	then
		pactree -c $@
	else
		pacman -Qqe | xargs -n 1 pactree -c
	fi
}

function fonts() {
	fc-cache

	echo -e "Available Fonts:"

	if [ -z "$1" ]
	then
		fc-list -f " - %{family[0]}\n" | sort | uniq
	else
		fc-list -f "*%{spacing[0]}: - %{family[0]}\n" | sed "s/*100:/mono:/" | sed "s/*:/prop:/" | sort | uniq | grep "$1:" | cut -d ':' -f 2
	fi

	echo -e "\nMatch:"
	echo " - serif: $(fc-match serif)"
	echo " - sans-serif: $(fc-match sans-serif)"
	echo " - monospace: $(fc-match monospace)"
}

alias less='less --RAW-CONTROL-CHARS'
alias grep='grep --color=always'

alias ls='lsd -1 --color=always --group-directories-first'

alias ll='ls -l'
alias lla='ll -a'

alias lt='ls --tree --depth 2'
alias lta='lt -a'

PS1='[\u@\h \W]\$ '

if [ "$(tty)" == "/dev/tty1" ]; then
	exec Hyprland &> /dev/null
fi

eval "$(starship init bash)"