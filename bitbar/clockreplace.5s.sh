#!/bin/bash

titleemoji=":monkey_face:"
datetime=$(date "+%H:%M %a %d %b")

echo "${titleemoji} ${datetime}"
echo "---"
# Google Calendar link
echo ":calendar: ${datetime} (Open Cal) | href=https://calendar.google.com"

# Calendar Popout
# One month
#cal |awk 'NF'|while IFS= read -r i; do echo "--$i"|perl -pe '$b="\b";s/ _$b(\d)_$b(\d) /(\1\2)/' |perl -pe '$b="\b";s/_$b _$b(\d) /(\1)/' |sed 's/ *$//' |sed "s/$/|trim=false font=Monaco/"; done 
# Three Month
cal -3 |awk 'NF'|sed 's/ $//' |while IFS= read -r i; do echo "--$i|trim=false font=Monaco"|  perl -pe '$b="\b";s/ _$b(\d)_$b(\d) /(\1\2)/' |perl -pe '$b="\b";s/_$b _$b(\d) /(\1)/'  ; done

