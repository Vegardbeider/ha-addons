#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json
export TDM_MQTT_SERVER="$(bashio::config 'mqtt_host')"
export TDM_MQTT_PORT="$(bashio::config 'mqtt_port')"
export TDM_MQTT_USER="$(bashio::config 'mqtt_username')"
export TDM_MQTT_PASS="$(bashio::config 'mqtt_password')"

cp /config/tellstick.conf /etc/tellstick.conf

echo Supervisor Version $(supervisord --version)
echo Python Version $(python --version)
echo Alpine Version $(cat /etc/alpine-release)

/usr/local/bin/supervisord -c /etc/supervisord.conf