# Posten-levering

This is a simple add-on for Home Assistant that fetch delivery dates from posten.no.

## Prerequisites
A MQTT boker is required to be setup and working. It is recommended to use official Home Assistant Mosquitto broker.

Also make sure advanced mode is activated under your profile to be able to add the custom dashboard card.

## Installation
1. Add this add-on repository to home assistant using this link `https://github.com/vegardbeider/ha-addons`'
2. Install the Tellstick MQTT add-on.

## Configuration
Configure all fields under the **Configuration** tab. The add-on will fetch on startup and once a day. 
The devices will be auto discovered by the MQTT integration.

## Dashboard
A simple dashboard card can be found in the [.www](./.www) folder. This card along with the logo file needs to be placed in the www folder inside Home Assistant, it is placed along the configuration.yaml file. After that navigate to Settings -> Dashboards -> Overflow menu -> Resources. Here add a resource with the URL to the custom card e.g.: `/local/posten-levering.js` as a JavaScript module. On the dashboard add a manual card with the following yaml:
```yaml
type: custom:posten-levering
entity: sensor.<your_entity_id>
```