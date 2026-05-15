# homeassistant-rtl433-integration

Scripts and instructions to integrate serial data feeds via rtl_433 to Home Assistant

# Purpse

Connecting RF serial devices such as weather stations into Home Assistant.

## Requirements

### Hardware

- DVB-T reciever connected to a Linux based host - a Raspberry Pi is a good solution, that is on the same network as the Home Assistant host.

### Software

#### rtl_433

The rtl_433 project][rtl_433] is a data receiver able to decode many RF serial devices and has direct support to push the data to an MQTT Broker

[rtl_433]: https://github.com/merbanan/rtl_433

#### MQTT Broker


[MQTT](https://mqtt.org) is utilised as the messaging protocol between rtl_433 and Home Assistant


The easiest way to run a broker with Home Assistant is to utilise the Mosquitto Broker app for Home Assistant following the MQTT integration instructions][ha-mqtt]

[ha-mqtt]: https://www.home-assistant.io/integrations/mqtt

## Setting up rtl_433

### Installation

On a Raspberry Pi, assumed to be running Raspian and with internet access, clone the rtl_433 Github repository using

```bash
git clone https://github.com/merbanan/rtl_433.git
```

Follow the instructions in the rtl_433/docs/BUILDING.md to build and install the rtl_433 binary, summarised as

```bash
sudo apt install build-essential cmake
cd rtl_433/
cmake -B build
sudo cmake --build build --target install
```

Install the rtl-sdr rules using

```bash
git clone https://github.com/osmocom/rtl-sdr
sudo cp ./rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/20-rtl-sdr.rules
sudo reboot
```

### Testing

Test using

```bash
rtl_test
```

### Running

Edit the script to `run_rtl433.sh` to define the address of the MQTT_BROKER. Is using the Home Assistant Mosquitto app, the address will be the hostname
of the Home Assistant host.

Run the script using the following to put the rtl_433 process into the background.


```bash
nohup ./run_rtl433.sh &
```

To stop any existing running instance of rtl_433 use `ps -aef | grep rtl_433` to get the process ID (PID) and then run `kill <PID>`.

