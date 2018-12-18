# Dockerfile for gcp-devops-challenge

# Use the official terraform docker container base image
FROM alpine:latest

# Optionally set the maintainer
MAINTAINER Mohan L <thefossgeek@gmail.com>

# Install terraform
ENV TERRAFORM_VERSION=0.11.11
ENV TERRAFORM_SHA256SUM=94504f4a67bad612b5c8e3a4b7ce6ca2772b3c1559630dfd71e9c519e3d6149c

RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip


# Generate ssh keys and this is used to login to GCP VM.
RUN mkdir -p /opt && mkdir -p /opt/terraform

ADD keygen.sh /opt/keygen.sh

RUN chmod 755 /opt/keygen.sh && /bin/sh /opt/keygen.sh

# Copy terraform code to docker image
COPY terraform /opt/terraform

# Copy GGCP credentials file to docker image
ADD credentials.json /opt/terraform/credentials.json

RUN cd /opt/terraform && terraform init

#ENTRYPOINT ["/bin/terraform"]
