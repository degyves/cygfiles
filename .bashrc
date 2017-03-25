function jobs_count {
	cnt=$(jobs -l |wc -l)
	if [ $cnt -gt 0 ]; then
		printf "%s" ${cnt}
	else
		printf "0"
	fi
}

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
echo "Running .bashrc"
unset TMP
unset TEMP
export TEMP=~/tmp
export PS1='\[\e[1;32m\]$(whoami) $(jobs_count) $(date +%R) $(pwd)\n$(__git_ps1)\n\$\[\e[0m\] '
export LS_COLORS="$LS_COLORS:di=02;36"
echo $ANT_HOME
export ANT_HOME=$HOME/ant
export domain1_home=$HOME/glassfish4/glassfish/domains/domain1
export sapp_home="$HOME/jee6/projects/sapp3"
#export MAVEN_OPTS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=9999"
#export PFUNIT=/home/krMemo/fortran/pFUnit
#export JAVA_HOME=$HOME/java
export WWW_HOME=www.google.com.mx
export S="$VPS_USER@$VPS_IP"
export T="$S -p 7252"
export G="git@$VPS_IP"
export W=~/jee7/wildfly
export EDITOR=nvim
export HOMEBREW_GITHUB_API_TOKEN=9e361bb4a913c47927fba8c8439ca3a8df0b6d60 
#export TERM=xterm-256

export
PATH=$PATH:$HOME/jee7/wildfly/bin:$HOME/bin:$HOME/privatebin/sql:~/offlineimap/
PATH=$PATH:/Users/victor/itc/apache-tomcat-7.0.69/bin
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

shopt -s autocd

# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups:erasedups

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:ls -ltrh' # Ignore the ls command as well

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

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings

# classify files in colour
# alias ls='ls --group-directories-first -hF --color=yes --indicator-style=none'                 
# classify files in colour
# alias ls='ls --group-directories-first -hF -G --indicator-style=none'  

# classify files in colour, order in reverse time
alias ls='ls -G -tr'                 
alias lh='ls -G -ltrh'                 

alias tesen='translate :es+en'
alias tenes='translate :en+es'

alias adpdf='asciidoctor-pdf -D out/'
alias ad='asciidoctor'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias cd.......='cd ../../../../../..'
alias p='pushd'
alias o='popd'
alias d='dirs'

# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
alias ts='tree -L 1'
alias mvn=mvn-color


# Functions
# #########

# alias t='task "$@" project:$(basename $PWD)'

ta(){
    base=$(basename $(PWD))
    task "$@" project:$base
}
alias t='ta list'
alias g='git'

export S=104.156.237.140

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

# print stderr in red, as:
# $ color command
color()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1

# C-R will do history-find reverse, but this will activate C-S for history-find
# forward
stty -ixon 

