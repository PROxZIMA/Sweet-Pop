#! /usr/bin/env bash

VERSION=$(curl -s "https://github.com/PROxZIMA/Sweet-Pop/releases/latest/download" 2>&1 | sed "s/^.*download\/\([^\"]*\).*/\1/")
FILENAME=Sweet-Pop-$VERSION.tar.gz
FOLDERPATH=$PWD/Sweet-Pop

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi

mkdir $FOLDERPATH

cd $FOLDERPATH

curl -LJo $FILENAME https://github.com/PROxZIMA/Sweet-Pop/archive/refs/heads/master.zip

tar -xzf $FILENAME --strip-components=1
rm $FILENAME

chmod +x programs/install.sh

./programs/install.sh

if [ -d "$FOLDERPATH" ]; then rm -Rf $FOLDERPATH; fi