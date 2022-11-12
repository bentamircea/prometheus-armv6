#!/bin/sh

# check if prometheus.yml file is present; copy default if missing
if [ ! -f "/prometheus/prometheus.yml" ]
  then
    echo "WARN: Properties file 'prometheus.yml' missing, restoring default file..."
    cp /prometheus/prometheus.yml.default /config/prometheus.yml
fi

exec /prometheus/prometheus \
  --config.file=/config/prometheus.yml \
  --storage.tsdb.path=/data
