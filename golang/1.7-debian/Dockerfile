FROM golang:1.7

MAINTAINER Helder Guilherme <helderfarias@gmail.com>

RUN apt-get update && apt-get install make

RUN go get -u github.com/kardianos/govendor \
  && cp $GOPATH/bin/govendor /usr/local/bin \
  && chmod +x /usr/local/bin/govendor