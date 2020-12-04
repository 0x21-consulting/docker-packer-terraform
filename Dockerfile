FROM golang:latest

RUN apt update && apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get -y install packer terraform

CMD /bin/bash
