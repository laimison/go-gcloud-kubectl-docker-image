# Container image that has go, gcloud and kubectl

This is useful for k8s client apps on Google cloud. The image contains all tools to work with Kubernetes and GCP cloud components. Work with commands and also code in Golang.

## Using an image

https://hub.docker.com/repository/docker/laimison/go-gcloud-kubectl

## Testing access to Kubernetes

```
curl -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" https://kubernetes.default.svc/api/v1/namespaces/default/pods | jq .
```

## Testing access to Google Cloud

```
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/HERE_IS_YOUR_SERVICE_ACCOUNT_KEY.json
gcloud auth activate-service-account HERE_IS_SERVICE_ACCOUNT_NAME@HERE_IS_PROJECT_NAME.iam.gserviceaccount.com --key-file=$GOOGLE_APPLICATION_CREDENTIALS
gcloud config set disable_prompts true
gcloud config set project HERE_IS_PROJECT_NAME
gcloud compute instances list
```

## Development

### Build and run

```
docker build -t go-gcloud-kubectl:latest .

docker run --rm -it go-gcloud-kubectl:latest bash
```

### Publish image

```
docker login --username=laimison
docker images | head

tag=`docker images | grep -v REPOSITORY | grep ^'go-gcloud-kubectl ' | awk '{print $3}'`; echo $tag

docker tag $tag laimison/go-gcloud-kubectl:latest && docker push laimison/go-gcloud-kubectl:latest

docker tag $tag laimison/go-gcloud-kubectl:0.1 && docker push laimison/go-gcloud-kubectl:0.1

docker pull laimison/go-gcloud-kubectl:0.1
```
