# Bootstraping AWS Instances with docker

# The idea

Imagine cloudformation, but with containers. The idea behind this bootstraping method is that bootstraping a machine is something that you can perfectly encapsulate in a container.

The workflow is very simple:

1.- Intance sends a request with its instance-id to a controller.

2.- Controller returns the container that bootstraps that instance.

3.- Instance runs that container.

4.- job done.


## Pre-requisistes

To bootstrap an instance with this technique the AMI used has to have docker installed. The image is based in busybox. The current size is ~5MB aprox

## New instances


```
    docker run -v /var/run/docker.sock:/var/run/docker.sock \
    -e CHECKPOINT_URL=https://checkpoint.local \
    ipedrazas/bootstrap

```

We mount the docker socket because this container will run the other containers. The original idea came when I did this:

```

$(docker run busybox echo "docker run busybox echo 'hello world'")

```
and got me thinking how far I could take this pattern.
