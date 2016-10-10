 docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e ES_JAVA_OPTS="-Xms1g -Xmx1g" elasticsearch:5 -E bootstrap.ignore_system_bootstrap_checks=true
