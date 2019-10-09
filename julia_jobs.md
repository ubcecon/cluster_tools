# Scheduled Non-interactive Julia jobs

In Julia 1.2.0, we use `Distributed` library to execute parallel operations. In particular, `Distributed` library supports one node with multiple cores. Use `SharedArrays` library if you have multiple cores read from or write to the same array.

There are two ways to call distributed "for loops" in `Distributed`: use a macro `@distributed` or use a function `pmap`. The difference between the two is on the way they allocate tasks to different cores. A rule of thumb is to use `distributed` if the executions inside the loop is relatively simple. Otherwise, use `pmap`.

1. Learn some [basic SLURM and file transfer commands](SLURM_basic.md)
1. Go to `/example/julia/` in this repository, and copy `submit.sh` and `template.s` to the folder where your Julia file resides
1. Run `bash submit.sh YOUR_FUNCTION_NAME`

An example is provided in this repository under `/example/julia/`. ComputeCanada does not support SLURM mode of `ClusterManagers` library yet.
