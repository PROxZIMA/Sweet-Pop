#!/usr/bin/env bash

FILENAME=Sweet-Pop-master.zip
FOLDERPATH=$PWD/Sweet-Pop-master

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi

curl -LJo $FILENAME https://github.com/PROxZIMA/Sweet-Pop/archive/refs/heads/master.zip

unzip $FILENAME

rm $FILENAME

chmod +x "${FOLDERPATH}/programs/install.sh"

"${FOLDERPATH}/programs/install.sh" "$@"

# if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi
