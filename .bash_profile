# Force OSX to process .bashrc. Terminal opens login prompt and does not.
[[ -s ~/.bashrc ]] && source ~/.bashrc

#edit with emacs instead of vi
export EDITOR=/usr/bin/emacs

# enable terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# aliases
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history

# the "kp" alias ("que pasa")
alias kp="ps ax"

alias ss="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background &"

# java 
export JAVA_HOME=$(/usr/libexec/java_home)

# JBoss - Current is a softlink to current version being used
export JBOSS_HOME=~/jboss/Current

# ant
#alias ant=/opt/local/bin/ant
#export HOSTNAME=Frosty
#export ANT_HOST_NAME=Frosty
#export ANT_HOME=/opt/local/share/java/apache-ant

# tomcat
#export TOMCAT_HOME=/Users/brandond/tomcat-6.0.16


# jruby
#export JRUBY_HOME=/Users/brandond/Apps/jruby-0.9.2
#PATH=${PATH}:/Users/brandond/Apps/jruby-0.9.2/bin

# maven 2.0.8 config
export M2_HOME=/usr/local/apache-maven/current
export M2=${M2_HOME}/bin
PATH=${M2}:${PATH}:

# general path munging
PATH=${PATH}:~/bin
PATH=${PATH}:/usr/local/bin

# postgres
export PATH=/Library/PostgreSQL/9.2/bin:${PATH}
#export PGDATA=/usr/local/pgsql/data

#-----#
# X11 #
#-----#
export DISPLAY=:0.0
PATH=${PATH}:/usr/X11R6/bin
