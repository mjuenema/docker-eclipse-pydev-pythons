# docker-eclipse-pydev-pythons
Docker image with Eclipse, PyDev and multiple Python versions. This may
be useful for developing applications/libraries and testing them
against the following versions of Python. 

* Python 3.5.0
* Python 3.4.3
* Python 3.3.6
* Python 3.2.6
* Python 2.7.10
* Python 2.6.9

This Docker images is based on https://github.com/mjuenema/docker-eclipse-pydev. 

There is similar Docker image but without Eclipse and PyDev, resulting in 
a much smaller size: https://github.com/mjuenema/docker-pythons

## Building the Docker image
The build process is wrapped through a `Makefile`.
```
# make

# docker images
REPOSITORY                          TAG        IMAGE ID         VIRTUAL SIZE
mjuenema/eclipse-pydev-pythons                 bbc874dc97e3     1.581 GB
```

## Using the Docker image
The intended purpose of this Docker image is to be the basis for a development and
test container of a Python project; a bit like a *virtualenv* environment comprising
a whole CentOS 6 system.

### Creating a container

The command will create a Docker container named "mypythonproject". The `-v` flag
makes the X11 session of the host available to the container. This is needed
for running Eclipse inside the container.
```
# docker create -i -t --name="mypythonproject" \
         -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
         bbc874dc97e3
8951df97c95f6a6d0d3057f42b2ce1d612174b370026e4b9f7ce9c1e1dd14f8a
```

### Starting the container
```
# docker start -i -a mypythonproject
bash-4.1$ eclipse &
bash-4.1$ 
```

Markus Juenemann, 25-Nov-2015
