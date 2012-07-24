#!/bin/bash
/etc/rc.d/networkmanager stop
killall dhcpcd
ifconfig eth0 down
ifconfig wlan0 down
echo 1 > /proc/sys/net/ipv4/ip_forward
brctl addbr br0
brctl addif br0 eth0
brctl setfd br0 0
hostapd -B /etc/hostapd/hostapd.conf
ifconfig eth0 up
ifconfig br0 up
dhcpcd br0
