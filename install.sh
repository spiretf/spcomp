#!/bin/sh

sm_url=$(wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-linux.tar.gz")

wget -q $sm_url -O sourcemod.tar.gz
wget -q https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sourcemod-curl-extension/curl_1.3.0.0_linux.zip -O curl.zip
wget -q "https://forums.alliedmods.net/attachment.php?attachmentid=157128&d=1472513017" -O curl-inc.zip

tar -xzf sourcemod.tar.gz
rm sourcemod.tar.gz

mv addons/sourcemod/scripting ./

unzip curl.zip
rm curl.zip
unzip curl-inc.zip
mv include/* scripting/include

rm -r addons
rm -r include
rm -r cfg
rm -r extensions
