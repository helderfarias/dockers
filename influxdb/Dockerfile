FROM centos:centos7

ENV VERSION 0.9.0_rc31-1

RUN curl https://repos.influxdata.com/rhel/7/amd64/stable/influxdb-0.9.6.1-1.x86_64.rpm > /tmp/influxdb.rpm && rpm -ivh /tmp/influxdb.rpm
RUN ln -s /opt/influxdb/influxd /usr/local/bin
RUN ln -s /opt/influxdb/influx /usr/local/bin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8083
EXPOSE 8086
EXPOSE 8084

VOLUME /data/influxdb

ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["influxd"]
