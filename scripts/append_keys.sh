#!/bin/bash
# Encode and append keys
keys=($(ls *.pem))

set -e

if [ $# -eq 0 ]; then
    echo "$0 filename"
    exit 1
fi

for k in ${keys[@]}; do

  encoded=$(cat ${k} | base64) 
  echo "  $k: ${encoded}" >> $1 
done
