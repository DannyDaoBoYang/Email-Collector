#!/bin/bash

#E-Mail
#<h3
wget -O rawschool.txt $1
cat rawschool.txt | grep 'E-Mail' | awk -F\> '{print $2}' | awk -F\< '{print $1}' > email.txt
cat rawschool.txt | grep '<h3' | awk -F\> '{print $2}' | awk -F\< '{print $1}'> schoolname.txt
echo "$(head -n1 schoolname.txt),$(head -n1 email.txt)"



