# USAGE: bash tunnel_to_private.sh <user@Public DNS/IP address of jumpbox> <user@Private DNS/IP address of private instance> <Private endpoint:port> <local port>
# Then you can open the page on 127.0.0.1:<local port>

ssh -L 127.0.0.1:$4:$3  -o "ProxyCommand ssh -W %h:%p $1" $2 -fN
