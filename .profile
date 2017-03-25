# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization
# setaf colores:
# black 0
# red 1
# green 2
# yellow 3
# blue 4
# purple 5
# cyan 6
# white 7
JAVA_HOME=~/java
TERM=wsvt25
LSCOLORS=Ea
MAIL=/var/mail/@TODO_OPENBSD_USER
OBSD_VERSION=`uname -a|awk '{print $3}'`
LESS="-m"
LSCOLORS=Ea
export JAVA_HOME TERM LS_COLORS MAIL OBSD_VERSION LESS LSCOLORS
HOST=`hostname`
HOST1="ACER"
HOST2="@TODO_VPS_HOST"
PS1COLOR=7
if [[ $HOST = $HOST1 ]];then
 PS1COLOR=2 
else
 PS1COLOR=3
fi
# PS1="\[$(tput setaf $PS1COLOR)\]\u@\H:\w\n\$\[$(tput op)\] "


PS1="$(tput setaf $PS1COLOR)$(logname)@$(hostname -s):$(date +%R) $PWD
$ $(tput op)"
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:$HOME/forge/bin:$JAVA_HOME/bin:.
# PKG_PATH=http://ftp3.usa.openbsd.org/pub/OpenBSD/$OBSD_VERSION/packages/`machine -a`/
# last commands in vi mode
set -o vi
# ls con color
# alias
# alias ls='colorls -G'

# funcion para usar taskwarrior usando el directorio .task
# que est'e dentro del directorio actual
# esto nos permite organizar los tipos de tareas por directorios
function t {
	export TASKDATA=$PWD/.task
	task rc:$PWD/.taskrc "$@"
}
# en ksh no es necesario exportar la funcion
# export -f t


