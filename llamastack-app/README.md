# LLama stack applications

With the base distribtion running in Kubernetes, the most straightforward is to run a local Python app, that connects to the LLama Stack distribution.

## Kube Port-Forward

```
kubectl port-forward --namespace default llamastackdistribution-sample-<xyz-xyz> 8321:8321
```

Now you can access the Llama Stack distribution via localhost, for testing pruposes.

## Running a sample

Executing the script from the official quickstart:

```
uv run --with llama-stack-client,fire,requests demo_script.py
```

If things are correct, you should see something like:

```
INFO:httpx:HTTP Request: GET http://localhost:8321/v1/models "HTTP/1.1 200 OK"
INFO:httpx:HTTP Request: POST http://localhost:8321/v1/vector-dbs "HTTP/1.1 200 OK"
rag_tool> Ingesting document: https://www.paulgraham.com/greatwork.html
...
...
```

