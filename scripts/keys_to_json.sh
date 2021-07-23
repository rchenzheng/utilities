#!/usr/bin/env bash

set -e

key="$1"

if [ $# -lt 1 ];then
	echo 1>&2 "usage: $0 <key-file>"
	exit 2
fi

awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' "$key"
