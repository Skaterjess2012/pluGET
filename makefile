# * everything needed to build/config/run the container
all: build config run

build:
	docker build -t pluget:latest .

config:
	docker run \
		--rm -d --name pluget \
		--mount type=bind,source=`pwd`/,target=/data/pluGET  \
		pluget tail -f /dev/null
	docker exec -it pluget nvim ./src/config.ini
	docker stop -t 0 pluget

# * utilities I thought would be a nice to have
fresh:
	docker build --pull --no-cache -t pluget:latest .

stop:
	docker stop -t 0 pluget