# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
# automatically correct mistyped directory names on cd
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# The bash prompt always go to the first column.
# http://jonisalonen.com/2012/your-bash-prompt-needs-this/
PS1="\[\033[G\]$PS1"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls -Gph' # with colors, slash after each directory and human-readable sizes by default
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# show last command as title
# prerequisite: sudo apt-get install xtitle
# lastcmd() { xtitle $(history 1 | cut -c8-); }
# PROMPT_COMMAND=lastcmd

# save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:./lib

#export NODE_PATH="/usr/local/lib/node"
# This loads NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh" 

. ~/.scripts/git_prompt
. ~/.aliases/git
#[ -f ~/.aws ] && . ~/.aws
#[ -f $HOME/dot-files/z/z.sh ] && . $HOME/dot-files/z/z.sh

# git completion
if [[ `uname` == 'Darwin' ]]; then
  [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
      # if not found in /usr/local/etc, try the brew --prefix location
      [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
          . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  }
fi

if [[ `uname` == 'Darwin' ]]; then
  export ANDROID_HOME=~/Library/Android/sdk
else 
  export ANDROID_HOME=~/android-sdk-linux
fi

# add ~/bin in PATH env
export PATH=$PATH:~/bin:/opt/homebrew/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

if [[ `uname` == 'Darwin' ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
else
  export JAVA_HOME="/usr/lib/jvm/default-java"
fi
export PATH="$PATH:$JAVA_HOME/bin"

export MOSH_TITLE_NOPREFIX=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# open tabs at startup automation: http://stackoverflow.com/a/3902909/418831
eval "$BASH_POST_RC"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
