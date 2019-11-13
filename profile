# /etc/profile

# Set our umask
umask 022

# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/usr/local/sbin'
appendpath '/usr/local/bin'
appendpath '/usr/bin'
unset appendpath

export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"
alias myip="curl -i http://ip.sb"
alias background=nitrogen
alias themes=lxappearance
alias nvidiaon="sudo tee /proc/acpi/bbswitch <<<ON"
alias nvidiaoff="sudo tee /proc/acpi/bbswitch <<<OFF"
alias dockerstop="sudo systemctl stop docker.service"
alias dockerstart="sudo systemctl start docker.service"
alias dockerrestart="sudo systemctl restart docker.service"
alias lsport="ps -ef | grep"
alias aria2="aria2c --conf-path=/home/arch/.aria2/aria2.conf -D"
alias free="free -m"
alias up="yay -Syyu"
alias ir=startx
alias jd-gui="java -jar /usr/local/bin/jd-gui.jar"
alias d2j-dex2jar="d2j-dex2jar.sh -f"
alias battery="upower -i `upower -e | grep 'BAT'`"
