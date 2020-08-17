openssl genrsa -aes256 -out private_key.pem 2048
chmod 600 private_key.pem
openssl rsa -in private_key.pem -pubout -out public_key.pub
ssh-keygen -y -f private_key.pem > public_key.ssh_pub
