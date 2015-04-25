Docker clients within Docker
========================================

Enables running docker and docker-compose commands within docker containers which communicate with docker on the host.

Note: This is NOT docker-in-docker since it is not running a docker service within the container.

Use to containerize scripts that use docker and docker-compose commands.

Includes docker client 1.6.0 and docker-compose 1.2.0.

Boot2docker example usage:

    $(boot2docker shellinit)
    docker run -it -v $DOCKER_CERT_PATH:/docker-cert --env DOCKER_HOST=$DOCKER_HOST neam/docker-cli-in-docker docker ps

Should show itself running:

    CONTAINER ID        IMAGE                              COMMAND             CREATED                  STATUS                  PORTS               NAMES
    312ec1734b87        neam/docker-cli-in-docker:latest   "docker ps"         Less than a second ago   Up Less than a second                       cranky_pare

Docker compose example:

    docker run -it -v $(pwd):/src --workdir=/src -v $DOCKER_CERT_PATH:/docker-cert --env DOCKER_HOST=$DOCKER_HOST neam/docker-cli-in-docker docker-compose -f hello-world.docker-compose.yml up

This would start the hello-world container, which can be accessed on `http://<docker-host-ip>:1234/`:

    open "http://$(boot2docker ip):1234"

To build this image within a docker container:

    docker run -it -v $(pwd):/src --workdir=/src -v $DOCKER_CERT_PATH:/docker-cert --env DOCKER_CERT_PATH=/docker-cert --env DOCKER_HOST=$DOCKER_HOST --env DOCKER_TLS_VERIFY=1 neam/docker-cli-in-docker docker build -t neam/docker-cli-in-docker .
