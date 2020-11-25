#!/bin/bash
# exit on any error
set -euo pipefail

mapfile -t releases < <(helm list --short)

for release in "${releases[@]}"; do
	helm3 2to3 convert "$release" --tiller-out-cluster
done

# show releases across all namespaces
helm3 list -A

echo '### Ensure all releases are listed in HELM3 releases before cleanup ```helm3 2to3 cleanup --tiller-out-cluster```###'
