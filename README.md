# Riding a stack of Llamas 🦙

Describes some experiments w/ the LLama Stack.

## Setup Kubernetes and Ollama Server

### Run your (local) K8S

```shell
./00-run-k8s.sh
```

### Run your ollama server

```shell
./01-deploy-ollama.sh
```

## The Llama Stack distribution

### Install the LlamaStack Operator

```
kubectl apply -f https://raw.githubusercontent.com/llamastack/llama-stack-k8s-operator/main/release/operator.yaml
```

### The `LlamaStackDistribution` 

```shell
cat <<-EOF | kubectl apply -f -
apiVersion: llamastack.io/v1alpha1
kind: LlamaStackDistribution
metadata:
  name: llamastackdistribution-sample
spec:
  replicas: 1
  server:
    distribution:
      name: ollama
    containerSpec:
      env:
      - name: INFERENCE_MODEL
        value: llama3.2:1b
      - name: OLLAMA_URL
        value: http://ollama-server-service.ollama-dist.svc.cluster.local:11434
      name: llama-stack
      resources: {}
    storage:
      mountPath: /home/lls/.lls
      size: 20Gi
EOF
```

After a couple of minutes, the `Container` should be created, and you see:

```
k get llamastackdistribution.llamastack.io
NAME                            VERSION   READY
llamastackdistribution-sample             true
```