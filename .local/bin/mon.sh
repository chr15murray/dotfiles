#!/bin/bash

hyprctl monitors >/tmp/monitor

var=$(sed -n '1{p;q}' /tmp/monitor | awk '{ print $2 }')

var1=$(sed -n '2{p;q}' /tmp/monitor | awk '{ print $1 }')

var2=$(sed -n '2{p;q}' /tmp/monitor | awk '{ print $3 }')

#var3=$(sed -n '10{p;q}' /tmp/monitor | awk '{ print $2 }')
# Hardcode the scaling factor
var3=1.00

var4="$var, $var1, $var2, $var3"

sed -i "/monitor=/c\monitor= $var4" .config/hypr/hyprland.conf
