#!/bin/bash

TARGET="secretshell-daeth5mu.alfactf.ru"

for port in {30000..65535}; do
    timeout 0.1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port: OPEN"
    fi
done
