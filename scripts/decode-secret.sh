#!/usr/bin/env bash

set -e

if [ $# -lt 1 ];then
	echo 1>&2 "usage: $0 <my-kube-secret> <namespace>"
	exit 2
fi

secret="$1"
namespace="$2"

echo -e "\n### $secret ###\n"

if [ -z "$2" ]; then
	kubectl get secret "$secret" -o go-template='{{range $k,$v := .data}}{{$k}}={{$v|base64decode}}{{"\n"}}{{end}}'
else
	kubectl get secret "$secret" -o go-template='{{range $k,$v := .data}}{{$k}}={{$v|base64decode}}{{"\n"}}{{end}}' -n "$namespace"
fi
