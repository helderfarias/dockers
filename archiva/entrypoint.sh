#!/bin/bash

sed -i "s|name=\"contextPath\">/<|name=\"contextPath\">$ARCHIVA_CONTEXT_PATH<|g" \
  /opt/archiva/apache-archiva-$VERSION/contexts/archiva.xml

if [ ! -d /var/archiva/logs ]; then
  mkdir -p /var/archiva/logs
fi

if [ ! -d /var/archiva/data ]; then
  mkdir -p /var/archiva/data
fi

if [ ! -d /var/archiva/temp ]; then
  mkdir -p /var/archiva/temp
fi

if [ ! -d /var/archiva/conf ]; then
  cp -r /opt/archiva/apache-archiva-$VERSION/conf /var/archiva
fi

/opt/archiva/apache-archiva-$VERSION/bin/archiva console
