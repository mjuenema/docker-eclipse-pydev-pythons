
all: Dockerfile
	docker build -t mjuenema/eclipse-pydev-pythons .

clean:
	# I always forget the syntax
	[ "`docker images -q -f dangling=true`" != "" ] && docker rmi `docker images -q -f dangling=true`
