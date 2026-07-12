#!/bin/bash
sudo find "$1" -perm -4000 -exec ls -l {} \; 2>/dev/null
