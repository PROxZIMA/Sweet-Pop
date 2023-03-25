#!/usr/bin/env bash

cp ./programs/mozilla.cfg "${1}/"

[ ! -d "${1}/defaults/pref/" ] && mkdir -p "${1}/defaults/pref/"
cp ./programs/local-settings.js "${1}/defaults/pref/"
