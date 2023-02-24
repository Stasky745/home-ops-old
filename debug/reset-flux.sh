#!/bin/bash

if [ $# -eq 0 ]; then
    read -p "Type the helmrelease: " helm
    read -p "Type the namespace: " namespace
elif [ $# -eq 1 ]; then
    helm=$1
    read -p "Type the namespace: " namespace
elif [ $# -eq 2 ]; then
    helm=$1
    namespace=$2
else
    echo "Too many parameters. Only required 2: [helmrelease] [namespace]"
    exit
fi

flux suspend hr $helm -n $namespace
flux resume hr $helm -n $namespace

# kubectl patch helmrelease $helm --type='json' -p='[{"op": "replace", "path": "/spec/suspend", "value": true}]'
# kubectl patch helmrelease $helm --type='json' -p='[{"op": "replace", "path": "/spec/suspend", "value": false}]'
