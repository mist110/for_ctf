#!/bin/bash

TARGET="secretshell-daeth5mu.alfactf.ru"

scan_port() {
    port=$1
    timeout 0.1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port: OPEN"
    fi
}

export -f scan_port
export TARGET

seq 1 65535 | xargs -I {} -P 100 bash -c 'scan_port "$@"' _ {}
