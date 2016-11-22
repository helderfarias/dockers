FROM node:6

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV PATH ${PATH}:/opt/tools

RUN apt-get update -qq
RUN apt-get install -y openjdk-8-jdk wget expect
RUN npm install -g yarn react-native-cli

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
RUN apt-get clean
RUN chown -R 1000:1000 $ANDROID_HOME

VOLUME ["/opt/android-sdk-linux"]