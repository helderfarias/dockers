FROM ubuntu:14.04

MAINTAINER Helder Farias

RUN apt-get update
RUN apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir	/var/www
ADD default   	/etc/nginx/sites-available/default

VOLUME  ["/var/www"]

EXPOSE 80

CMD "/usr/sbin/nginx"
