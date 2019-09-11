#!/bin/bash

#SBATCH --job-name=Matlab
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=16GB
#SBATCH --time=1:00:00

module purge
module load matlab/2018a

if [ "$SLURM_JOBTMP" == "" ]; then
    export SLURM_JOBTMP=$SCRATCH/$$ # Use current PID as folder identifier
    mkdir -p $SLURM_JOBTMP
fi
export MATLAB_PREFDIR=$(mktemp -d $SLURM_JOBTMP/matlab-XXXX)

if [ "$MATLAB_LOG_DIR" == "" ]; then export MATLAB_LOG_DIR=$SLURM_JOBTMP; fi

echo
echo "Hostname: $(hostname)"
echo

cat<<EOF | srun matlab -nodisplay

parpool('local', $SLURM_CPUS_PER_TASK)

user_defined_function

exit

EOF

mv res.mat "res_${SLURM_JOB_ID}.mat"
rm -rf $SLURM_JOBTMP
