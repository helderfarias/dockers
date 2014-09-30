############################################################
# Based on Ubuntu
############################################################

FROM ubuntu:14.04

MAINTAINER Helde Farias <helderfarias@gmail.com>

RUN apt-get update && apt-get install -y wget git curl zip
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jdk maven ant make nodejs npm

RUN wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian-stable binary/ >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y jenkins
RUN mkdir -p /var/jenkins_home && chown -R jenkins /var/jenkins_home
ADD init.groovy /tmp/WEB-INF/init.groovy
RUN cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/init.groovy
ADD ./jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Install yeoman
npm install -g yo

# VOLUME /var/jenkins_home
ENV JENKINS_HOME /var/jenkins_home

# define url prefix for running jenkins behind web proxy
ENV JENKINS_PREFIX /

# for main web interface:
EXPOSE 8080 

# will be used by attached slave agents:
EXPOSE 50000 

CMD ["/usr/local/bin/jenkins.sh"]
