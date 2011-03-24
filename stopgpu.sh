#!/bin/sh
#
# preparation of the gpu machine file
#
# usage: stopgpu.sh 
#
# 

freegpumachine="$TMPDIR/gpumachine"
FREEGPU="`cat $freegpumachine`"
if [ $FREEGPU != -1 ]; then
rm /usr/local/sge/gpu/`hostname -f`/GPU$FREEGPU
#chmod 777 /usr/local/sge/gpu/`hostname -f`/GPU$FREEGPU
fi

exit 0
