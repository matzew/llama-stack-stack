#!/usr/bin/env bash

set -e

echo "Deploying LlamaStack Kubernetes Operator..."
kubectl apply -f https://raw.githubusercontent.com/llamastack/llama-stack-k8s-operator/main/release/operator.yaml

echo "Applying LlamaStack Distribution..."
kubectl apply -f config/llamastack-distro/00-llamastackdistribution.yaml
