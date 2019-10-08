# Scheduled Non-interactive Julia jobs

In Julia 1.2.0, we use `Distributed` library to execute parallel operations.

1. Learn some [basic SLURM and file transfer commands](SLURM_basic.md)
1. Go to `/example/julia/` in this repository, and copy `submit.sh` and `template.s` to the folder where your Julia file resides
1. Run `bash submit.sh YOUR_FUNCTION_NAME`

An example is provided in this repository under `/example/julia/`. ComputeCanada does not support `CLusterManagers` library yet.
