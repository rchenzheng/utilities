#!/bin/bash

set -euo pipefail

context=()

for c in ${context[@]}; do

	kubectx "$c" &> /dev/null
	echo "$c"

	echo "Public IP"
	kubectl get svc istio-ingressgateway -n istio-system -o jsonpath="{.status.loadBalancer.ingress[*].ip}"
	echo 

	echo "ILB IP"
	kubectl get svc istio-ingressgateway-ilb -n istio-system -o jsonpath="{.status.loadBalancer.ingress[*].ip}"
	echo

done
