#!/bin/bash
set -e

if [ "$ELASTICSEARCH_URL" ]; then
    sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 '$ELASTICSEARCH_URL'!" /opt/kibana/config/kibana.yml
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
