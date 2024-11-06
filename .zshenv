#   Set Paths
#   ------------------------------------------------------------
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:~/bin
PATH=${PATH}:~/.local/bin

#   Golang 
#   ------------------------------------------------------------
export GOPATH=${HOME}/go

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
