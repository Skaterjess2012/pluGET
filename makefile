# * everything needed to build/config/run the container
all: build config launch

build:
	docker build -t pluget:latest .

config:
	docker run -it --rm --name pluget \
		-v `pwd`:/data/pluGET \
		pluget nvim ./src/config.ini

launch:
	docker run -it --rm --name pluget \
		-v `pwd`:/data/pluGET \
		pluget sh ./launcher.sh

# * utilities I thought would be a nice to have
fresh:
	docker build --pull --no-cache -t pluget:latest .

stop:
	docker stop -t 0 pluget