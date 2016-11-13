FROM openjdk:7-jre

MAINTAINER Helder Farias <helderfarias@gmail.com>

ENV ARCHIVA_BASE /var/archiva
ENV ARCHIVA_CONTEXT_PATH /archiva
ENV VERSION 2.2.1

RUN mkdir -p /opt/archiva \
   && curl -sSLo /apache-archiva-$VERSION-bin.tar.gz http://archive.apache.org/dist/archiva/$VERSION/binaries/apache-archiva-$VERSION-bin.tar.gz \
   && tar --extract --ungzip --file apache-archiva-$VERSION-bin.tar.gz --directory / \
   && rm /apache-archiva-$VERSION-bin.tar.gz \ 
   && mv /apache-archiva-$VERSION /opt/archiva

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

WORKDIR /opt/archiva

VOLUME ["/var/archiva"]

ENTRYPOINT ["sh", "/entrypoint.sh"]
