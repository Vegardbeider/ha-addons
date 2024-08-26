# Tellstick MQTT Add-on
This add-on converts a fork of telldus-core-mqtt created by mliljedahl to an add-on for Home Assistant.

## Prerequisites
1. Running and working MQTT broker.
2. Working MQTT Integration.

## Installation/Configuration
1. Add this add-on repository to home assistant using this link `https://github.com/vegardbeider/ha-addons`'
2. Install the Tellstick MQTT add-on.
3. Head to the configuration tab and enter details for the MQTT broker.
4. Configure `telldus_repeat_cmd`. Number of times telldus repeats a outgoing command, can be increased or descresed to match needs. Default is 3.
5. Start the add-on to create the configuration directory in the `addons_config` directory.
6. Navigate to the `addons_config/xxxxxxxx_tellstick-mqtt` folder (e.g.: using Samba), add the [`tellstick.conf`]() and edit the file according to your setup. Follow this documentation for configuring [Tellstick_conf](https://developer.telldus.com/wiki/TellStick_conf).
7. Start the Tellstick MQTT add-on.

## Usage
Once everything is installed and configured the MQTT Integration should start to detect devices from the MQTT broker sent by the add-on. This includes the devices configured in the `tellstick.conf` file, and sensors that are detected by the tellstick are automatically published to the MQTT broker.

## Blueprint
The file [mqtt-433-switches.yaml](https://github.com/Vegardbeider/ha-addons/edit/main/tellstick-mqtt/mqtt-433-switches.yaml) is a blueprint that be used to simplify the process of using tellstick remotes to trigger actions.
