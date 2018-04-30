#!/bin/bash -l

#SBATCH
#SBATCH --job-name=tr_Hbb_weighted
#SBATCH --time=24:0:0
#SBATCH --partition=shared
#SBATCH --nodes=1
# number of tasks (processes) per node
#SBATCH --ntasks-per-node=24
# number of cpus (threads) per task (process)
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=end
#SBATCH --mail-user=yzhou49@jhu.edu

#### load and unload modules you may need
# module unload openmpi/intel
# module load mvapich2/gcc/64/2.0b
#module list

#### execute code and write output file to OUT-24log.
time mpiexec ./JHUGen PDFSet=2 Collider=1 Process=51 VH_PC=tr Unweighted=0 HbbDK=1 WriteWeightedLHE=1 VegasNc1=100000 VegasNc2=1000000 DataFile=data/tr_14_Hbb_SM_1M_weighted FacScheme=2 RenScheme=2 MuFacMultiplier=1d0 MuRenMultiplier=1d0 Interf=0 Seed=1 > OUT-24log
echo "Finished with job $SLURM_JOBID"



#### mpiexec by default launches number of tasks requested
