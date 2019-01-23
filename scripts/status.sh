#!/usr/bin/bash

echo $(sh ./yChunkUbar/scripts/time_script)@$(sh ./yChunkUbar/scripts/date_script)@$(sh ./yChunkUbar/scripts/battery_percentage_script)%@$(sh ./yChunkUbar/scripts/battery_charging_script)@$(sh ./yChunkUbar/scripts/wifi_status_script)@$(sh ./yChunkUbar/scripts/getVolumeStat.sh)

