#!/bin/bash

if [ $# -ne 1 ];
    then echo "JSON variable name must be provided."
    exit
fi

if test ! -t 0; then
    JSON_DATA=$(</dev/stdin)
else
    echo "Must pipe input to $0"
    exit
fi

JSON_VARIABLE=$1

read -r -d '' JAVASCRIPT_SOURCE <<EOF
function run() {
	var parsedJson = JSON.parse(\`$JSON_DATA\`);
	return parsedJson.$JSON_VARIABLE;
}
EOF

RESULT=$( osascript -l 'JavaScript' <<< "${JAVASCRIPT_SOURCE" )

echo "${RESULT}"
