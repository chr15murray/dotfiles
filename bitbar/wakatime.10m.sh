#!/bin/bash

wtoday=$(/usr/local/bin/wakatime --today)

wtoday_browsing=$( echo $wtoday | cut -d , -f1)
wtoday_coding=$( echo $wtoday | cut -d , -f2)

echo "🕸 ${wtoday_browsing}"
echo "#⃣ ${wtoday_coding}"

echo "---"
echo "Open Wakatime | href=https://wakatime.com/dashboard"
