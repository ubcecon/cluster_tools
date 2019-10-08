#!/bin/bash

#SBATCH --job-name=Julia
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16GB
#SBATCH --time=1:00:00

module purge
module load gcc/7.3.0 julia/1.2.0

echo
echo "Hostname: $(hostname)"
echo

cat<<EOF | srun julia

using Distributed

# Launch worker processes
num_cores = parse(Int, ENV["SLURM_CPUS_PER_TASK"])
# num_cores = 2
addprocs(num_cores)

include("user_defined_function.jl")

EOF
