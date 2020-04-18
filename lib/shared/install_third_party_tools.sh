#!/usr/bin/env bash

set -e

echo " ---> Installing cht.sh..."
curl -s -o "$LOCAL_BIN/cht.sh" https://cht.sh/:cht.sh
chmod +x "$LOCAL_BIN/cht.sh"
echo " ---> cht.sh installed!"
