# USAGE: bash jumpbox_ssh.sh <user@public DNS/IP of jumpbox> <user@private DNS/IP of target>

ssh -o "ProxyCommand ssh -W %h:%p $1" $2
