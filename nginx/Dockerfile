############################################################
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04

# File Author / Maintainer
MAINTAINER Helder Farias

RUN apt-get update
RUN apt-get install -y vim wget dialog net-tools nginx daemontools

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir	/var/www
RUN mkdir 	/etc/services

ADD default   	/etc/nginx/sites-available/default

RUN mkdir       /etc/service/nginx
ADD nginx.sh  	/etc/service/nginx/run
RUN chmod +x    /etc/service/nginx/run

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/bin/svscan", "/etc/services/"]
