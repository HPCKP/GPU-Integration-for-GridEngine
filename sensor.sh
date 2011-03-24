#!/bin/sh

myhost=`uname -n`

while [ 1 ]; do
     # wait for input
     read input
     result=$?
     if [ $result != 3 ]; then
          exit 1
     fi
     if [ "$input" = quit ]; then
          exit 0
     fi    
     #send users logged in
     logins=`who | cut -f1 -d" " | sort | uniq | wc -l | sed "s/^ *//"`
     echo begin
     echo "$myhost:logins:$logins"
     echo end
done


