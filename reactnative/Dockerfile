FROM node:6

# ARG http_proxy
# RUN echo "Acquire::http::proxy \"$http_proxy\";\nAcquire::https::proxy \"$http_proxy\";\nAcquire::ftp::proxy \"$http_proxy\";" | tee -a /etc/apt/apt.conf
# ENV http_proxy $http_proxy 
# ENV https_proxy $http_proxy 

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV PATH ${PATH}:/opt/tools

RUN apt-get update && apt-get install -y curl wget

RUN cd /opt && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz"
RUN cd /opt && tar xvzf jdk-7u65-linux-x64.tar.gz
RUN cd /opt/jdk1.7.0_65 && update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_65/bin/java 2 && update-alternatives --config java
RUN cd /opt/jdk1.7.0_65 && update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_65/bin/javac 2 && update-alternatives --config javac
RUN cd /opt && rm jdk-7u65-linux-x64.tar.gz

RUN cd /opt && wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O android-sdk.tgz
RUN cd /opt && tar -xvzf android-sdk.tgz
RUN cd /opt && rm -f android-sdk.tgz
RUN echo y | android update sdk --no-ui --all --filter platform-tools | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-android-support | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter android-25 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter android-24 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter android-23 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-25.0.0 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-24.0.3 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-24.0.2 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-24.0.1 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.3 | grep 'package installed'
# RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.2 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.1 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-android-m2repository | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-google-m2repository | grep 'package installed'

COPY tools /opt/tools
COPY licenses/android-sdk-license ${ANDROID_HOME}
COPY licenses/android-sdk-preview-license ${ANDROID_HOME}
RUN /opt/tools/android-accept-licenses.sh android update sdk --no-ui --obsolete --force
RUN chown -R 1000:1000 $ANDROID_HOME

RUN npm install -g yarn react-native-cli

RUN apt-get clean
# RUN unset http_proxy https_proxy
# RUN rm /etc/apt/apt.conf

VOLUME ["/opt/android-sdk-linux"]