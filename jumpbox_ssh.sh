# USAGE: bash jumpbox_ssh.sh <public DNS/IP of jumpbox> <private DNS/IP of target>

ssh -o "ProxyCommand ssh -W %h:%p centos@$1" centos@$2
