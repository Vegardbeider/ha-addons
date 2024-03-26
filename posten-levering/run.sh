#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json
export POSTALCODE="$(bashio::config 'postnummer')"
export MQTT_HOST="$(bashio::config 'mqtt_host')"
export MQTT_PORT="$(bashio::config 'mqtt_port')"
export MQTT_USER="$(bashio::config 'mqtt_username')"
export MQTT_PASS="$(bashio::config 'mqtt_password')"



. /venv/bin/activate
python /app/main.py $POSTALCODE $MQTT_HOST $MQTT_PORT $MQTT_USER $MQTT_PASS
crond -f