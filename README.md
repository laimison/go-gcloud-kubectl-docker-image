# Container image that has go, gcloud and kubectl

This is useful for k8s client apps on Google cloud. The image contains all tools to work with Kubernetes and GCP cloud components. Work with commands and also code in Golang.

## Build and run

```
docker build -t go-gcloud-kubectl:latest .

docker run --rm -it go-gcloud-kubectl:latest bash
```
