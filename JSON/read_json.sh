#!/bin/bash

JSON_DATA=$(</dev/stdin)
JSON_VARIABLE=$1

read -r -d '' JAVASCRIPT_SOURCE <<EOF
function run() {
	var parsedJson = JSON.parse(\`$JSON_DATA\`);
	return parsedJson.$JSON_VARIABLE;
}
EOF

RESULT=$( osascript -l 'JavaScript' <<< "${JAVASCRIPT_SOURCE" )

echo "${RESULT}"
