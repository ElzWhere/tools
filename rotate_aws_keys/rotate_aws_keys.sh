#!/bin/bash
DIRNAME=$(dirname "$0")
HOMEDIR=$(dirname $DIRNAME)
PROFILES=($(fgrep profile ~/.aws/config | awk '{print $2}'))
for PROFILE in "${PROFILES[@]}"; do
    echo "${PROFILE/]/}"
    export AWS_REGION="us-west-2"
    ${DIRNAME}/aws-vault rotate --backend=pass --pass-prefix=aws/api -n "${PROFILE/]/}"
done
