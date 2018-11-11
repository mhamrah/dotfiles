#!/bin/bash

HEART='❤'

if [[ $(uname) == "Darwin" ]]; then
  battery_info=`pmset -g batt`
  current_charge=$(echo $battery_info | grep -o '[0-9]\+%' | awk '{sub (/%/, "", $1); print $1}')
elif [[ $(uname) == "Linux" ]]; then
  current_charge=`cat /sys/class/power_supply/BAT0/capacity`
fi

if [[ $current_charge -lt 30 ]]; then
    echo -n '#[fg=colour154]'
elif [[ $current_charge -lt 50 ]]; then
    echo -n '#[fg=colour155]'
elif [[ $current_charge -lt 70 ]]; then
    echo -n '#[fg=colour156]'
elif [[ $current_charge -lt 90 ]]; then
    echo -n '#[fg=colour157]'
else
    echo -n '#[fg=colour158]'
fi

echo -n "$HEART $current_charge%"
