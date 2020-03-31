#!/bin/bash

set -e

createNamespace() {
  kubectl create namespace $1
}

main()
{
    case "$1" in
        createNamespace)
	        createNamespace $2
            ;;
        *)
            echo "usage: $0 createNamespace mynamespace"
            ;;
    esac
}

main "$@"
