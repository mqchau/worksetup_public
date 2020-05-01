# USAGE: bash list_docker_tags.sh <user_name:password> <repo> 
#   User name and password of hub.docker.com

wget -q https://$1@registry.hub.docker.com/v1/repositories/$2/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'

