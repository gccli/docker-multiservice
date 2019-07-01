#!/bin/bash -e

if [ "$1" = "code-server" ]; then
    mkdir -p /home/code
fi

exec "$@"
