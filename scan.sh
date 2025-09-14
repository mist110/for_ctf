#!/bin/bash

TARGET="secretshell-daeth5mu.alfactf.ru"
PORTS="21,22,23,25,53,80,110,135,139,143,443,445,993,995,3389"

IFS=',' read -ra PORT_ARRAY <<< "$PORTS"

for port in "${PORT_ARRAY[@]}"; do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port: OPEN"
    else
        echo "Port $port: CLOSED"
    fi
done
