#!/bin/bash

TARGET="secretshell-daeth5mu.alfactf.ru"

for port in {1..65535}; do
    timeout 0.1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port: OPEN"
    fi
    # Прогресс-бар
    if [ $((port % 1000)) -eq 0 ]; then
        echo -ne "Scanned: $port/65535 ports\r" >&2
    fi
done
echo -e "\nScan completed!" >&2
