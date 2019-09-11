# Scheduled Non-interactive Matlab jobs

For Matlab, Parallel Computing Toolbox is available on the cluster while distributed computing is not supported. Therefore, in the SLURM submission file we request 1 node with multiple CPUs.

1. Learn some [basic SLURM and file transfer commands](SLURM_basic.md)
1. Go to `/example/MATLAB/` in this repository, and copy `submit.sh` and `template.s` to the folder where your Matlab function resides
1. Run `bash submit.sh YOUR_FUNCTION_NAME`

An example is provided in this repository under `/example/MATLAB/`. More references and official support from ComputeCanada on [Matlab](https://docs.computecanada.ca/wiki/MATLAB).
