FROM alpine:latest

RUN apk add --update gcc musl-dev python3-dev libffi-dev openssl-dev cargo rust make cmake neovim python3-dev py3-pip
WORKDIR /data/pluGET
COPY . .

RUN pip install -r requirements.txt
RUN chmod +x ./launcher.sh

# CMD ./launcher.sh
CMD tail -f /dev/null