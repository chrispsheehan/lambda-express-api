#!/bin/bash

if [ -z "$S3_BUCKET_NAME" ]
then
    echo "S3_BUCKET_NAME not defined!"
    exit 1
fi

echo creating s3 bucket $S3_BUCKET_NAME

# check required cli tools
aws --version
jq --version

#  output current caller ID
aws sts get-caller-identity

bucket_exists=$(aws s3api list-buckets --query "Buckets[].Name" | jq -r --arg bucket_name $S3_BUCKET_NAME '. | index($bucket_name) != null')

if [[ "$bucket_exists" == "true" ]]; then
    echo "s3 bucket '$S3_BUCKET_NAME' found."
else
    echo "s3 bucket '$S3_BUCKET_NAME' not found. Creating.."
    aws s3api create-bucket --bucket $S3_BUCKET_NAME --region $AWS_REGION --create-bucket-configuration LocationConstraint=$AWS_REGION
fi
