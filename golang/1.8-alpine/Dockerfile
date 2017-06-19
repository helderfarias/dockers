FROM golang:1.8-alpine

MAINTAINER Helder Guilherme <helderfarias@gmail.com>

RUN apk add --no-cache git make

RUN go get -u github.com/kardianos/govendor \
  && cp $GOPATH/bin/govendor /usr/local/bin \
  && chmod +x /usr/local/bin/govendor

