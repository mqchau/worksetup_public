# USAGE: bash tunnel_to_private.sh <user@Public DNS/IP address> <Private DNS/IP address> <port on private instance> <local port>
# Then you can open the page on 127.0.0.1:<local port>

ssh -L 127.0.0.1:$4:$2:$3 $1 -fN
