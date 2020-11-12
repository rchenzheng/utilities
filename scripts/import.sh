#!/bin/bash
set -euo pipefail

# Imports or adopts resources not managed by helm 3

import()
{

kind="$1"
name="$2"
release_name="$3"
namespace="$4"
release_namespace="${5:-$namespace}"

kubectl annotate "$kind" "$name" meta.helm.sh/release-name="$release_name" -n "$release_namespace" --overwrite
kubectl annotate "$kind" "$name" meta.helm.sh/release-namespace="$release_namespace" -n "$namespace" --overwrite
kubectl label "$kind" "$name" app.kubernetes.io/managed-by=Helm -n "$namespace" --overwrite

}

usage()
{
  echo '***REQUIRES HELM 3.2+***'
  echo './import.sh {KIND} {NAME} {RELEASE_NAME} {NAMESPACE} {RELEASE_NAMESPACE}'
}

if [[ "$#" -lt 4 || "$#" -gt 5 ]]; then
  usage
elif [[ "$1" == "-h" || "$1" == "--help" ]]; then
  usage
else
  import "${@}"
fi


