#
# Handy command aliases
#

# clean: clean up commpn temporary backup files
#   ------------------------------------------------------------
alias clean='echo -n "Really clean this directory?";
	read yorn;
	if test "$yorn" = "y"; then
	   rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
	   echo "Cleaned.";
	else
	   echo "Not cleaned.";
	fi'

# j: show all open jobs
#   ------------------------------------------------------------
alias j="jobs -l"

# Preferred 'cp' implementation
#   ------------------------------------------------------------
alias cp='cp -iv'

# h: show bash history
#   ------------------------------------------------------------
alias h=history

#   ------------------------------------------------------------
alias kp="ps ax"

# Preferred 'mv' implementation
#   ------------------------------------------------------------
alias mv='mv -iv'

# Preferred 'mkdir' implementation
#   ------------------------------------------------------------
alias mkdir='mkdir -pv'

# l: show everything
#   ------------------------------------------------------------
alias l="ls -al --color"

# Preferred 'ls' implementation
#   ------------------------------------------------------------
alias ll='ls -FGlAhp --color'

# lp: include / on directories
#   ------------------------------------------------------------
alias lp="ls -p"

# less: Preferred 'less' implementation
#   ------------------------------------------------------------
alias less='less -FSRXc'

# cd..: Go back 1 directory level (for fast typers)
#   ------------------------------------------------------------
alias cd..='cd ../'

# ..: Go back 1 directory level
#   ------------------------------------------------------------
alias ..='cd ../'

# ...: Go back 2 directory levels
#   ------------------------------------------------------------
alias ...='cd ../../'

# .3: Go back 3 directory levels
#   ------------------------------------------------------------
alias .3='cd ../../../'

# .4: Go back 4 directory levels
#   ------------------------------------------------------------
alias .4='cd ../../../../'

# .5: Go back 5 directory levels
#   ------------------------------------------------------------
alias .5='cd ../../../../../'

# .6: Go back 6 directory levels
#   ------------------------------------------------------------
alias .6='cd ../../../../../../'

# f: Opens current directory in MacOS Finder
#   ------------------------------------------------------------
alias f='open -a Finder ./'

# ~: Go Home
#   ------------------------------------------------------------
alias ~="cd ~"

# c: Clear terminal display
#   ------------------------------------------------------------
alias c='clear'

# which: Find executables
#   ------------------------------------------------------------
alias which='type -all'

# path: Echo all executable Paths
#   ------------------------------------------------------------
alias path='echo -e ${PATH//:/\\n}'

# Show_options: display bash options settings
#   ------------------------------------------------------------
alias show_options='shopt'

# fix_stty: Restore terminal settings when screwed up
#   ------------------------------------------------------------
alias fix_stty='stty sane'

# cic: Make tab-completion case-insensitive
#   ------------------------------------------------------------
alias cic='set completion-ignore-case On'

# DT: Pipe content to file on Desktop
#   ------------------------------------------------------------
alias DT='tee ~/Desktop/terminalOut.txt'

# ndv: Nuke docker volumes, removes all docker volumes.
#   ------------------------------------------------------------
alias ndv='docker volume rm $(docker volume ls -q)'

# lr: Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# numFiles: Count of non-hidden files in current dir
#   ------------------------------------------------------------
alias numFiles='echo $(ls -1 | wc -l)'

# make1mb: Creates a file of 1mb size (all zeros)
#   ------------------------------------------------------------
alias make1mb='mkfile 1m ./1MB.dat'

# make5mb: Creates a file of 5mb size (all zeros)
#   ------------------------------------------------------------
alias make5mb='mkfile 5m ./5MB.dat'

# make10mb: Creates a file of 10mb size (all zeros)
#   ------------------------------------------------------------
alias make10mb='mkfile 10m ./10MB.dat'

# qfind: Quickly search for file
#   ------------------------------------------------------------
alias qfind="find . -name "

# memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# topForever: Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'

# ttop: Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

# myip: Public facing IP Address
#   ------------------------------------------------------------
alias myip='curl ifconfig.io'

# netCons: Show all open TCP/IP sockets
#   ------------------------------------------------------------
alias netCons='lsof -i'

# lsock: Display open sockets
#   ------------------------------------------------------------
alias lsock='sudo /usr/sbin/lsof -i -P'

# lsockU: Display only open UDP sockets
#   ------------------------------------------------------------
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'

# lsockT: Display only open TCP sockets
#   ------------------------------------------------------------
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'

# ipInfo0: Get info on connections for en0
#   ------------------------------------------------------------
alias ipInfo0='ipconfig getpacket en0'

# ipInfo1: Get info on connections for en1
#   ------------------------------------------------------------
alias ipInfo1='ipconfig getpacket en1'

 # openPorts: All listening connections
#   ------------------------------------------------------------
alias openPorts='sudo lsof -i | grep LISTEN'

# mountReadWrite: For use when booted into single-user
#   ------------------------------------------------------------
alias mountReadWrite='/sbin/mount -uw /'

# cleanupDS: Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#
# Useful functions
#

# add-alias: Adds an alias to the current shell and to the ~/.bash_aliases file.
#   -------------------------------------------------------------------
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# repeat: repeat a command a given number of times
#     Example: repeat 10 echo foo
#   -------------------------------------------------------------------
repeat ()
{ 
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
#   -------------------------------------------------------------------
_seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

# psgrep: find the pid of a process
#     Example: psgrep chrome
#   -------------------------------------------------------------------
psgrep()
{
	ps -aux | grep $1 | grep -v grep
}

# pskill: find the pid of a process and kill it
#     Example: pskill chrome
#   -------------------------------------------------------------------
pskill()
{
	local pid

	pid=$(ps -ax | grep $1 | grep -v grep | awk '{ print $1 }')
	echo -n "killing $1 (process $pid)..."
	kill -9 $pid
	echo "slaughtered."
}

#bold: turn on bold output
#   -------------------------------------------------------------------
bold()
{
	tput smso
}

# unbold: turn off bold output
#   -------------------------------------------------------------------
unbold()
{
	tput rmso
}

# watch: follow output to a file
#   -------------------------------------------------------------------
watch()
{
        if [ $# -ne 1 ] ; then
                tail -f nohup.out
        else
                tail -f $1
        fi
}

# ii: display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    echo
}

# my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# findPid: find out the pid of a specified process
#   ------------------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   ------------------------------------------------------------
findPid () { lsof -t -c "$@" ; }

# ff: Find file under the current directory
#   ------------------------------------------------------------
ff () { /usr/bin/find . -name "$@" ; }

# ffs: Find file whose name starts with a given string
#   ------------------------------------------------------------
ffs () { /usr/bin/find . -name "$@"'*' ; }

# ffe: Find file whose name ends with a given string
#   ------------------------------------------------------------
ffe () { /usr/bin/find . -name '*'"$@" ; }

# extract: Extract most know archives with one command
#   ------------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# zipf: To create a ZIP archive of a folder
#   ------------------------------------------------------------
zipf () { zip -r "$1".zip "$1" ; }

# targ: Create a .tar.gz archive of a folder
#   ------------------------------------------------------------
targ () { tar -czvf "${1}".tar.gz "${1}" ; } 

# mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.
#             Example: mans mplayer codec
#   ------------------------------------------------------------
mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

# showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

# mcd:          Makes new Dir and jumps inside
#   ------------------------------------------------------------
mcd () { mkdir -p "$1" && cd "$1"; }
