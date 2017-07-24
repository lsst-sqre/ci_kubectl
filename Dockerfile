FROM alpine
# Based on lachie83/k8s-kubectl
MAINTAINER Adam Thornton <athornton@lsst.org>

ENV KUBE_VERSION="v1.7.1"
ENV JUPYTERHUB_REPO="https://github.com/lsst-sqre/jupyterlabdemo.git"

RUN apk update && \
 apk add --update ca-certificates && \
 apk add --update -t deps curl python3 docker bash git openrc && \
 rc-update add docker boot && \
 curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
 chmod +x /usr/local/bin/kubectl && \
 mkdir -p /usr/share/git
WORKDIR /usr/share/git 
RUN apk del --purge deps
RUN rm /var/cache/apk/*

CMD ["tail","-f","/dev/null"]
