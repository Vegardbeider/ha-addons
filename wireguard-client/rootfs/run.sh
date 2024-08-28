#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

cp -r /config/* /etc/wireguard/

# Check if wireguard interface is up
if /usr/bin/wg show wg0 > /dev/null 2>&1; then
    echo "Wireguard interface is up, bringing it down"
    /usr/bin/wg-quick down wg0
    exit 0
else
    echo "Wireguard interface is down"
fi

FILE1="/config/privatekey"
FILE2="/config/publickey"
FILE3="/config/wg0.conf"
if [ -f "$FILE1" ] && [ -f "$FILE2" ]; then
    echo "Privatekey and Publickey already exist"
else
    umask 077
    /usr/bin/wg genkey | tee $FILE1 | /usr/bin/wg pubkey > $FILE2
    echo "Privatekey and Publickey generated"
fi

if [ -f "$FILE3" ]; then
    echo "Config file already exist"
else
    echo "[Interface]" > $FILE3
    echo "PrivateKey = $(cat $FILE1)" >> $FILE3
    echo "Address = " >> $FILE3

    echo "[Peer]" >> $FILE3
    echo "PublicKey = " >> $FILE3
    echo "AllowedIPs = " >> $FILE3
    echo "Endpoint = " >> $FILE3

    echo "Created incomplete samlple config file"
fi

# /usr/bin/supervisord -c /etc/supervisord.conf
/usr/bin/wg-quick up /etc/wireguard/wg0.conf