FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y --no-install-recommends install software-properties-common dirmngr \
      apt-transport-https lsb-release ca-certificates curl gnupg2 && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get -y --no-install-recommends install packer terraform && \
    apt-get -y remove software-properties-common dirmngr apt-transport-https lsb-release gnupg2 curl && \
    apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

CMD /bin/bash
