# Scheduled Non-interactive Matlab jobs

For Matlab, Parallel Computing Toolbox is available on the cluster while distributed computing is not supported. Therefore, in the SLURM submission file we request 1 node with multiple CPUs.

1. Learn some [basic SLURM and file transfer commands](SLURM_basic.md)
1. Submit your Matlab job with a SLURM script similar to the following one

```bash
#!/bin/bash

#SBATCH --job-name=Matlab_example               # Name your project
#SBATCH --nodes=1                               # Request only 1 node
#SBATCH --ntasks=1                              # Allow shared access between CPUs by allocating the same task
#SBATCH --cpus-per-task=20                      # Specify how many CPUs you need
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

rm -rf $SLURM_JOBTMP

```

An example is provided in this repository under `/example/MATLAB/`. More references and official support from ComputeCanada on [Matlab](https://docs.computecanada.ca/wiki/MATLAB).
