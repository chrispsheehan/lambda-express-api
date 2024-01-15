#!/bin/bash

response_headers=$(curl -I -s $API_URL)
status_code=$(echo "$response_headers" | grep -oP '(?<=HTTP/1.1 )\d{3}')

echo "HTTP status code: $status_code"

if [ "$status_code" -eq 200 ]; then
    echo "API request succeeded."
else
    echo "API request failed with status code $status_code."
    exit 1
fi
