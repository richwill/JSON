#!/bin/bash

# Pipe JSON input via stdin to pretty print

if test -t 0; then
    echo "Must pipe JSON input via stdin to $0"
    exit
fi

python3 -m json.tool
