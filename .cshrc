#
# Default user .cshrc file
# 
# Usage:  Copy this file to a user's home directory and edit it to
# customize it to taste.  It is run by csh each time it starts up.
#
# Modified 981209 jsin
# Modified 981001 djo based on originals from dhynson 
#
#
#echo 'executing .cshrc'
#
#source /tools/bin/common.cshrc
setenv EDITOR vi
setenv PAGER less
setenv LPDEST lp
#setenv TERM xterm
#
#######################################
#PERSONAL CUSTOMIZATION BELOW THIS LINE
#######################################
#set path=( $HOME/bin /usr/local/bin /usr/local/etc /usr/ucb \
#	/usr/etc /usr/bin /usr/sbin /bin /etc /usr/bin/X11 \
#/usr/local/X11/bin /home/rpereira/sbtools/x86-linux-rh7.2/sb1-elf-2.7.16/bin )
#
#
#
#
alias ct /usr/atria/bin/cleartool
alias plat /opt/brcm/scripts/plat
alias gterm gnome-terminal
#
#umask 077
#
#to build 7145 firmwares
setenv LM_LICENSE_FILE `/tools/bin/get_lic_servers synopsys-arc`
set ARCVER=8.7.0
#
#additional path to look up
setenv PATH /home/quanc/vim74/bin\:$PATH\:/fe_lab/users/accurev/triggers/linux\:/home/quanc/bin\:/tools/bin\:/bin:/usr/bin:/tools/ecos/3.2.1_opt/Linux/opt/ecos/gnutools/mipsisa32-elf/bin:/home/quanc/ctags/bin

# Add these lines to your ~/.cshrc.mine file on the linux grace machines...
# don't worry too much about what they mean.

# Colors!
set     red="%{\033[1;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}" # This is needed at the end... :(

# Setting the actual prompt.  I made two separate versions for you to try, pick
# whichever one you like better, and change the colors as you want.  Just don't
# mess with the ${end} guy in either line...  Comment out or delete the prompt you don't use.

#set prompt="${green}%n${blue}@%m ${white}%~ ${green}%%${end} "
set prompt="[${green}%n${blue}@%m ${white}%c ]${end} "

# Clean up after ourselves...
unset red green yellow blue magenta cyan yellow white end
