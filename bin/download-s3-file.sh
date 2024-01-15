#!/bin/bash

if [ -z "$S3_BUCKET_NAME" ]
then
    echo "S3_BUCKET_NAME not defined!"
    exit 1
fi

if [ -z "$S3_FILE_NAME" ]
then
    echo "S3_FILE_PATH not defined!"
    exit 1
fi

echo downloading $S3_BUCKET_NAME/$S3_FILE_NAME s3 file

basename="$(basename -- $S3_FILE_NAME)"

# Download file from S3
aws s3 cp s3://$S3_BUCKET_NAME/$basename ./$S3_FILE_NAME

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "File downloaded successfully."
    exit 1
else
    echo "Failed to download file. Check your AWS credentials and the specified S3 bucket/object key."
fi
