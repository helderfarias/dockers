FROM alpine:3.6

MAINTAINER Helder Guilherme <helderfarias@gmail.com>

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apk add --no-cache go git make
RUN mkdir $GOPATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
RUN go get -u github.com/kardianos/govendor \
  && cp $GOPATH/bin/govendor /usr/local/bin \
  && chmod +x /usr/local/bin/govendor

WORKDIR $GOPATH
