#!/bin/bash
sudo addgroup "$1"
touch "$2"
chown :"$1" "$2";  chmod 674 "$2"
