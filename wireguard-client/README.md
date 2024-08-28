# WireGuard Client
![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield]

This add-on uses [WireGuard](https://www.wireguard.com/) to create a VPN interface for Home Assistant.

## Prerequisites
Configured and working wireguard tunnel (outside home assistant).

## Installation
1. Add this add-on repository to home assistant using this link `https://github.com/vegardbeider/ha-addons`'
2. Install the WireGuard Client add-on.

## Configuration
On first startup privatekey and publickey pair is created in the config directory for the addon (`addons_config/xxxxxxxx_wg-client`) 
alongside a partially done configuration file that needs to be completed for the add-on to work.
Edit `wg0.conf` to fit it for your configuration. Privatekey for the client is pre-filled using the privatekey created on startup.

## Usage
With the correct configuration your home assistant instance will be connected to you WireGuard VPN.

The add-on is developed to run once. Which means it starts on startup and creates a VPN interface called wg0. The add-on it self does not run all the time in the background.

### Bring down the VPN interface
Run the add-on again to bring down the interface.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg