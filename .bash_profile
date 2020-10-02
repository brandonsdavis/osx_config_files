# Force OSX to process .bashrc. Terminal opens login prompt and does not.
[[ -s ~/.bashrc ]] && source ~/.bashrc

#   Change Prompt
#   ------------------------------------------------------------
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
#export PS1="\w @ \h (\u) \n| => "
#export PS2="| => "

#   Git Aware Prompts
#   ------------------------------------------------------------
[[ -s ~/.git-prompt.sh ]] && source ~/.git-prompt.sh

#   Set Paths
#   ------------------------------------------------------------
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:~/bin
PATH=${PATH}:~/.local/bin

#   Set Default Editor
#   ------------------------------------------------------------
export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#   Add color to terminal
#   ------------------------------------------------------------
export LSCOLORS=GxFxCxDxBxegedabagaced

#   Fix history behavior.
#   ------------------------------------------------------------
HISTCONTROL=ignoredups:erasedups  # No dups.
HISTSIZE=100000                   # Plenty of disk space these days, don't be stingy
HISTFILESIZE=200000               # Plenty of disk space these days, don't be stingy
shopt -s histappend               # Append to history, don't overwrite it.

#   Set up bash completions
#   ------------------------------------------------------------
if [ -f /etc/profile.d/bash_completion.sh ]; then
    . /etc/profile.d/bash_completion.sh
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
if [ -f '~/bin/google-cloud-sdk/completion.bash.inc' ]; then 
    . '~/bin/google-cloud-sdk/completion.bash.inc'
fi
if [ -f '~/bin/google-cloud-sdk/path.bash.inc' ]; then 
    . '~/bin/google-cloud-sdk/path.bash.inc'
fi
