#!/bin/bash
dpkg -s bc > /dev/null 2>&1; if [ "$(echo $?)" != "0" ]; then apt-get -y install bc; fi
while true; do
BALANCE=$(/usr/bin/yarn --cwd ${HOME}/ironfish/ironfish-cli/ ironfish accounts:balance $IRONFISH_WALLET | egrep "Amount available to spend" | awk '{ print $6 }')
echo -e $(date): '\033[1;32m'"Available balance is ${BALANCE}"'\033[0m'
if (( $(echo "${BALANCE} >= 0.10000001" | bc -l) )); then
 echo -e '\033[1;32m'"Transaction:"'\033[0m'
 /usr/bin/yarn --cwd ${HOME}/ironfish/ironfish-cli/ start deposit --confirm
 echo -e '\033[0;31m'"-------------------------------------------------------------"'\033[0m'
else
 sleep $[ (120 + $RANDOM % 10 ) ]s
fi
done
