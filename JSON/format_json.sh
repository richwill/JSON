#!/bin/bash

if test -t 0; then
    echo "Must pipe input to $0"
    exit
fi

python3 -m json.tool
