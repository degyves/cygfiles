# base-files version 3.9-3

echo "Running .bash_profile"

echo "  Running ssh-agent"
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
startSSH_AGENT(){
	eval $($SSHAGENT $SSHAGENTARGS)
	trap "kill $SSH_AGENT_PID" 0
	echo $SSH_AGENT_PID > ~/.SSH_AGENT_PID
	echo $SSH_AUTH_SOCK > ~/.SSH_AUTH_SOCK	
	ssh-add
	echo "  ssh-agent started."
}
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	echo "  Verify is ~/.SSH_AGENT_PID file exists"
	if [ -f ~/.SSH_AGENT_PID ]; then
		echo "    ...file exists. Recovering information."
		SSH_AGENT_PID2=$(ps ux|grep ssh-agent|awk '{print $1}')
		SSH_AGENT_PID3=$(cat ~/.SSH_AGENT_PID)
		SSH_AUTH_SOCK2=$(cat ~/.SSH_AUTH_SOCK)
		if [ "$SSH_AGENT_PID2" == "$SSH_AGENT_PID3" ]; then
			echo "      Already exists ssh-agent. Set env vars."
			export SSH_AGENT_PID="$SSH_AGENT_PID2"
			export SSH_AUTH_SOCK="$SSH_AUTH_SOCK2"
			echo "      Env vars have been set."
		else
			echo "      There is no ssh-agent."
			export SCREENRC="$HOME/.screenrc"
			startSSH_AGENT
			ConEmu64 /single /cmd "c:\cygwin64\Cygwin.bat"
		fi
		unset SSH_AGENT_PID2 SSH_AGENT_PID3 SSH_AUTH_SOCK2
	else
		echo "  ...file does not exists."
		export SCREENRC="$HOME/.screenrc"
		startSSH_AGENT
		ConEmu64 /single /cmd "c:\cygwin64\Cygwin.bat"
	fi
fi

# To pick up the latest recommended .bash_profile content,
# look in /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# ~/.bash_profile: executed by bash for login shells.

# source the system wide bashrc if it exists
if [ -e /etc/bash.bashrc ] ; then
	source /etc/bash.bashrc
fi

# source the users bashrc if it exists
if [ -e "${HOME}/.bashrc" ] ; then
	source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
	PATH=${HOME}/bin:${PATH}
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH=${HOME}/man:${MANPATH}
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH=${HOME}/info:${INFOPATH}
# fi

if which jenv > /dev/null; then eval "$(jenv init - )"; fi


##
# Your previous /Users/victor/.bash_profile file was backed up as /Users/victor/.bash_profile.macports-saved_2016-06-23_at_18:49:41
##

# MacPorts Installer addition on 2016-06-23_at_18:49:41: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/victor/.bash_profile file was backed up as /Users/victor/.bash_profile.macports-saved_2016-06-23_at_18:56:32
##

# MacPorts Installer addition on 2016-06-23_at_18:56:32: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# export LC_ALL=es_MX.UTF-8
# export LANG=es_MX.UTF-8
