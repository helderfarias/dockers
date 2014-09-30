# Based on CentOS
############################################################

# Set the base image to Ubuntu
FROM centos:centos7

# File Author / Maintainer
MAINTAINER Helde Farias

# Install tar
RUN yum -y install tar wget

# Download JDK7
RUN cd /opt && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz"

# Install JDK7
RUN cd /opt && tar xvzf jdk-7u65-linux-x64.tar.gz
RUN cd /opt/jdk1.7.0_65/ && alternatives --install /usr/bin/java java /opt/jdk1.7.0_65/bin/java 2 #&& alternatives --config java

# Configure Enviroment
RUN export JAVA_HOME=/opt/jdk1.7.0_65
RUN export JRE_HOME=/opt/jdk1.7.0_65/jre
RUN export PATH=$PATH:/opt/jdk1.7.0_65/bin:/opt/jdk1.7.0_65/jre/bin
