# NOTE: on the remote machine, you must edit sshd_config to make this work
#   sudo vi /etc/ssh/sshd_config
#   Add "AcceptEnv AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN" near other AcceptEnv
#
# To re-use ssh agent on remote machine, so you can perform git fetch/push commands,
# add "ForwardAgent yes" to your ssh config ~/.ssh/config

# USAGE: bash ssh_with_credentials.sh <user@host>

RAW_TEMP_CREDENTIALS=$(aws sts get-session-token)
export AWS_ACCESS_KEY_ID=$(echo $RAW_TEMP_CREDENTIALS | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $RAW_TEMP_CREDENTIALS | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $RAW_TEMP_CREDENTIALS | jq -r .Credentials.SessionToken)

ssh  -o "SendEnv AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN" $1
