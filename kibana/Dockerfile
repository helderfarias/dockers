FROM kibana:4.6.1

RUN apt-get update \
    && apt-get -y install libssl1.0.0 --no-install-recommends \
    && apt-get -y install libc6-dev libpcre3-dev libssl-dev \
    && apt-get -y install supervisor \
    && apt-get -y install curl make \
    && rm -rf /var/lib/apt/lists/*

ENV HAPROXY_MAJOR 1.5
ENV HAPROXY_VERSION 1.5.11
ENV HAPROXY_MD5 5500a79d0d2b238d4a1e9749bd0c2cb2
RUN set -x \
	&& apt-get update && apt-get install -y gcc $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	&& curl -SL "http://www.haproxy.org/download/${HAPROXY_MAJOR}/src/haproxy-${HAPROXY_VERSION}.tar.gz" -o haproxy.tar.gz \
	&& echo "${HAPROXY_MD5}  haproxy.tar.gz" | md5sum -c \
	&& mkdir -p /usr/src/haproxy \
	&& tar -xzf haproxy.tar.gz -C /usr/src/haproxy --strip-components=1 \
	&& rm haproxy.tar.gz \
	&& make -C /usr/src/haproxy \
		TARGET=linux2628 \
		USE_PCRE=1 PCREDIR= \
		USE_OPENSSL=1 \
		USE_ZLIB=1 \
		all \
		install-bin \
	&& mkdir -p /usr/local/etc/haproxy \
	&& cp -R /usr/src/haproxy/examples/errorfiles /usr/local/etc/haproxy/errors \
	&& rm -rf /usr/src/haproxy \
        && apt-get -y purge curl make gcc

RUN rm -rf /etc/kibana
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY entrypoint.sh /entrypoint.sh
COPY kibana.yml /opt/kibana/config/kibana.yml
RUN chmod +x /entrypoint.sh

VOLUME /etc/kibana

EXPOSE 8080

CMD ["/entrypoint.sh"]
