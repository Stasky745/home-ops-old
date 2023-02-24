#!/bin/bash

helm=$1

kubectl patch helmrelease $helm --type='json' -p='[{"op": "replace", "path": "/spec/suspend", "value": true}]'
kubectl patch helmrelease $helm --type='json' -p='[{"op": "replace", "path": "/spec/suspend", "value": false}]'
