#!/bin/sh
#$ -pe gpu 1
#$ -q mmb-gpu.q
#$ -cwd


###################################
## load environment
###################################
module load acemd-0.2
module load gromacs-4.5.1-openmm
module load gromacs-4.5.3-gpu

###################################
## read the gpu variables
###################################
setenv machine `cat $TMPDIR/machine`
echo "machine $machine"
###################################
# machine values {g001.mmb.pcb.ub.es,g002.mmb.pcb.ub.es,g003.mmb.pcb.ub.es,g004.mmb.pcb.ub.es}
###################################
setenv gpumachine `cat $TMPDIR/gpumachine`
echo "gpumachine $gpumachine"
######################################
# gpumachine values {0,1,2,3}
######################################



########################################
## example runing acemd
########################################
#acemd file.conf --device $gpumachine



########################################
## assing the gpu variables for gromacs-openmm
########################################
setenv OPENMM_PLATFORM Cuda
setenv CudaDevice $gpumachine

########################################
# example runing gromacs-openmm
########################################
#mdrun-openmm -s file.tpr 

########################################
## assing the gpu variables for gromacs-gpu
########################################
setenv ACCELERATION OpenMM
setenv deviceid $gpumachine
setenv parameter1 `echo "$ACCELERATION":"deviceid=$deviceid"`
########################################
# example runing gromacs-gpu
########################################
#mdrun-gpu -device $parameter1 -s pddtest.tpr

########################################
# example runing pmemd.cuda
########################################
#module load amber-11
#pmemd.cuda -O -i mdin -o mdout -p prmtop -c inpcrd -r restrt -x mdcrd -gpu $gpumachine


sleep 15
