import requests
import base64
import time
import paho.mqtt.publish as publish
import sys
import json

def get_delivery_days(postalcode):
    url = "https://www.posten.no/levering-av-post/_/service/no.posten.website/delivery-days?postalCode="+postalcode

    token = (base64.b64encode(bytes(base64.b64decode("f3ccd044MTY4MjYyODE2MQ==")[0:6]) + bytes(str(int(time.time())), "utf8")).decode().replace("=", ""))
    res = requests.get(url, headers={"content-type": "application/json; charset=UTF-8", "x-requested-with": "XMLHttpRequest", "kp-api-token": token})

    return res.json()

def publish_delivery_days(res, host, port, user, password):
    publish.single("posten/delivery_days", json.dumps(res["delivery_dates"]), hostname=host, auth={"username": user, "password": password}, port=int(port))
    if len(res["delivery_dates"]) == 0:
        print("No delivery dates found")
        return
    
    publish.single("posten/next_delivery", res["delivery_dates"][0], hostname=host, auth={"username": user, "password": password}, port=int(port))
    print("Successfully fetched delivery dates")
    print("Next delivery date: " + res["delivery_dates"][0])

if __name__ == "__main__":
    postalcode = sys.argv[1]
    host = sys.argv[2]
    port = sys.argv[3]
    user = sys.argv[4]
    password = sys.argv[5]

    res = get_delivery_days(postalcode)
    publish_delivery_days(res, host, port, user, password)