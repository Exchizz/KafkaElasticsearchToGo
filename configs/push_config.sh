#!/bin/bash

curl -H 'Content-type:application/json' -vX POST http://localhost:8083/connectors -d @config.json

echo "Reading configs from elastivcsearch plugin:"

sleep 5
curl -s 'http://localhost:8083/connectors/es_sink/config'
