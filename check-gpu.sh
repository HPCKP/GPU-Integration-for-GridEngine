GPUDIR=$SGE_ROOT/gpu

if [ -e $GPUDIR/GPU0 ]; then
	export FREEGPU=0 
elif [ -e $GPUDIR/GPU1 ]; then
	export FREEGPU=1
elif [ -e $GPUDIR/GPU2 ]; then
	export FREEGPU=2
elif [ -e $GPUDIR/GPU3 ]; then
	export FREEGPU=3
else 
	echo "NO EXISTE NINGUNA GPU LIBRE" 
fi

