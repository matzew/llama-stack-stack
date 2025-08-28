#!/usr/bin/env bash

set -e

echo "Starting Kubernetes setup and Ollama deployment..."

$(dirname "$0")/00-run-k8s.sh
$(dirname "$0")/01-deploy-ollama.sh
$(dirname "$0")/02-deploy-llama-stack.sh

echo "All commands executed successfully."
