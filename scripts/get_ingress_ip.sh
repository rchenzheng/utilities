#!/bin/bash

set -euo pipefail

context=()

for i in ${context[@]}; do
	kubectx $i &> /dev/null
	echo $i
	kubectl get svc production-nginx-ingress-controller -n nginx-ingress -o jsonpath="{.status.loadBalancer.ingress[*].ip}"
	printf "\n"
done
