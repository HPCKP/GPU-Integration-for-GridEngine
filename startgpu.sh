#!/bin/sh
#
#
# preparation of the gpu machine file
#
# usage: startgpu.sh 
#
# 

#freegpumachine="$TMPDIR/gpumachine"

#$SGE_ROOT/gpu/gpu > $freegpumachine
echo `hostname -f` > "$TMPDIR/machine"
machine="`hostname -f`"
export machine

#GPUDIR=$SGE_ROOT/gpu
GPUDIR=/usr/local/sge/gpu/`hostname -f`

if [ ! -e $GPUDIR/GPU0 ]; then
	touch $GPUDIR/GPU0 
        export FREEGPU=0
elif [ ! -e $GPUDIR/GPU1 ]; then
	touch $GPUDIR/GPU1 
        export FREEGPU=1
elif [ ! -e $GPUDIR/GPU2 ]; then
	touch $GPUDIR/GPU2 
        export FREEGPU=2
elif [ ! -e $GPUDIR/GPU3 ]; then
	touch $GPUDIR/GPU3 
        export FREEGPU=3
else
        echo "NO EXISTE NINGUNA GPU LIBRE"
	export FREEGPU=-1
fi

freegpumachine="$TMPDIR/gpumachine"

echo "$FREEGPU" > $freegpumachine

exit 0
