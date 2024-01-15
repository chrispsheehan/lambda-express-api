#!/bin/bash

response=$(curl -s -w "%{http_code}" $API_URL)

status_code=$(echo "$response" | tail -n1)
response_body=$(echo "$response" | head -n-1)

if [ "$status_code" -eq 200 ]; then
    echo "API request succeeded. Response body: $response_body"
else
    echo "API request failed with status code $status_code. Response body: $response_body"
    exit 1
fi
