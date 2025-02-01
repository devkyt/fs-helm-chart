## What to do with it
In case of any changes to Helm Chart ensure it is still valid and ready to go:
```shell
helm lint .
helm template .
helm install --dry-run fs-app .
```

Deploy app to cluster:
```shell
helm upgrade --install fs-app . --namespace fs --create-namespace
```

Upgrade app:
```
helm upgrade fs-app . --namespace fs
```

Delete app from cluster:
```
helm uninstall fs-app --namespace fs
```

## How to Test
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

