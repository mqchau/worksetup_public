# USAGE: bash tunnel_to_private.sh <Public DNS/IP address> <Private DNS/IP address> <port on private instance> <local port>
# Then you can open the page on 127.0.0.1:<local port>

# For AWS Elasticsearch, port on private instance is 80, uses 127.0.0.1:<local port>/_plugin/kibana for Kibana

ssh -L 127.0.0.1:$4:$2:$3 centos@$1
