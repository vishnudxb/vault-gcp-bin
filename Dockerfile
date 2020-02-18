FROM alpine:latest

MAINTAINER Vishnu Nair <me@vishnudxb.me>

ENV PATH="/tmp/google-cloud-sdk/bin:${PATH}"

RUN mkdir /src
WORKDIR /src

ENV DEBIAN_FRONTEND noninteractive

RUN apk add --update bash python curl

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/install_google_cloud_sdk.bash && \
    bash install_google_cloud_sdk.bash --disable-prompts --install-dir=/tmp  && \
    gcloud components update && \
    gcloud components --quiet install beta && \
    curl -O https://releases.hashicorp.com/vault/1.3.2/vault_1.3.2_linux_amd64.zip && \
    unzip vault_1.3.2_linux_amd64.zip && \
    mv vault /usr/local/bin

ENTRYPOINT ["/bin/bash"]
