# * everything needed to build/config/run the container
all: build config run

build:
	docker build -t pluget:latest .

config:
	docker run --rm --name pluget -d pluget
	docker exec -it pluget nvim ./src/config.ini
	docker stop -t 0 pluget

# * utilities I thought would be a nice to have
fresh:
	docker build --pull --no-cache -t pluget:latest .

stop:
	docker stop -t 0 pluget