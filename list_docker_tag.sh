source ~/.credentials/dockerhub.sh
wget -q https://$DOCKERHUB_USER:$DOCKERHUB_PASSWORD@registry.hub.docker.com/v1/repositories/$1/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'

