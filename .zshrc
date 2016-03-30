# Path to your oh-my-zsh installation.
  export ZSH=/home/VictorPolo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git dircycle fasd mvn taskwarrior vi-mode)

# User configuration

  export PATH="/home/VictorPolo/bin:/home/VictorPolo/bin:/home/VictorPolo/sc:.:/home/VictorPolo/ant/bin:/home/VictorPolo/java/bin:/home/VictorPolo/utils/graphviz/bin:/cygdrive/c/glassfish-4.0/glassfish/bin:/home/VictorPolo/bin:/home/VictorPolo/bin:/home/VictorPolo/sc:.:/home/VictorPolo/ant/bin:/home/VictorPolo/java/bin:/home/VictorPolo/utils/graphviz/bin:/cygdrive/c/glassfish-4.0/glassfish/bin:/usr/local/bin:/usr/bin:/cygdrive/c/ProgramData/Oracle/Java/javapath:/cygdrive/c/Program Files (x86)/CommonQt:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/WINDOWS/System32/WindowsPowerShell/v1.0:/cygdrive/c/Program Files/Microsoft SQL Server/100/Tools/Binn:/cygdrive/c/Program Files/Microsoft SQL Server/100/DTS/Binn:/cygdrive/c/Program Files (x86)/Microsoft SQL Server/100/Tools/Binn/VSShell/Common7/IDE:/home/VictorPolo/jee6/maven/bin:/home/VictorPolo/jee7/gradle/bin:/home/VictorPolo/ffmpeg/bin:/cygdrive/c/Program Files/Microsoft SQL Server/110/Tools/Binn:/cygdrive/c/Program Files (x86)/Microsoft SQL Server/100/Tools/Binn:/cygdrive/c/sbcl-1.2.7:/cygdrive/c/Program Files (x86)/Microsoft SDKs/TypeScript/1.0:/cygdrive/c/Program Files/Microsoft SQL Server/120/Tools/Binn:/cygdrive/c/Program Files/nodejs:/cygdrive/c/Program Files (x86)/Skype/Phone:/cygdrive/c/Tcl/bin:/cygdrive/c/lyx/miktex/miktex/bin:/usr/bin:/cygdrive/c/Program Files (x86)/Microsoft SDKs/F#/3.1/Framework/v4.0:/cygdrive/c/Windows/Microsoft.NET/Framework/v4.0.30319:/cygdrive/c/Program Files (x86)/Mono-3.2.3/bin:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/WINDOWS/System32/WindowsPowerShell/v1.0:/cygdrive/c/Program Files/Microsoft SQL Server/100/Tools/Binn:/cygdrive/c/Program Files/Microsoft SQL Server/100/DTS/Binn:/cygdrive/c/Program Files (x86)/Microsoft SQL Server/100/Tools/Binn/VSShell/Common7/IDE:/home/VictorPolo/jee6/maven/bin:/home/VictorPolo/ffmpeg/bin:/cygdrive/c/Program Files/nodejs:/cygdrive/c/Program Files/Microsoft SQL Server/110/Tools/Binn:/cygdrive/c/Program Files (x86)/Microsoft SDKs/TypeScript/1.0:/cygdrive/c/Program Files (x86)/Microsoft SQL Server/100/Tools/Binn:/cygdrive/c/sbcl-1.2.7:/home/VictorPolo/jee6/jboss-forge/forge-distribution-2.20.1.Final/bin:/home/VictorPolo/jee6/wildfly/wildfly-9.0.2.Final/bin:/cygdrive/c/Program Files/PostgreSQL/9.4/bin:/home/VictorPolo/.vim/bundle/VimPyServer/bin:/cygdrive/c/Users/Victor Polo/AppData/Roaming/npm:/cygdrive/c/Users/Victor Polo/AppData/Local/Android/sdk/tools:/cygdrive/c/Users/Victor Polo/AppData/Local/Android/sdk/platform-tools:/usr/lib/lapack:/home/VictorPolo/privatebin:/home/VictorPolo/privatebin/sql:/home/VictorPolo/offlineimap/:/home/VictorPolo/privatebin:/home/VictorPolo/privatebin/sql:/home/VictorPolo/offlineimap/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
bindkey -v
bindkey "jj" vi-cmd-mode
alias ls=' ls --color=auto'
alias cd=' cd'

# Find in history with regexp
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# C-z will return to a suspended vim
foreground-vi() {
	  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# Persist the directory stack
DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
      print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
export PROMPT='${ret_status} $(git_prompt_info) %{$fg[cyan]%}%~%{$reset_color%} $ '
