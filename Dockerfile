FROM golang:1.20-rc-buster

WORKDIR /app

RUN mkdir -p /app

# kubectl
RUN apt update && curl -LOk https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin/kubectl

# gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt update -y && apt install google-cloud-cli -y

# gke-gcloud-auth-plugin
RUN apt install google-cloud-sdk-gke-gcloud-auth-plugin -y
