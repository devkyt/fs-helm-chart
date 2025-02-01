## How to
In case of any changes to Helm Chart ensure it is still valid and ready to go:
```shell
helm lint .
helm template .
helm install --dry-run file-storage-app .
```

Install chart to cluster:
```shell
helm upgrade --install fs-app . --namespace fs --create-namespace
```

Delete chart from cluster:
```
helm unistall fs-app --namespace fs
```

## Test
Map to the service port:
```shell
kubectl port-forward -n fs svc/fs-app-svc 8080:8081
```

Upload file:
```shell
curl -iX POST -F "file=@README.md" http://localhost:8080/upload
```

Download file:
```shell
# with curl
curl -iX GET  http://localhost:8080/uploads/README.md --output Uploaded.md

# or just open in browser
http://localhost:8080/uploads/README.md
```

