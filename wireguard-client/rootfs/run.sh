#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

FILE1="/config/wg/privatekey"
FILE2="/config/wg/publickey"
if [ -f "$FILE1" ] && [ -f "$FILE2"]; then
    echo "Privatekey and Publickey already exist"
else
    umask 077
    /usr/bin/wg genkey | tee /config/privatekey | /usr/bin/wg pubkey > /config/publickey
    echo "Privatekey and Publickey generated"
fi

FILE3="/config/wg/wg0.conf"
if [ -f "$FILE3" ]; then
    echo "Config file already exist"
else
    echo "[Interface]" > /config/wg/wg0.conf
    echo "PrivateKey = $(cat /config/privatekey)" >> /config/wg/wg0.conf
    echo "Address =" >> /config/wg/wg0.conf

    echo "[Peer]" >> /config/wg/wg0.conf
    echo "PublicKey" >> /config/wg/wg0.conf
    echo "AllowedIPs =" >> /config/wg/wg0.conf
    echo "Endpoint =" >> /config/wg/wg0.conf

    echo "Created incomplete samlple config file"
fi

cp -r /config/wg /etc/wireguard/

/usr/bin/supervisord -c /etc/supervisord.conf