#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

FILE1="/config/privatekey"
FILE2="/config/publickey"
if [ -f "$FILE1" ] && [ -f "$FILE2"]; then
    echo "Privatekey and Publickey already exist"
else
    umask 077
    /usr/bin/wg genkey | tee /config/privatekey | /usr/bin/wg pubkey > /config/publickey
    echo "Privatekey and Publickey generated"
fi

FILE3="/config/wg0.conf"
if [ -f "$FILE3" ]; then
    echo "Config file already exist"
else
    echo "[Interface]" > $FILE3
    echo "PrivateKey = $(cat /config/privatekey)" >> $FILE3
    echo "Address =" >> $FILE3

    echo "[Peer]" >> $FILE3
    echo "PublicKey" >> $FILE3
    echo "AllowedIPs =" >> $FILE3
    echo "Endpoint =" >> $FILE3

    echo "Created incomplete samlple config file"
fi

cp -r /config /etc/wireguard/

/usr/bin/supervisord -c /etc/supervisord.conf