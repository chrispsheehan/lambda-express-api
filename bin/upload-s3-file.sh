#!/bin/bash

if [ -z "$S3_BUCKET_NAME" ]
then
    echo "S3_BUCKET_NAME not defined!"
    exit 1
fi

if [ -z "$S3_FILE_PATH" ]
then
    echo "S3_FILE_PATH not defined!"
    exit 1
fi

echo uploading $S3_FILE_PATH to $S3_BUCKET_NAME s3 bucket

# Use the AWS CLI to upload the file to S3
aws s3 cp "$S3_FILE_PATH" "s3://$S3_BUCKET_NAME/$S3_FILE_PATH"

# Check if the upload was successful
if [ $? -eq 0 ]; then
    echo "File uploaded successfully to S3."
else
    echo "Error uploading file to S3."
    exit 1
fi
