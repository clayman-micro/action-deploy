#!/bin/sh -l

export VAULT_TOKEN="$(curl --request POST --data '{"role_id": "'$VAULT_ROLE_ID'", "secret_id": "'$VAULT_SECRET_ID'"}' $VAULT_ADDR/v1/auth/approle/login | jq .auth.client_token | sed -e 's/^"//' -e 's/"$//')"

ansible-playbook $@

