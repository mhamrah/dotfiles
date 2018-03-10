#!/bin/bash
set -m

WIDTH=${1}

# Internal IP
IP=$(ipconfig getifaddr en0)

# Packet loss check
gtimeout 7s ping -c 5 google.com | grep 'loss' | awk '{print $7}' > /dev/null 2>&1
if [[ $? -eq 0 ]]
    then
        PL=$(ping -c 5 google.com | grep 'loss' | awk '{print $7}')
        PL+=" p/l"
    else
        PL=""
fi

# Speedtest
TEMP=$(speedtest-cli --json)
DL=`jq -r .download <<< """$TEMP"""`
UP=`jq -r .upload <<< """$TEMP"""`
DL=$(echo "$DL/1000/1000" | bc -l)
UP=$(echo "$UP/1000/1000" | bc -l)
DL=`printf '%.2f' $DL`
UP=`printf '%.2f' $UP`

# Public IP
PUB_IP=`jq -r .client.ip <<< """$TEMP"""`

if [[ "$PUB_IP" = ";; connection timed out; no servers could be reached" ]]; then
    PUB_IP="Not Available"
elif [[ "$PUB_IP" = "" ]]; then
    PUB_IP="No external access"
fi

internet_info=`airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g'`

if [[ $internet_info -lt 20 ]]; then
    echo -n '#[fg=colour116]'
elif [[ $internet_info -lt 30 ]]; then
    echo -n '#[fg=colour117]'
elif [[ $internet_info -lt 40 ]]; then
    echo -n '#[fg=colour118]'
elif [[ $internet_info -lt 50 ]]; then
    echo -n '#[fg=colour119]'
else
    echo -n '#[fg=colour120]'
fi

SPEED="#[fg=colour86]${DL}↓ ${UP}↑"
SHORT_IP="#[fg=colour197]$IP "
LONG_IP="#[fg=colour197]$IP | $PUB_IP "

if [[ $WIDTH -ge 160 ]]; then
    echo -n " -[$internet_info]db | #[fg=colour81]$PL $SPEED $LONG_IP"
elif [[ $WIDTH -ge 140 ]]; then
    echo -n " -[$internet_info]db | #[fg=colour81]$PL $SPEED $SHORT_IP"
elif [[ $WIDTH -ge 120 ]]; then
    echo -n " -[$internet_info]db | #[fg=colour81]$PL"
fi
