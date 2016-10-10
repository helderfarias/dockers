FROM alpine:3.4

MAINTAINER Helder Guilherme <helderfarias@gmail.com>

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apk add --no-cache go git curl

RUN curl -L https://github.com/Masterminds/glide/releases/download/0.10.2/glide-0.10.2-linux-amd64.tar.gz > glide.tar.gz \
    && tar xvzf glide.tar.gz \
    && cp linux-amd64/glide /usr/bin/glide \
    && rm -rf linux-amd64

RUN mkdir $GOPATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH
