#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

HEART='♥ '

source /sys/class/power_supply/BAT0/uevent

current_charge=$POWER_SUPPLY_CHARGE_NOW
total_charge=$POWER_SUPPLY_CHARGE_FULL

charged_slots=$(echo "((($current_charge/$total_charge)*10)/3)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 3 ]]; then
    charged_slots=3
fi

echo -n '#[fg=colour196]'

for i in `seq 1 $charged_slots`; do echo -n "$HEART"; done

if [[ $charged_slots -lt 3 ]]; then
	echo -n '#[fg=colour254]'
	for i in `seq 1 $(echo "3-$charged_slots" | bc)`; do echo -n "$HEART"; done
fi

