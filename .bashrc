# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
echo "Running .bashrc"
unset TMP
unset TEMP
export PS1='$(whoami) $(date +%R) $(pwd)\n\$ '
export LS_COLORS="$LS_COLORS:di=02;36"
export ANT_HOME="$(echo $HOME|sed 's/ /\\ /g')/ant"
export GF_HOME=/cygdrive/c/glassfish-4.0/glassfish
echo $ANT_HOME
export ANT_HOME=$HOME/ant
export domain1_home=$HOME/glassfish4/glassfish/domains/domain1
export sapp_home="$HOME/jee6/projects/sapp3"
#export MAVEN_OPTS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=9999"
#export PFUNIT=/home/krMemo/fortran/pFUnit
export JAVA_HOME=$HOME/java
export WWW_HOME=www.google.com.mx
export S=$VPS_USER@$VPS_IP
export W=~/jee6/wildfly/wildfly-8.2.0.Final
export A=~/jee6/activiti/activiti-5.17.0
export EDITOR=vp

export PATH=~/sc:.:$ANT_HOME/bin:$JAVA_HOME/bin:~/utils/graphviz/bin:$GF_HOME/bin:$PATH:$HOME/privatebin:$HOME/privatebin/sql
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
alias tm="task sm"
alias tam="task add project:modex"

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls --group-directories-first -hF --color=yes --indicator-style=none'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
alias ts='tree -L 1'


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi
export PATH

zipedit(){
	echo "Usage: zipedit archive.zip folder/file.txt"
	curdir=$(pwd)
	unzip "$1" "$2" -d /tmp
	cd /tmp
	$EDITOR "$2" && zip --update "$curdir/$1" "$2"
	rm -f "$2"
	cd "$curdir"
}

PERL_MB_OPT="--install_base \"/home/VictorPolo/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/VictorPolo/perl5"; export PERL_MM_OPT;

if [ -z $SCREENRC ]; then
	export SCREENRC="$HOME/.screenrc2"
fi
