# Python CloudEvents Inference Function

Requires the `llama-stack-stack` setup to be running, and the the `LlamaStackDistribution` is in the `default` namespace, and has the URL `http://llamastackdistribution-sample-service.default.svc.cluster.local:8321`.

We inject a `LSD_HOST` environment variable and default to `localhost`, for `func run`.

## Local testing

```
func run
```

After the local instance is running you can execute an inference:
```
func invoke -f=cloudevent --data='{"query":"Tell me a dad joke!"}' 
```


## Kubernetes

```
func deploy --builder=host --build
```
_NOTE:_ Only `host` _builder_ is working at the moment

After the local instance is running you can execute an inference:

```
kubectl run curls  --image=docker.io/curlimages/curl --rm=true --restart=Never -ti \
  -- -X POST -v \
  -H "content-type: application/json; charse=utf-8" \
  -H "ce-specversion: 1.0" \
  -H "ce-source: m/y/curl/command" \
  -H "ce-datacontent: application/json" \
  -H "ce-type: test.event" \
  -H "ce-id: $(uuid)" \
  -d '{"query":"Tell me a dad joke!"}' \
  http://inference-func.default.svc.cluster.local
```
