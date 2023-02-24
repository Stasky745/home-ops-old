#!/bin/bash

kubectl get events -n flux-system --field-selector type=Warning
