FROM debian:jessie

RUN apt-get update && apt-get install -y -q curl

RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.6.0 > /usr/local/bin/docker && \
  chmod +x /usr/local/bin/docker

RUN curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

# The docker host to use via standard TCP-based communication
ENV DOCKER_HOST tcp://127.0.0.1:2376

# The certificate should be mounted on runtime to this path
ENV DOCKER_CERT_PATH /docker-cert

# Default that match boot2docker defaults
ENV DOCKER_TLS_VERIFY 1
