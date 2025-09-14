#!/bin/bash

TARGET="api"

for port in {24500..65535}; do
    timeout 0.1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port: OPEN"
        break
    else
        echo "Port $port: CLOSED"
    fi
done
