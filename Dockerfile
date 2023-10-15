# Container image that runs your code
FROM alpine:3.10 as builder

RUN apk add --update nodejs npm \
    && apk add docker \
    && wget -q https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq \
    && npm install -g @controlplane/cli \
    && cpln --version
