#!/bin/sh

set -o pipefail

# comment-on-pr parameter from the action
if [ "$2" == "true" ]; then
    echo "Validate one file and comment on PR"
    pcvalidate "$1" | reviewdog -efm="%f:%l:%c: %t%*[^:]: %m" -reporter=github-pr-review -tee
elif [ ! -z "$1" ]; then
    echo "Validate one file"
    pcvalidate "$1"
else
    echo "Validate one each publiccode.yml in the working directory or any subdirectories"
    find . -type d \( -name node_modules -or -name dist \) -prune -o \( -name 'publiccode.yaml' -or -name 'publiccode.yml' \) -print0 | xargs -0 pcvalidate $1
fi
