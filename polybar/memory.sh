#!/usr/bin/env bash

string=$(free -m | grep Mem)
used=$(echo $string | awk '{print $3/1024}')
shared=$(echo $string | awk '{print $5/1024}')
total=$(echo $string | awk '{print $2/1024}')
occupied=$(echo $used + $shared | bc)
printf -v Occupied "%0.1f" $occupied
printf -v Total "%0.1f" $total
echo -e "$Occupied / $Total GiB "
