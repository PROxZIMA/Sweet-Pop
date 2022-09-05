#!/usr/bin/env bash

VERSION=$(curl -s "https://github.com/PROxZIMA/Sweet-Pop/releases/latest/download" 2>&1 | sed "s/^.*download\/\([^\"]*\).*/\1/")
FILENAME=Sweet-Pop-$VERSION.zip
FOLDERPATH=$PWD/Sweet-Pop-master

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi

curl -LJo $FILENAME https://github.com/PROxZIMA/Sweet-Pop/archive/refs/heads/master.zip

unzip $FILENAME

rm $FILENAME

chmod +x "${FOLDERPATH}/programs/install.sh"

"${FOLDERPATH}/programs/install.sh" -e

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi
