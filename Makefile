
# Eclipse version
#
VERSION=4.5.1

all: clean image

Dockerfile: Dockerfile.m4
	m4 -DVERSION=${VERSION} -DBUILD=${BUILD} -DPROXY=${http_proxy} $< > $@
	chmod 440 $@

build.sh: build.m4
	m4 -DVERSION=${VERSION} $< > $@
	chmod 550 $@

image: build.sh Dockerfile
	/bin/sh build.sh

clean:
	rm -fv build.sh Dockerfile
