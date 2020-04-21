#!/bin/bash
# Encode and append keys
keys=($(ls *.pem))

for k in ${keys[@]}; do

  encoded=$(cat ${k} | base64) 
  echo $k: ${encoded} >> db-ssl-certs.yml 
done
