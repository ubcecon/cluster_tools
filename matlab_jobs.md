# Scheduled Non-interactive Matlab jobs

For Matlab, Parallel Computing Toolbox is available on the cluster while distributed computing is not supported. Therefore, in the SLURM submission file we request 1 node with multiple CPUs.

A sample SLURM script is like this
```bash
#!/bin/bash

#SBATCH --job-name=Matlab
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=16GB
#SBATCH --time=1:00:00

module purge
module load matlab/2018a # Choose the Matlab version that you use

cd $SCRATCH # Open your working directory

if [ "$SLURM_JOBTMP" == "" ]; then
    export SLURM_JOBTMP=$SCRATCH/$$ # Create a directory for MATLAB dump files
    mkdir -p $SLURM_JOBTMP
fi
export MATLAB_PREFDIR=$(mktemp -d $SLURM_JOBTMP/matlab-XXXX)

if [ "$MATLAB_LOG_DIR" == "" ]; then export MATLAB_LOG_DIR=$SLURM_JOBTMP; fi

echo
echo "Hostname: $(hostname)"
echo

cat<<EOF | srun matlab -nodisplay

parpool('local', $SLURM_CPUS_PER_TASK)

PUT YOUR MATLAB FUNCTIONS OR SCRIPTS HERE

exit

EOF

rm -rf $SLURM_JOBTMP/*

```

More references and official support from ComputeCanada on [Matlab](https://docs.computecanada.ca/wiki/MATLAB)
