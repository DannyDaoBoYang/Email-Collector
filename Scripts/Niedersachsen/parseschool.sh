#!/bin/bash

cat aschool.txt | grep -a mailto | awk -F\: '{print $2}' | awk -F\" '{print $1}' > email.txt
grep '<b>' -a aschool.txt | awk -F'<b>' '{print $2}' | awk -F'</b>' '{print $1}' > name.txt
echo "$(head -n1 name.txt),$(head -n1 email.txt)"

