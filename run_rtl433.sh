#!/usr/bin/env bash

# Scipt to run rtl_433 with options to 
#   send data via MQTT
#   convert data to SI units (-C si)

# Run using
#   nohup ./run_rtl433.sh &


MQTT_BROKER=broker-host.local


MQTT_USERNAME=mqttuser
MQTT_PASSWORD="changeme"

rtl_433 -C si -F "mqtt://${BROKER}:1883,user=${MQTT_USERNAME},pass=${MQTT_PASSWORD},events=rtl433[/id]" -F log

