#!/bin/bash
killall dhcpcd
killall hostapd
brctl delif br0 eth0
ifconfig br0 down
brctl delbr br0
