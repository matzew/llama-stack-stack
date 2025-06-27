#!/usr/bin/env bash

set -e

echo "Starting Kubernetes setup and Ollama deployment..."

$(dirname "$0")/00-run-k8s.sh
$(dirname "$0")/01-deploy-ollama.sh

echo "Deploying LlamaStack Kubernetes Operator..."
kubectl apply -f https://raw.githubusercontent.com/llamastack/llama-stack-k8s-operator/main/release/operator.yaml

echo "Applying LlamaStack Distribution..."
kubectl apply -f llamastack-distro/00-llamastackdistribution.yaml

echo "All commands executed successfully."
