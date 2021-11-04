#!/bin/sh
status=$(nmcli n)
if [[ "$status" == "enabled" ]]; then
    nmcli n off
else
    nmcli n on
fi
